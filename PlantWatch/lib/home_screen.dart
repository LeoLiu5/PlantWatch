import 'app_theme.dart';
import 'package:flutter/material.dart';
import 'homelist.dart';
import 'Login_screen.dart';
// importing firebase libraries
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  List<HomeList> homeList = HomeList.homeList;
  AnimationController? animationController;
  bool multiple = true;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;
    return Scaffold(
      backgroundColor:
          isLightMode == true ? AppTheme.white : AppTheme.nearlyBlack,
      body: Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                appBar(),
                Expanded(
                  child: Builder(
                    builder: (BuildContext context) {
                      //Display Pictures and titles for the 3d printers, TV screens, and soldering sattion in a grid view (two items in a row):
                      return GridView(
                        padding: const EdgeInsets.only(
                          left: 12,
                          right: 12,
                          bottom: 100,
                        ),
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        children: List<Widget>.generate(
                          homeList.length,
                          (int index) {
                            final int count = homeList.length;
                            final Animation<double> animation =
                                Tween<double>(begin: 0.0, end: 1.0).animate(
                              CurvedAnimation(
                                parent: animationController!,
                                curve: Interval((1 / count) * index, 1.0,
                                    curve: Curves.fastOutSlowIn),
                              ),
                            );
                            animationController?.forward();
                            return HomeListView(
                              animation: animation,
                              animationController: animationController,
                              //Pictures and titles from homelist.dart:
                              listData: homeList[index],
                              //callBack function allows user to click on the images and moves to other pages:
                              callBack: () {
                                Navigator.push<dynamic>(
                                  context,
                                  MaterialPageRoute<dynamic>(
                                    builder: (BuildContext context) =>
                                        homeList[index].navigateScreen!,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        //GridView space formatting:
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          //The number of children (images) in the cross axis or in a row:
                          crossAxisCount: multiple ? 2 : 1,
                          //The number of logical pixels between each child along the main axis:
                          mainAxisSpacing: 30.0,
                          //The number of logical pixels between each child along the cross axis:
                          crossAxisSpacing: 25,
                          //→ double The ratio of the cross-axis to the main-axis extent of each child:
                          childAspectRatio: 0.6,
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30, top: 20),
                  child: Align(
                    child: SizedBox(
                      height: 35,
                      width: 110,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            // Circular corner
                            shape: MaterialStateProperty.all(
                                const StadiumBorder(
                                    side:
                                        BorderSide(style: BorderStyle.none)))),
                        child: Text('Sign Out',
                            style:
                                Theme.of(context).primaryTextTheme.labelLarge),
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();

                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const loginPage(
                                  title: "Log in"), // login page,
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('You have successfully signed out!'),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget appBar() {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;
    return SizedBox(
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
              width: AppBar().preferredSize.height,
              height: AppBar().preferredSize.height,
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Plant Watch',
                  style: TextStyle(
                    fontSize: 26,
                    color: isLightMode ? AppTheme.darkText : AppTheme.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 15),
            child: Container(
              width: AppBar().preferredSize.height,
              height: AppBar().preferredSize.height,
              color: isLightMode ? Colors.white : AppTheme.nearlyBlack,
              child: Material(
                color: Colors.transparent,
                //This inkwell allows users to transform the view or the display of the home page
                child: InkWell(
                  borderRadius:
                      BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    multiple ? Icons.dashboard : Icons.view_agenda,
                    color: isLightMode ? AppTheme.dark_grey : AppTheme.white,
                  ),
                  // Change GridView:
                  onTap: () {
                    setState(() {
                      multiple = !multiple;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeListView extends StatelessWidget {
  const HomeListView(
      {Key? key,
      this.listData,
      this.callBack,
      this.animationController,
      this.animation})
      : super(key: key);

  final HomeList? listData;
  final VoidCallback? callBack;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (2 - animation!.value), 0.0),
            child: AspectRatio(
              aspectRatio: 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(14.0)),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      bottom: 35,
                      child: Image.asset(
                        listData!.imagePath,
                        // fit: BoxFit.scaleDown,
                        scale: 2.4,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.3),
                      child: Text(
                        listData!.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: AppTheme.fontName,
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                          letterSpacing: 1.2,
                          color: Color.fromARGB(255, 16, 16, 16),
                          background: Paint()
                            ..color = Colors.white
                            ..strokeWidth = 40
                            ..strokeJoin = StrokeJoin.round
                            ..strokeCap = StrokeCap.round
                            ..style = PaintingStyle.stroke,
                        ),
                      ),
                    ),
                    //This transparent inkwell allows user to click on the images and moves to other pages:
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.grey.withOpacity(0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4.0)),
                        onTap: callBack,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
