import 'dart:math' as math;
import '../app_theme.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vector;

class WaveView extends StatefulWidget {
  final double percentageValue;

  const WaveView({Key? key, this.percentageValue = 100}) : super(key: key);
  @override
  _WaveViewState createState() => _WaveViewState();
}

class _WaveViewState extends State<WaveView> with TickerProviderStateMixin {
  AnimationController? waveAnimationController;
  Offset bottleOffset = Offset(0, 0);
  List<Offset> animList = [];

  @override
  void initState() {
    waveAnimationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    waveAnimationController!
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          waveAnimationController?.reverse(); //reverse animation
        } else if (status == AnimationStatus.dismissed) {
          waveAnimationController?.forward(); //resume animation
        }
      });
    waveAnimationController!.addListener(() {
      animList.clear();
      //The maximum length of the bottle is 60 logical pixels,
      // the wave moves from 0 to 60 logical pixels
      for (int i = bottleOffset.dx.toInt(); i <= 60; i++) {
        animList.add(
          new Offset(
            //Length: From 0 to 60 logical pixels horizontally
            i.toDouble() + bottleOffset.dx.toInt(),
            //During the given duration: waveAnimationController!.value linearly
            //produces values that range from 0.0 to 1.0. The frequency of the
            //sine wave can be increased by increasing the multiplier of i.
            math.sin((waveAnimationController!.value * 360 + 15 * i) %
                        360 *
                        //const double degrees2Radians = math.pi / 180.0;
                        //Constant factor to convert angle from degrees to radians:
                        vector.degrees2Radians) *
                    //Wave amplitude:
                    3 +
//the equilibrium point and the maximum height of the bottle is 160 logical pixels
                ((100 - widget.percentageValue) * 160 / 100),
          ),
        );
      }
    });
    waveAnimationController?.repeat();

    super.initState();
  }

  @override
  void dispose() {
    waveAnimationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: new AnimatedBuilder(
        animation: new CurvedAnimation(
          parent: waveAnimationController!,
          curve: Curves.easeInOut,
        ),
        builder: (context, child) => new Stack(
          children: <Widget>[
            new ClipPath(
              child: new Container(
                decoration: BoxDecoration(
                  color: AppTheme.nearlyDarkBlue,
                  gradient: LinearGradient(
                    colors: [
                      AppTheme.nearlyDarkBlue.withOpacity(0.4),
                      AppTheme.nearlyDarkBlue
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80.0),
                      bottomLeft: Radius.circular(80.0),
                      bottomRight: Radius.circular(80.0),
                      topRight: Radius.circular(80.0)),
                ),
              ),
              clipper:
                  new WaveClipper(waveAnimationController!.value, animList),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.percentageValue.round().toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppTheme.fontName,
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        letterSpacing: 0.0,
                        color: AppTheme.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        '%',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: AppTheme.fontName,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          letterSpacing: 0.0,
                          color: AppTheme.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 6,
              bottom: 8,
              child: new ScaleTransition(
                alignment: Alignment.center,
                scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: waveAnimationController!,
                    curve: Interval(0.0, 1.0, curve: Curves.fastOutSlowIn))),
                child: Container(
                  width: 2,
                  height: 2,
                  decoration: BoxDecoration(
                    color: AppTheme.white.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 24,
              right: 0,
              bottom: 16,
              child: new ScaleTransition(
                alignment: Alignment.center,
                scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: waveAnimationController!,
                    curve: Interval(0.4, 1.0, curve: Curves.fastOutSlowIn))),
                child: Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppTheme.white.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 24,
              bottom: 32,
              child: new ScaleTransition(
                alignment: Alignment.center,
                scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: waveAnimationController!,
                    curve: Interval(0.6, 0.8, curve: Curves.fastOutSlowIn))),
                child: Container(
                  width: 3,
                  height: 3,
                  decoration: BoxDecoration(
                    color: AppTheme.white.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 20,
              bottom: 0,
              child: new Transform(
                transform: new Matrix4.translationValues(
                    0.0, 16 * (1.0 - waveAnimationController!.value), 0.0),
                child: Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppTheme.white.withOpacity(
                        waveAnimationController!.status ==
                                AnimationStatus.reverse
                            ? 0.0
                            : 0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset("assets/app/bottle.png"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  final double animation;

  List<Offset> waveList1 = [];

  WaveClipper(this.animation, this.waveList1);

  @override
  Path getClip(Size size) {
    Path path = new Path();

    path.addPolygon(waveList1, false);

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(WaveClipper oldClipper) =>
      animation != oldClipper.animation;
}
