import 'Status.dart';
import 'package:flutter/widgets.dart';
import 'Album.dart';
import 'Analysis.dart';
import 'progress.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
    this.title = '',
  });

  Widget? navigateScreen;
  String imagePath;
  String title;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/introduction_animation/status.png',
      navigateScreen: status(),
      title: 'Status',
    ),
    HomeList(
      imagePath: 'assets/introduction_animation/Unknown.png',
      navigateScreen: FolderListScreen(),
      title: 'Album',
    ),
    HomeList(
      imagePath: 'assets/introduction_animation/analysis.png',
      navigateScreen: FolderListScreenAnalysis(),
      title: 'Analysis',
    ),
    HomeList(
      imagePath: 'assets/introduction_animation/progress.png',
      navigateScreen: FolderListScreenProgress(),
      title: 'Progress',
    ),
  ];
}
