import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:circle_button/circle_button.dart';
import 'package:screen_loader/screen_loader.dart';

import 'Detail_screen/Capsule_wave_view.dart';

import 'app_theme.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'home_screen.dart';

double TDS = 580.92;

double Humidity = 37.2;
double Temperature = 22.7;
double distance = 6;
String LED = "on";

class status extends StatefulWidget {
  @override
  _statusState createState() => _statusState();
}

//"ScreenLoader" shows and hides the loader without updating the
//state of the widget which increases the performance
class _statusState extends State<status> with ScreenLoader {
  @override
  void initState() {
    fetch();

    super.initState();
  }

  updateList(double a, double b, double c, double d) {
    setState(() {
      TDS = a;
      distance = b;
      Humidity = c;
      Temperature = d;
    });
  }

  updateLED(String d) {
    setState(() {
      LED = d;
    });
  }

  void updateData(BuildContext context) async {
    if (LED == "on") {
      try {
        // Update the  field in the document with the current time
        await FirebaseFirestore.instance
            .collection('LED')
            .doc('Status')
            .update({
          'now': "off",
        });
        updateLED("off");
        // Show a snackbar with a success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('LED Supplemental Lighting turned off!'),
          ),
        );
      } catch (e) {
        // Show a snackbar with an error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not update current energy consumption: $e'),
          ),
        );
        print('Error updating data: $e');
      }
    } else {
      try {
        // Update the  field in the document with the current time
        await FirebaseFirestore.instance
            .collection('LED')
            .doc('Status')
            .update({
          'now': "on",
        });
        updateLED("on");
        // Show a snackbar with a success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('LED Supplemental Lighting turned on!'),
          ),
        );
      } catch (e) {
        // Show a snackbar with an error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not update current energy consumption: $e'),
          ),
        );
        print('Error updating data: $e');
      }
    }
  }

  Future<void> fetch() async {
    // startLoading(); //Function from the "screen_loader" library, Showing the Loading screen while connecting to the MQTT server

    try {
      // Get the document snapshot for today's date from the 'Date' collection
      // DocumentSnapshot snapshot = await FirebaseFirestore.instance
      //     .collection('${DateTime.now().toString().substring(0, 10)}')
      //     .doc('${DateTime.now().toString().substring(11, 16)}')
      //     .get();
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('${DateTime.now().toString().substring(0, 10)}')
          .limit(1)
          .get();

      DocumentSnapshot snapshotLED = await FirebaseFirestore.instance
          .collection('LED')
          .doc('Status')
          .get();
      print("${DateTime.now()}");
      print('QuerySnapshot: $snapshot');
      // If the document exists
      if (snapshot.docs.isNotEmpty) {
        DocumentSnapshot newestDocument = snapshot.docs.first;
        // Retrieve the value  field from the document
        // double Temperature = snapshot.get('Temperature');
        // int Humidity = snapshot.get('Humidity');
        // int TDS = snapshot.get('TDS');
        // Show the retrieved value
        updateList(
          newestDocument.get('TDS'),
          newestDocument.get('distance'),
          newestDocument.get('humidity'),
          newestDocument.get('temperature'),
        );
        updateLED(
          snapshotLED.get('now'),
        );
        // Show a snackbar with the retrieved value
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Retrieved values: $Temperature, $Humidity, $TDS'),
        ));
      } else {
        // Show a snackbar indicating that the document does not exist
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Document does not exist for today\'s date'),
        ));
      }
    } catch (e) {
      // Show a snackbar with an error message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Could not fetch data: $e'),
      ));
      print('Error fetching data: $e');
    }
    // await new Future.delayed(const Duration(seconds: 5));
    //  stopLoading(); //Function from the "screen_loader" library, Closing the Loading screen after the mqtt data is updated
  }

  @override
  void dispose() {
    print('client disconnected');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return loadableWidget(
        child: Container(
            color: AppTheme.background,
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(100.0),
                child: getAppBarUI(),
              ),
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                //Allow this page to be scrolled
                child: Stack(
                  children: <Widget>[
                    const Padding(
                        padding: EdgeInsets.only(
                          top: 70,
                        ),
                        child: TitleView(
                          titleTxt:
                              'Real-Time Status (updating every 5 minutes)',
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 110),
                        child: PowerView()),
                    const Padding(
                        padding: EdgeInsets.only(
                          top: 830,
                        ),
                        child: TitleView(
                          titleTxt: 'Hydroponic Nutrients Status',
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 850),
                        child: Electricity()),
                  ],
                ),
              ),
              // The Refresh floating button
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endContained,
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
                  Positioned(
                    bottom: 80,
                    right: 0,
                    child: FloatingActionButton(
                      heroTag: null,
                      focusColor: Colors.green,
                      tooltip: 'Fetch the latest data',
                      autofocus: true,
                      onPressed: fetch,
                      // onPressed:() => add(context),

                      child: const Icon(Icons.refresh),
                    ),
                  ),
                ],
              ),
            )));
  }

  Widget getAppBarUI() {
    return Column(children: <Widget>[
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
                blurRadius: 10.0),
          ],
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 5, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Plant Watch',
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
                  SizedBox(
                    height: 38,
                    width: 38,
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(32.0)),
                      onTap: () {
                        print("client disconnected");
                      },
                      child: const Center(
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: AppTheme.grey,
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
                  SizedBox(
                    height: 38,
                    width: 38,
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(32.0)),
                      onTap: () {
                        print("client disconnected");
                        Navigator.push<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) => status(),
                          ),
                        );
                      },
                      child: const Center(
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: AppTheme.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ]);
  }

  Widget PowerView() {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 18),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topRight: Radius.circular(68.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppTheme.grey.withOpacity(0.2),
                offset: const Offset(1.1, 1.1),
                blurRadius: 10.0),
          ],
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                height: 120,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: HexColor('#F56E98').withOpacity(0.5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4.0)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 4, bottom: 2),
                                      child: Text(
                                        'Temperature',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: AppTheme.fontName,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          letterSpacing: -0.1,
                                          color: AppTheme.grey.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 28,
                                          height: 28,
                                          child: Image.asset(
                                              "assets/app/burned.png"),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 4, bottom: 3),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4, bottom: 3),
                                          child: Text(
                                            '${(Temperature).toStringAsFixed(2)} °C',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: AppTheme.fontName,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              letterSpacing: -0.2,
                                              color: AppTheme.grey
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 38,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                height: 120,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: HexColor('#87A0E5').withOpacity(0.5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4.0)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 4, bottom: 2),
                                      child: Text(
                                        'Relative Humidity',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: AppTheme.fontName,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          letterSpacing: -0.1,
                                          color: AppTheme.grey.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 28,
                                          height: 28,
                                          child: Image.asset(
                                              "assets/app/humidity.png"),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 4, bottom: 3),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4, bottom: 3),
                                          child: Text(
                                            '$Humidity %',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: AppTheme.fontName,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              letterSpacing: -0.2,
                                              color: AppTheme.grey
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 38,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                height: 120,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: HexColor('#87A0E5'),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4.0)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 4, bottom: 2),
                                      child: Text(
                                        'Water Level',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: AppTheme.fontName,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          letterSpacing: -0.1,
                                          color: AppTheme.grey.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 28,
                                          height: 28,
                                          child: Image.asset(
                                              "assets/app/eaten.png"),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 4, bottom: 3),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4, bottom: 3),
                                          child: Text(
                                            '${8 - (distance)} cm',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: AppTheme.fontName,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              letterSpacing: -0.2,
                                              color: AppTheme.grey
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 38,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                height: 120,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: HexColor('#a602b5').withOpacity(0.5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4.0)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 4, bottom: 2),
                                      child: Text(
                                        'LED Lighting',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: AppTheme.fontName,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          letterSpacing: -0.1,
                                          color: AppTheme.grey.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 24,
                                          height: 24,
                                          child:
                                              // "assets/app/bell.png"),
                                              Image.asset("assets/app/LED.png"),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 4, bottom: 3),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4, bottom: 3),
                                          child: Text(
                                            '$LED',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: AppTheme.fontName,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              letterSpacing: -0.2,
                                              color: AppTheme.grey
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: AppTheme.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100.0),
                              ),
                              border: Border.all(
                                  width: 4,
                                  color:
                                      AppTheme.nearlyDarkBlue.withOpacity(0.2)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '${(Temperature).toStringAsFixed(2)} °C',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontName,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    letterSpacing: 0.0,
                                    color: AppTheme.grey.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),

                          //Adding the blue color gradient to represent the current active power value.

                          child: CustomPaint(
                            painter: CurvePainter(
                                colors: [
                                  HexColor("#8A98E8"),
                                  Color.fromARGB(255, 197, 38, 38),
                                ],
                                //The temperature is estimated to range from 17 to 27.
                                //Tne responsive circle is 360 degree and is then
                                //divided into 10 portions (36 degrees each):
                                angle: (10 * Temperature).toDouble()),
                            child: const SizedBox(
                              width: 108,
                              height: 108,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 150),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: AppTheme.white,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(100.0),
                                    ),
                                    border: Border.all(
                                        width: 4,
                                        color: AppTheme.nearlyDarkBlue
                                            .withOpacity(0.2)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '$Humidity %',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: AppTheme.fontName,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          letterSpacing: 0.0,
                                          color: AppTheme.grey.withOpacity(0.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),

                                //Adding the blue color gradient to represent the current active power value.

                                child: CustomPaint(
                                  painter: CurvePainter(
                                      colors: [
                                        HexColor("#8A98E8").withOpacity(0.5),
                                        AppTheme.nearlyDarkBlue
                                            .withOpacity(0.5),
                                        AppTheme.nearlyDarkBlue
                                            .withOpacity(0.5),
                                      ],
                                      //The maxmium relative humidity is 100 %.
                                      //Tne responsive circle is 360 degree and is then
                                      //divided into 100 portions (3.6 degrees each):
                                      angle: (3.6 * Humidity).toDouble()),
                                  child: const SizedBox(
                                    width: 108,
                                    height: 108,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),

                          //Adding the blue color gradient to represent the current active power value.

                          child: CustomPaint(
                            painter: CurvePainter(
                                colors: [
                                  HexColor("#8A98E8"),
                                  Color.fromARGB(255, 197, 38, 38),
                                ],
                                //The temperature is estimated to range from 17 to 27.
                                //Tne responsive circle is 360 degree and is then
                                //divided into 10 portions (36 degrees each):
                                angle: (10 * Temperature).toDouble()),
                            child: const SizedBox(
                              width: 108,
                              height: 108,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 310),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: AppTheme.white,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(100.0),
                                    ),
                                    border: Border.all(
                                        width: 4,
                                        color: AppTheme.nearlyDarkBlue
                                            .withOpacity(0.2)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        ' ${8 - (distance)} cm',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: AppTheme.fontName,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          letterSpacing: 0.0,
                                          color: AppTheme.grey.withOpacity(0.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),

                                //Adding the blue color gradient to represent the current active power value.

                                child: CustomPaint(
                                  painter: CurvePainter(
                                      colors: [
                                        HexColor("#8A98E8"),
                                        AppTheme.nearlyDarkBlue,
                                        AppTheme.nearlyDarkBlue,
                                      ],
                                      //The maxmium distance is 4 cm.
                                      //Tne responsive circle is 360 degree and is then
                                      //divided into 6 portions (90 degrees each):
                                      angle: (90 * (8 - distance)).toDouble()),
                                  child: const SizedBox(
                                    width: 108,
                                    height: 108,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 470, left: 6),
                          child: CircleButton(
                            onTap: () => updateData(context),
                            tooltip: 'Circle Button',
                            width: 100.0,
                            height: 100.0,
                            borderColor: HexColor('#a602b5').withOpacity(0.5),
                            borderWidth: 5.0,
                            borderStyle: BorderStyle.solid,
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            child: Icon(
                              Icons.power_settings_new,
                              color: HexColor('#a602b5').withOpacity(0.5),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
              child: Container(
                height: 2,
                decoration: const BoxDecoration(
                  color: AppTheme.background,
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Electricity() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 18),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topRight: Radius.circular(68.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppTheme.grey.withOpacity(0.2),
                offset: const Offset(1.1, 1.1),
                blurRadius: 10.0),
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 4, bottom: 3),
                              child: Text(
                                '$TDS',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: AppTheme.fontName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 32,
                                  color: AppTheme.nearlyDarkBlue,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 8, bottom: 8),
                              child: Text(
                                'PPM',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: AppTheme.fontName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  letterSpacing: -0.2,
                                  color: AppTheme.nearlyDarkBlue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 7,
                            bottom: 14,
                          ),
                          child: Text(
                            'Total dissolved solids (TDS) measure salt, nutrients, and other concentrates present in the water.',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: AppTheme.fontName,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              letterSpacing: 1.0,
                              color: AppTheme.darkText,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 4, right: 4, top: 8, bottom: 16),
                      child: Container(
                        height: 5,
                        decoration: const BoxDecoration(
                          color: AppTheme.background,
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 2),
                                child: Icon(
                                  Icons.add_task,
                                  color: AppTheme.grey.withOpacity(0.5),
                                  size: 16,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 7.0, top: 5),
                                child: Text(
                                  '300 ~ 840 ppm',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    letterSpacing: 0.0,
                                    color: AppTheme.grey.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, right: 17),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Image.asset('assets/app/bell.png'),
                                ),
                                Flexible(
                                  child: Text(
                                    'A proper TDS level prevents vegetables from too little or too many nutrients!',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: AppTheme.fontName,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      letterSpacing: 1.0,
                                      color: HexColor('#F65283'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 34,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: AppTheme.nearlyWhite,
                        shape: BoxShape.circle,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: AppTheme.nearlyDarkBlue.withOpacity(0.4),
                              offset: const Offset(4.0, 4.0),
                              blurRadius: 8.0),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Icon(
                          Icons.water_drop,
                          color: AppTheme.nearlyDarkBlue,
                          size: 24,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppTheme.nearlyWhite,
                        shape: BoxShape.circle,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: AppTheme.nearlyDarkBlue.withOpacity(0.4),
                              offset: const Offset(4.0, 4.0),
                              blurRadius: 8.0),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Icon(
                          Icons.opacity,
                          color: AppTheme.nearlyDarkBlue,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 8, top: 16),
                child: Container(
                  width: 60,
                  height: 160,
                  decoration: BoxDecoration(
                    color: HexColor('#E8EDFE'),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(80.0),
                        bottomLeft: Radius.circular(80.0),
                        bottomRight: Radius.circular(80.0),
                        topRight: Radius.circular(80.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: AppTheme.grey.withOpacity(0.4),
                          offset: const Offset(2, 2),
                          blurRadius: 4),
                    ],
                  ),
                  child: WaveView(
                    percentageValue: (TDS - 360) / 540 * 100,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
