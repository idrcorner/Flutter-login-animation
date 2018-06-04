import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  AnimationController animationControllerScreen;
  Animation animationScreen;
  AnimationController animationControllerCover;
  Animation animationCover;
  AnimationController animationControllerProfile;
  Animation animationProfile;
  AnimationController animationControllerDetail;
  Animation animationDetail;
  AnimationController animationControllerImage;
  Animation animationImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationControllerScreen =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animationScreen =
        Tween(begin: 1.0, end: 0.0).animate(animationControllerScreen);

    animationControllerCover =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animationCover = Tween(begin: 0.0, end: 240.0).animate(CurvedAnimation(
        parent: animationControllerCover,
        curve: Interval(0.150, 0.999, curve: Curves.bounceInOut)));

    animationControllerProfile =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animationProfile = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: animationControllerProfile,
        curve: Interval(0.550, 0.999, curve: Curves.bounceOut)));

    animationControllerDetail =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animationDetail = Tween(begin: 0.0, end: 700.0).animate(CurvedAnimation(
        parent: animationControllerDetail,
        curve: Interval(0.150, 0.999, curve: Curves.bounceOut)));

    animationControllerImage =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animationImage = Tween(begin: 0.0, end: 90.0).animate(CurvedAnimation(
        parent: animationControllerImage,
        curve: Interval(0.550, 0.999, curve: Curves.bounceOut)));

    animationControllerScreen.forward();
    animationControllerCover.forward();
    animationControllerProfile.forward();

    _delay();
  }

  Future _delay() async {
    await Future.delayed(Duration(milliseconds: 300));
    animationControllerDetail.forward();
    animationControllerImage.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            new AnimationScreen(
              animation: animationScreen,
            ),
            new AnimationCover(
              animation: animationCover,
            ),
            new AnimationProfile(
              animation: animationProfile,
            ),
            new AnimationDetail(
              animation: animationDetail,
            ),
            new AnimationImage(
              animation: animationImage,
            )
          ],
        ),
      ),
    );
  }
}

class AnimationScreen extends AnimatedWidget {
  AnimationScreen({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Container(
      width: 900.0,
      height: 900.0,
      color: Colors.red[700].withOpacity(animation.value),
    );
  }
}

class AnimationCover extends AnimatedWidget {
  AnimationCover({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Container(
      height: animation.value,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('img/bg.png'), fit: BoxFit.cover)),
    );
  }
}

class AnimationProfile extends AnimatedWidget {
  AnimationProfile({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Container(
      height: 480.0,
      child: Center(
        child: Container(
          height: animation.value,
          width: animation.value,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.5),
              image: DecorationImage(
                  image: AssetImage('img/user.jpg'), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}

class AnimationDetail extends AnimatedWidget {
  AnimationDetail({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: new SizedBox(
        height: animation.value,
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(top: 310.0),
            ),
            new Text(
              "Jack Sparrow",
              style: new TextStyle(fontSize: 24.0),
            ),
            new Text(
              "www.idrcorner.com",
              style: new TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w300),
            ),
            new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Text(
                "'Kini ku tahu semua, tak seindah yang ku kira, jalani kisah ini. Ingin ku rubah semua, sungguh ku tak berdaya..' \n Arteri - Dihatiku",
                textAlign: TextAlign.center,
              ),
            ),
            new Divider(
              color: Colors.black45,
            ),
            new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Column(
                    children: <Widget>[
                      new Text(
                        "1.5 K",
                        style: new TextStyle(
                            fontSize: 25.0, color: Colors.yellow[800]),
                      ),
                      new Padding(padding: const EdgeInsets.all(4.0)),
                      new Text(
                        "Posts",
                        style: new TextStyle(fontSize: 16.0),
                      )
                    ],
                  ),
                  new Column(
                    children: <Widget>[
                      new Text(
                        "18.8 K",
                        style: new TextStyle(
                            fontSize: 25.0, color: Colors.yellow[800]),
                      ),
                      new Padding(padding: const EdgeInsets.all(4.0)),
                      new Text(
                        "Followers",
                        style: new TextStyle(fontSize: 16.0),
                      )
                    ],
                  ),
                  new Column(
                    children: <Widget>[
                      new Text(
                        "1.3 K",
                        style: new TextStyle(
                            fontSize: 25.0, color: Colors.yellow[800]),
                      ),
                      new Padding(padding: const EdgeInsets.all(4.0)),
                      new Text(
                        "Following",
                        style: new TextStyle(fontSize: 16.0),
                      )
                    ],
                  ),
                ],
              ),
            ),
            new Divider(
              color: Colors.black45,
            ),
          ]),
        ),
      ),
    );
  }
}

class AnimationImage extends AnimatedWidget {
  AnimationImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 555.0),
          ),
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Container(
                  width: animation.value,
                  height: animation.value,
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: new AssetImage("img/1.jpg"), fit: BoxFit.cover)),
                ),
                new Container(
                  width: animation.value,
                  height: animation.value,
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: new AssetImage("img/2.jpg"), fit: BoxFit.cover)),
                ),
                new Container(
                  width: animation.value,
                  height: animation.value,
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: new AssetImage("img/3.jpg"), fit: BoxFit.cover)),
                ),
                new Container(
                  width: animation.value,
                  height: animation.value,
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: new AssetImage("img/4.jpg"), fit: BoxFit.cover)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
