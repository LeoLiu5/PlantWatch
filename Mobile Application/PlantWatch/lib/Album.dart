import 'dart:io';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'home_screen.dart';
import 'package:photo_view/photo_view.dart';
import 'app_theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

String folderName = "";
String FileName = "";

class FolderListScreen extends StatefulWidget {
  @override
  _FolderListScreenState createState() => _FolderListScreenState();
}

class _FolderListScreenState extends State<FolderListScreen> {
  List<String> folders = [];

  @override
  void initState() {
    super.initState();
    fetchFolders().then((folderList) {
      setState(() {
        folders = folderList.toList();
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
                    top: 80,
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
                              // String folderName = folders[index];

                              setState(() {
                                folderName = folders[index];
                              });

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ImageListScreen(folderPath: folderName),
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
                )
              ],
            )),
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
                        'Album List',
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
            )
          ],
        ),
      ),
    ]);
  }
}

class ImageListScreen extends StatefulWidget {
  final String folderPath;

  ImageListScreen({required this.folderPath});

  @override
  _ImageListScreenState createState() => _ImageListScreenState();
}

class _ImageListScreenState extends State<ImageListScreen> {
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();

    loadImages();
  }

  Future<void> loadImages() async {
    try {
      ListResult result =
          await FirebaseStorage.instance.ref(widget.folderPath).listAll();
      List<Reference> allFiles = result.items;
      List<String> urls =
          await Future.wait(allFiles.map((ref) => ref.getDownloadURL()));

      setState(() {
        imageUrls = urls;
      });
    } catch (e) {
      print('Failed to load images: $e');
    }
  }

  void _viewImage(BuildContext context, String imageUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenImage(imageUrl: imageUrl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 80,
              ),
              child: GridView.builder(
                itemCount: imageUrls.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  String fileName = imageUrls[index]
                      .split('/')
                      .last; // Get the file name from the URL
                  String displayFileName =
                      "${fileName.substring(11, 13)}:${fileName.substring(16, 18)}"; // Display only the first 10 characters

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        FileName =
                            "${fileName.substring(11, 13)}:${fileName.substring(16, 18)}"; // Display only the first 10 characters
                      });
                      _viewImage(context, imageUrls[index]);
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                imageUrls[index],
                                fit: BoxFit.cover,
                                loadingBuilder: (context, child, progress) {
                                  return progress == null
                                      ? child
                                      : Center(
                                          child: CircularProgressIndicator());
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            displayFileName,
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            getAppBarUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
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
                        'Image List',
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
                          '$folderName',
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
            )
          ],
        ),
      ),
    ]);
  }
}

class FullScreenImage extends StatefulWidget {
  final String imageUrl;

  FullScreenImage({required this.imageUrl});

  @override
  _FullScreenImageState createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  double _brightness = 0.0;
  double _saturation = 1.0;
  double _contrast = 1.0;
  double _rotation = 0.0;
  bool _enableZoom = true;
  PhotoViewComputedScale _minZoomScale = PhotoViewComputedScale.contained * 0.5;
  late final Interpreter interpreter; // Added interpreter variable
  PhotoViewComputedScale _maxZoomScale = PhotoViewComputedScale.covered * 1;
  late PhotoViewController _controller;
  PhotoViewScaleState _currentScaleState = PhotoViewScaleState.initial;
  static const modelPath = 'assets/model/PlantWatch.tflite';
  static const labelsPath = 'assets/model/labels.txt';
  late final List<String> labels;
  final imagePicker = ImagePicker();
  // String? imageUrl;
  img.Image? image;
  bool _isPanelExpanded = false;
  Map<String, int>? classification;
  Tensor? inputTensor;
  Tensor? outputTensor;
  @override
  void initState() {
    super.initState();
    _controller = PhotoViewController();
    // Load the custom TensorFlow Lite model
    loadModel();
    loadLabels();
    processImage();
  }

