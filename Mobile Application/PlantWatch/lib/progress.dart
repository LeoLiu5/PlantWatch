import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:screen_loader/screen_loader.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'app_theme.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'home_screen.dart';

class FolderListScreenProgress extends StatefulWidget {
  @override
  _FolderListScreenState createState() => _FolderListScreenState();
}

class Folder {
  String path;

  Folder(this.path);

  dynamic operator [](String key) {
    if (key == 'path') {
      return path;
    }
    // Handle other properties if necessary
    throw ArgumentError('Invalid key: $key');
  }
}

class _FolderListScreenState extends State<FolderListScreenProgress> {
  List<Folder> selectedFolders = [];
  List<Folder> availableFolders = []; // Placeholder for available folders
  late String videoPath = '';
  bool isCreatingVideo = false;
  Directory? tempDir; // Temporary directory
  bool isVideoCreated = false;
  Folder? selectedFolder; // Track the selected folder
  double videoGenerationProgress = 0.0;
  String encodingProgress = '00:00.00';
  List<bool> selectedStates = [];
  @override
  void initState() {
    super.initState();
    fetchFolders().then((folderList) {
      setState(() {
        availableFolders = folderList;
        // Sort the available folders based on the date in descending order
        availableFolders.sort((folder1, folder2) {
          DateTime date1 = _extractDateFromPath(folder1['path']);
          DateTime date2 = _extractDateFromPath(folder2['path']);
          return date2.compareTo(date1);
        });
      });
    }).catchError((error) {
      print('Error fetching folders: $error');
    });
  }

  DateTime _extractDateFromPath(String path) {
    // Extract the date substring from the path (format: "dd-mm-yy")
    String dateString = path.split('/').last.split('%2F').first;
    List<String> dateParts = dateString.split('-');
    int day = int.parse(dateParts[0]);
    int month = int.parse(dateParts[1]);
    int year =
        int.parse('20${dateParts[2]}'); // Adding "20" to make it 4-digit year

    // Return the DateTime object
    return DateTime(year, month, day);
  }

  Future<List<Folder>> fetchFolders() async {
    ListResult result = await FirebaseStorage.instance.ref().listAll();
    List<Map<String, String>> folders = result.prefixes.map((folder) {
      return {'path': folder.fullPath};
    }).toList();
    return folders.map((folderMap) {
      return Folder(folderMap['path']!);
    }).toList();
  }

