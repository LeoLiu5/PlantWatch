import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import '../app_theme.dart';
import 'home_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FolderListScreenAnalysis extends StatefulWidget {
  @override
  _FolderListScreenAnalysisState createState() =>
      _FolderListScreenAnalysisState();
}

class _FolderListScreenAnalysisState extends State<FolderListScreenAnalysis> {
  List<String> folders = [];

  @override
  void initState() {
    super.initState();
    fetchFolders().then((folderList) {
      setState(() {
        folders = folderList.toList(); // Reverse the order of folders
      });
    });
  }

  Future<List<String>> fetchFolders() async {
    ListResult result = await FirebaseStorage.instance.ref().listAll();
    List<String> folders =
        result.prefixes.map((folder) => folder.name).toList();
    // Sort the folders list based on the date in descending order
    // Sort the folders list based on the month (substring from index 3 to 5) and then on the date (substring from index 0 to 2)
    folders.sort((folder1, folder2) {
      String monthSubstring1 = folder1.substring(3, 5);
      String monthSubstring2 = folder2.substring(3, 5);
      int monthComparison = monthSubstring2.compareTo(monthSubstring1);
      if (monthComparison != 0) {
        return monthComparison; // Sort based on the month first
      } else {
        String dateSubstring1 = folder1.substring(0, 2);
        String dateSubstring2 = folder2.substring(0, 2);
        return dateSubstring2.compareTo(
            dateSubstring1); // Sort based on the date if the months are the same
      }
    });
    return folders;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(0),
        child: SizedBox(
          height: 800.0,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 120,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: folders.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Card(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            String folderName = folders[index];

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SingleDeviceGraph(folderName: folderName),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Icon(Icons.folder),
                            title: Text(
                              folders[index],
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: Icon(Icons.arrow_forward),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              getAppBarUI(),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: FloatingActionButton(
              heroTag: null,
              focusColor: Colors.green,
              autofocus: true,
              tooltip: 'Go back to the home page',
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ),
                );
              },
              child: const Icon(Icons.home),
            ),
          ),
        ],
      ),
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(32.0),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppTheme.grey.withOpacity(0.5),
                offset: const Offset(1.1, 1.1),
                blurRadius: 10.0,
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 5,
                  bottom: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Graphic Analysis',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: AppTheme.fontName,
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                            letterSpacing: 1.2,
                            color: AppTheme.darkerText,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
                      child: Row(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(
                              Icons.calendar_today,
                              color: AppTheme.grey,
                              size: 18,
                            ),
                          ),
                          Text(
                            '${DateTime.now().year} - ${DateTime.now().month} - ${DateTime.now().day}',
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontFamily: AppTheme.fontName,
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              letterSpacing: -0.2,
                              color: AppTheme.darkerText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DeviceData {
  final String date;
  final double tds;
  final double distance;
  final double humidity;
  final double temperature;

  DeviceData({
    required this.date,
    required this.tds,
    required this.distance,
    required this.humidity,
    required this.temperature,
  });
}

class SingleDeviceGraph extends StatefulWidget {
  final String folderName;

  const SingleDeviceGraph({Key? key, required this.folderName})
      : super(key: key);

  @override
  _SingleDeviceGraphState createState() => _SingleDeviceGraphState();
}

class _SingleDeviceGraphState extends State<SingleDeviceGraph> {
  List<DeviceData> _data = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    print('20' +
        widget.folderName.toString().substring(6, 8) +
        '-' +
        widget.folderName.toString().substring(3, 5) +
        '-' +
        widget.folderName.toString().substring(0, 2));
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('20' +
            widget.folderName.toString().substring(6, 8) +
            '-' +
            widget.folderName.toString().substring(3, 5) +
            '-' +
            widget.folderName.toString().substring(0, 2))
        .get();

    List<DeviceData> data = [];
    snapshot.docs.forEach((doc) {
      String date = doc.id;
      Map<String, dynamic>? docData = doc.data() as Map<String, dynamic>?;

      if (docData != null) {
        double tds = docData['TDS'] as double? ?? 0.0;
        double distance = docData['distance'] as double? ?? 0.0;
        double humidity = docData['humidity'] as double? ?? 0.0;
        double temperature = docData['temperature'] as double? ?? 0.0;

        data.add(
          DeviceData(
            date: date,
            tds: tds,
            distance: distance,
            humidity: humidity,
            temperature: temperature,
          ),
        );
      }
    });

    setState(() {
      _data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: getAppBarUI(),
      ),
      body: _data.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  _buildGraph(
                      _data, 'Temperature (°C)', Colors.red, 'temperature'),
                  _buildGraph(
                      _data, 'Humidity (%)', Colors.lightBlue, 'humidity'),
                  _buildGraph(_data, 'TDS (ppm)', Colors.orange, 'tds'),
                  _buildGraph(
                      _data, 'Water level (cm)', Colors.blue, 'distance'),
                  SizedBox(
                    height: MediaQuery.of(context).padding.bottom,
                  ),
                ],
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: FloatingActionButton(
              heroTag: null,
              focusColor: Colors.green,
              autofocus: true,
              tooltip: 'Go back to the home page',
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ),
                );
                // Do something
              },
              child: const Icon(Icons.home),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGraph(List<DeviceData> data, String variable, Color color,
      String propertyName) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '$variable',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 300,
              child: SfCartesianChart(
                plotAreaBorderWidth: 0,
                primaryXAxis: CategoryAxis(
                  labelRotation: 45,
                  labelStyle: TextStyle(
                    color: Colors.black87,
                  ),
                  majorGridLines: MajorGridLines(
                    width: 0,
                  ),
                ),
                primaryYAxis: NumericAxis(
                  title: null,
                  labelStyle: TextStyle(
                    color: Colors.black87,
                  ),
                  majorGridLines: MajorGridLines(
                    width: 1,
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  axisLine: AxisLine(
                    color: Colors.grey.withOpacity(0.4),
                  ),
                  numberFormat: NumberFormat.decimalPattern(),
                ),
                series: _createSeries(data, variable, color),
                trackballBehavior: TrackballBehavior(
                  enable: true,
                  activationMode: ActivationMode.singleTap,
                  tooltipSettings: InteractiveTooltip(
                    enable: true,
                    color: Colors.white,
                    textStyle: TextStyle(
                      color: Colors.black87,
                    ),
                    format: 'Time: point.x ; Value: point.y',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(32.0),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppTheme.grey.withOpacity(0.5),
                offset: const Offset(1.1, 1.1),
                blurRadius: 10.0,
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 5,
                  bottom: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Daily Trend',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: AppTheme.fontName,
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                            letterSpacing: 1.2,
                            color: AppTheme.darkerText,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
                      child: Row(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(
                              Icons.calendar_today,
                              color: AppTheme.grey,
                              size: 18,
                            ),
                          ),
                          Text(
                            '20${widget.folderName.toString().substring(6, 8)} - ${widget.folderName.toString().substring(3, 5)} - ${widget.folderName.toString().substring(0, 2)}',
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontFamily: AppTheme.fontName,
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              letterSpacing: -0.2,
                              color: AppTheme.darkerText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<LineSeries<DeviceData, String>> _createSeries(
      List<DeviceData> data, String variable, Color color) {
    data.sort((a, b) => a.date.compareTo(b.date));
    return [
      LineSeries<DeviceData, String>(
        dataSource: data,
        xValueMapper: (DeviceData data, _) => data.date,
        yValueMapper: (DeviceData data, _) {
          switch (variable) {
            case 'TDS (ppm)':
              return data.tds;
            case 'Water level (cm)':
              return data.distance;
            case 'Humidity (%)':
              return data.humidity;
            case 'Temperature (°C)':
              return data.temperature;
            default:
              return 0.0;
          }
        },
        color: color,
        markerSettings: MarkerSettings(
          isVisible: true,
          width: 2, // Adjust the width of the data points
          height: 2, // Adjust the height of the data points
        ),
      ),
    ];
  }
}