  // Load model
  Future<void> loadModel() async {
    final options = InterpreterOptions();

    // Use XNNPACK Delegate
    if (Platform.isAndroid) {
      options.addDelegate(XNNPackDelegate());
    }

    // Use GPU Delegate
    // doesn't work on emulator
    // if (Platform.isAndroid) {
    //   options.addDelegate(GpuDelegateV2());
    // }

    // Use Metal Delegate
    if (Platform.isIOS) {
      options.addDelegate(GpuDelegate());
    }

    // Load model from assets
    interpreter = await Interpreter.fromAsset(modelPath, options: options);
    // Get tensor input shape [1, 224, 224, 3]
    inputTensor = interpreter.getInputTensors().first;
    // Get tensor output shape [1, 1001]
    outputTensor = interpreter.getOutputTensors().first;
    setState(() {});
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Interpreter loaded successfully!'),
      ),
    );
  }

  // Load labels from assets
  Future<void> loadLabels() async {
    final labelTxt = await rootBundle.loadString(labelsPath);
    labels = labelTxt.split('\n');
  }

  // Process picked image
  Future<void> processImage() async {
    final response = await http.get(Uri.parse(widget.imageUrl));
    if (response.statusCode == 200) {
      final imageData = response.bodyBytes;
      image = img.decodeImage(imageData);
      setState(() {});
      // Resize image for model input (Mobilenet use [224, 224])
      final imageInput = img.copyResize(
        image!,
        width: 96,
        height: 96,
      );

      // Get image matrix representation [224, 224, 3]
      final imageMatrix = List.generate(
        imageInput.height,
        (y) => List.generate(
          imageInput.width,
          (x) {
            final pixel = imageInput.getPixel(x, y);
            return [
              ui.Color(pixel).red,
              ui.Color(pixel).green,
              ui.Color(pixel).blue
            ];
          },
        ),
      );

      // Run model inference
      runInference(imageMatrix);
    } else {
      print('Failed to download the image');
    }
  }

  // Run inference
  Future<void> runInference(
    List<List<List<num>>> imageMatrix,
  ) async {
    // Set tensor input [1, 224, 224, 3]
    final input = [imageMatrix];
    // Set tensor output [1, 2]
    final output = [List<int>.filled(2, 0)];

    // Run inference
    interpreter.run(input, output);

    // Get first output tensor
    final result = output.first;

    // Set classification map {label: points}
    classification = <String, int>{};

    for (var i = 0; i < result.length; i++) {
      if (result[i] != 0) {
        // Set label: points
        classification![labels[i]] = result[i];
      }
    }

    setState(() {});
  }

  void _changeBrightness(double value) {
    setState(() {
      _brightness = value;
    });
  }

  void _togglePanel() {
    setState(() {
      _isPanelExpanded = !_isPanelExpanded;
    });
  }

  void _changeSaturation(double value) {
    setState(() {
      _saturation = value;
    });
  }

  void _changeContrast(double value) {
    setState(() {
      _contrast = value;
    });
  }

  void _rotateLeft() {
    setState(() {
      _rotation -= 90.0;
    });
  }

  void _rotateRight() {
    setState(() {
      _rotation += 90.0;
    });
  }

  void _toggleZoom() {
    setState(() {
      _enableZoom = !_enableZoom;
      if (_enableZoom) {
        _currentScaleState = PhotoViewScaleState.initial;
        _controller.scale = _minZoomScale.multiplier;
      } else {
        _currentScaleState = PhotoViewScaleState.zoomedOut;
        _controller.scale = _minZoomScale.multiplier;
      }
    });
  }

  PhotoViewScaleState _nextScaleState(PhotoViewScaleState current) {
    if (current == PhotoViewScaleState.initial) {
      return PhotoViewScaleState.zoomedIn;
    } else {
      return PhotoViewScaleState.initial;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(),
            child: Transform.rotate(
              angle: _rotation * (3.1415927 / 180),
              child: ColorFiltered(
                colorFilter: ColorFilter.matrix([
                  _contrast,
                  0,
                  0,
                  0,
                  _brightness * 255,
                  0,
                  _contrast,
                  0,
                  0,
                  _brightness * 255,
                  0,
                  0,
                  _contrast,
                  0,
                  _brightness * 255,
                  0,
                  0,
                  0,
                  _saturation,
                  0,
                ]),
                child: PhotoView(
                  basePosition: Alignment.center,
                  controller: _controller,
                  imageProvider: NetworkImage(widget.imageUrl),
                  minScale: _minZoomScale,
                  maxScale: _maxZoomScale,
                  scaleStateCycle: (state) => _nextScaleState(state),
                  scaleStateChangedCallback: (state) {
                    setState(() {
                      _currentScaleState = state;
                    });
                  },
                  onTapUp: (context, details, controllerValue) {
                    if (_enableZoom) {
                      if (_currentScaleState == PhotoViewScaleState.initial) {
                        _controller.scale = _maxZoomScale.multiplier;
                      } else {
                        _controller.scale = _minZoomScale.multiplier;
                      }
                    }
                  },
                  enablePanAlways: true,
                  tightMode: true,
                  // Allow users to move the picture
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            bottom: _isPanelExpanded ? 0.0 : -200.0,
            left: 0.0,
            right: 0.0,
            child: GestureDetector(
              onTap: _togglePanel,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: _togglePanel,
                      child: Icon(
                        _isPanelExpanded
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        size: 32,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    if (classification != null)
                      ...(classification!.entries.toList()
                            ..sort(
                              (a, b) => a.value.compareTo(b.value),
                            ))
                          .reversed
                          .map(
                            (e) => Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(),
                              child: Wrap(
                                direction: Axis.horizontal,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      '${e.key}:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      '${e.value}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Brightness',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Slider(
                                value: _brightness,
                                min: -1.0,
                                max: 1.0,
                                divisions: 20,
                                onChanged: _changeBrightness,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Saturation',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Slider(
                                value: _saturation,
                                min: 0.0,
                                max: 2.0,
                                divisions: 20,
                                onChanged: _changeSaturation,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Contrast',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Slider(
                                value: _contrast,
                                min: 0.0,
                                max: 2.0,
                                divisions: 20,
                                onChanged: _changeContrast,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(Icons.rotate_left),
                          onPressed: _rotateLeft,
                          iconSize: 30,
                        ),
                        IconButton(
                          icon: Icon(Icons.rotate_right),
                          onPressed: _rotateRight,
                          iconSize: 30,
                        ),
                        IconButton(
                          icon: Icon(
                            _enableZoom ? Icons.zoom_out : Icons.zoom_in,
                            size: 30,
                          ),
                          onPressed: _toggleZoom,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          getAppBarUI(),
        ],
      ),
    );
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
                        'Full Screen Image',
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
                          '$FileName',
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
            )
          ],
        ),
      ),
    ]);
  }
}