  void playLocalVideo() async {
    final appDir = await getApplicationDocumentsDirectory();
    final savedVideoPath = '${appDir.path}/output.mp4';
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocalVideoPlayerScreen(savedVideoPath),
      ),
    );
  }

  void createVideo() async {
    if (selectedFolders.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("No folders selected"),
        ),
      );
      return;
    }

    setState(() {
      isCreatingVideo = true;
      videoGenerationProgress = 0.0; // Reset video generation progress
    });

    // Request permission to access the storage
    await _requestStoragePermission();

    String outputPath = await _createVideoFromImages(selectedFolders);
    setState(() {
      videoPath = outputPath;
      isCreatingVideo = false;
    });
  }

  Future<String> _createVideoFromImages(List<Folder> folders) async {
    List<String> imagePaths = [];

    for (var folder in folders) {
      ListResult result =
          await FirebaseStorage.instance.ref(folder.path).listAll();
      List<String> images = result.items.map((item) => item.name).toList();
      List<String> folderImagePaths = images.map((imageName) {
        return '${folder.path}/${imageName.replaceAll("%3A", ":")}';
      }).toList();
      imagePaths.addAll(folderImagePaths);
    }

    // Create a temporary directory to store the images
    Directory tempDir = await getTemporaryDirectory();

    // Download and save the images to the temporary directory
    for (int i = 0; i < imagePaths.length; i++) {
      String imagePath =
          '${tempDir.path}/${i.toString()}.jpg'; // Change image file name format
      try {
        await FirebaseStorage.instance
            .ref(imagePaths[i])
            .writeToFile(File(imagePath));
      } catch (e) {
        print('Error downloading image at path: ${imagePaths[i]}');
        print('Error message: $e');
      }

      // Update progress approximately based on the number of images processed
      setState(() {
        videoGenerationProgress = (i + 1) / imagePaths.length;
      });
    }

    // Create the video using FFmpeg
    String outputFilePath = '${tempDir.path}/output.mp4';

    final FlutterFFmpeg flutterFFmpeg = FlutterFFmpeg();
    final FlutterFFmpegConfig flutterFFmpegConfig = FlutterFFmpegConfig();
    final command = <String>[
      '-y', // Force overwrite
      '-framerate',
      '45', // Adjust the framerate (frames per second) for smoother playback
      '-i',
      '${tempDir.path}/%d.jpg',
      '-c:v',
      'libx265', // Change the video codec to improve performance
      '-crf',
      '10', // Adjust the video quality (lower values result in better quality but larger file size)
      '-preset',
      'ultrafast', // Adjust the preset for faster video encoding
      '-movflags',
      'faststart', // Optimize video for progressive downloading
      outputFilePath,
    ];

    flutterFFmpegConfig.enableStatisticsCallback((statistics) {
      setState(() {
        final int timeInSeconds = statistics.time ~/ 1000;

        final int minutes = (timeInSeconds % 3600) ~/ 60;
        final int seconds = timeInSeconds % 60;
        final int milliseconds = statistics.time % 1000;

        final String minutesStr = minutes.toString().padLeft(2, '0');
        final String secondsStr = seconds.toString().padLeft(2, '0');
        final String millisecondsStr = milliseconds.toString().padLeft(3, '0');

        encodingProgress = '$minutesStr:$secondsStr.$millisecondsStr';
      });
    });

    try {
      final int rc = await flutterFFmpeg.executeWithArguments(command);
      if (rc == 0) {
        setState(() {
          isVideoCreated = true;
        });
        // Save the video to local storage
        final appDir = await getApplicationDocumentsDirectory();
        final savedVideoPath = '${appDir.path}/output.mp4';
        final savedVideoFile = File(savedVideoPath);
        await savedVideoFile
            .writeAsBytes(await File(outputFilePath).readAsBytes());

        // Delete the temporary directory
        tempDir.deleteSync(recursive: true);

        // Return the saved video file path
        return savedVideoPath;
      } else {
        print('Video creation failed with rc=$rc.');
        // ... handle video creation failure
      }
    } catch (e) {
      print('Error creating video: $e');
      // ... handle video creation error
    }

    // Return the output file path
    return outputFilePath;
  }

  Future<void> _requestStoragePermission() async {
    PermissionStatus status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
    }
    if (!status.isGranted) {
      throw Exception('Storage permission not granted');
    }
  }

  void playVideo() {
    if (videoPath.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VideoPlayerScreen(File(videoPath)),
        ),
      );
    }
  }

  void playYoutubeVideo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => YoutubeVideoPlayerScreen("aZHMp5tJoS4"),
      ),
    );
  }

  Widget _buildSelectedFoldersList() {
    if (selectedFolders.isEmpty) {
      return Container(); // Return an empty container if no folders are selected
    } else {
      return Column(
        children: selectedFolders.map((folder) {
          return ListTile(
            title: Text(folder.path),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  selectedFolders.remove(folder);
                });
              },
            ),
          );
        }).toList(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: getAppBarUI(),
      ),
      body: ListView(
        padding: EdgeInsets.all(32.0),
        children: [
          SizedBox(height: 32.0),
          ElevatedButton(
            onPressed: playYoutubeVideo,
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              onPrimary: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Time-Lapse Video',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.4,
              ),
            ),
          ),
          SizedBox(height: 32.0),
          ElevatedButton(
            onPressed: playLocalVideo,
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              onPrimary: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Play Local Video',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.4,
              ),
            ),
          ),
          SizedBox(height: 32.0),
          ElevatedButton(
            onPressed: isCreatingVideo ? null : createVideo,
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              onPrimary: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: isCreatingVideo
                ? Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16.0),
                      Text(
                        'Creating Video...',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.4,
                        ),
                      ),
                    ],
                  )
                : Text(
                    'Generate Video               (select the dates from the dropdown menu, make sure the order is correct)',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
          ),
          SizedBox(height: 32.0),
          DropdownButtonFormField<Folder>(
            value: null,
            hint: Text('Select folders'),
            onChanged: (Folder? value) {
              setState(() {
                if (value != null && !selectedFolders.contains(value)) {
                  selectedFolders.add(value);
                }
              });
            },
            items: availableFolders
                .map((folder) => DropdownMenuItem<Folder>(
                      value: folder,
                      child: Text(folder.path),
                    ))
                .toList(),
            isExpanded: true,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (selectedFolders.isEmpty) {
                return 'Please select at least one folder.';
              }
              return null;
            },
          ),
          if (selectedFolders.isNotEmpty) _buildSelectedFoldersList(),
          SizedBox(height: 32.0),
          ElevatedButton(
            onPressed: playVideo,
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              onPrimary: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              videoPath.isNotEmpty
                  ? 'Video Generated Successfully!                  (click here to play)'
                  : 'New Video Not Available',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 32.0),
          if (videoGenerationProgress > 0.0 && videoGenerationProgress < 1.0)
            LinearProgressIndicator(
              value: videoGenerationProgress,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              minHeight: 10,
              semanticsLabel: 'Downloading Images from Firebase Storage',
            ),
          if (videoGenerationProgress == 1.0) ...[
            SizedBox(height: 32.0),
            Text(
              'Generating the Newest Time-Lapse Video ...',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.0),
            Text(
              encodingProgress,
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
                letterSpacing: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32.0),
            Text(
              "Please stay on this page",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ],
          SizedBox(height: 16.0),
        ],
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
                        'Time-Lapse Video Storage',
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

class YoutubeVideoPlayerScreen extends StatefulWidget {
  final String videoId;

  YoutubeVideoPlayerScreen(this.videoId);

  @override
  _YoutubeVideoPlayerScreenState createState() =>
      _YoutubeVideoPlayerScreenState();
}

class _YoutubeVideoPlayerScreenState extends State<YoutubeVideoPlayerScreen>
    with ScreenLoader {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    startLoading();

    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    _controller.addListener(() {
      // Add actions to perform when the video player is ready
    });

    stopLoading();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _pauseVideo() {
    _controller.pause();
  }

  void _playVideo() {
    _controller.play();
  }

  void _toggleControls() {
    if (_controller.value.isPlaying) {
      _pauseVideo();
    } else {
      _playVideo();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
              progressColors: ProgressBarColors(
                playedColor: Colors.blue,
                handleColor: Colors.blueAccent,
              ),
              onReady: () {
                // Add actions to perform when the video player is ready
              },
              onEnded: (error) {
                // Handle any errors that occur while playing the video
              },
            ),
          ),
          GestureDetector(
            onTap: _toggleControls,
            child: AnimatedOpacity(
              opacity: _controller.value.isPlaying ? 0.0 : 1.0,
              duration: Duration(milliseconds: 300),
              child: Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 40.0), // Top spacing
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: 32.0,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    Expanded(child: Container()), // Spacer
                    SizedBox(height: 40.0), // Bottom spacing
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LocalVideoPlayerScreen extends StatelessWidget {
  final String videoPath;

  LocalVideoPlayerScreen(this.videoPath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: VideoPlayerScreen(File(videoPath)),
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final File videoFile;

  VideoPlayerScreen(this.videoFile);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen>
    with ScreenLoader {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  double _rotation = 0.0;
  bool _isPlaying = true;
  bool _showControls = true;
  double _seekSliderValue = 0.0;

  @override
  void initState() {
    startLoading();

    _controller = VideoPlayerController.file(widget.videoFile);
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.play();
    _controller.addListener(() {
      setState(() {
        _seekSliderValue = _controller.value.position.inSeconds.toDouble() /
            (_controller.value.duration.inSeconds.toDouble() == 0
                ? 1
                : _controller.value.duration.inSeconds.toDouble());
      });
    });
    super.initState();
    stopLoading();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _playVideo() {
    _controller.play();
    setState(() {
      _isPlaying = true;
    });
  }

  void _pauseVideo() {
    _controller.pause();
    setState(() {
      _isPlaying = false;
    });
  }

  void _rotateVideo() {
    setState(() {
      _rotation += 90.0;
      if (_rotation >= 360.0) {
        _rotation = 0.0;
      }
    });
  }

  void _seekVideo(double value) {
    final double positionInSeconds =
        value * _controller.value.duration.inSeconds.toDouble();
    final Duration newPosition = Duration(seconds: positionInSeconds.toInt());
    _controller.seekTo(newPosition);
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });
  }

  Widget _buildPlayPauseButton() {
    return GestureDetector(
      onTap: () {
        if (_isPlaying) {
          _pauseVideo();
        } else {
          _playVideo();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withOpacity(0.7),
        ),
        child: Icon(
          _isPlaying ? Icons.pause : Icons.play_arrow,
          size: 48.0,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSeekSlider() {
    return Slider(
      value: _seekSliderValue,
      onChanged: (value) {
        setState(() {
          _seekSliderValue = value;
        });
        _seekVideo(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Transform.rotate(
              angle: _rotation * (3.14 / 180.0),
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          GestureDetector(
            onTap: _toggleControls,
            child: AnimatedOpacity(
              opacity: _showControls ? 1.0 : 0.0,
              duration: Duration(milliseconds: 300),
              child: Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 40.0), // Top spacing
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            size: 32.0,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.rotate_right,
                            size: 32.0,
                            color: Colors.white,
                          ),
                          onPressed: _rotateVideo,
                        ),
                      ],
                    ),
                    Expanded(child: Container()), // Spacer
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          _buildSeekSlider(),
                          SizedBox(height: 16.0),
                          _buildPlayPauseButton(),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.0), // Bottom spacing
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
