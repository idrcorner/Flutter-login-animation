import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/scheduler.dart';

import 'loginAnimation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Animation Tutorial',
      home: new LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin{
  var statusClick = 0;
  String msg='';

  TextEditingController editingControllerUser;
  TextEditingController editingControllerPass;

AnimationController animationControllerButton;

@override
  void initState() {

    editingControllerUser= new TextEditingController(text: '');
    editingControllerPass= new TextEditingController(text: '');
    // TODO: implement initState
    super.initState();
    animationControllerButton= AnimationController(duration: Duration(seconds: 3),vsync: this)
    ..addStatusListener((status){
      if(status == AnimationStatus.dismissed){
        setState(() {
                  statusClick=0;
                  msg="Username or Password incorrect";
                });
      }
    });
  }


  @override
    void dispose() {
      // TODO: implement dispose
      super.dispose();
      animationControllerButton.dispose();
    }


  Future<Null> _playAnimation() async{
    try{
      await animationControllerButton.forward();
      await animationControllerButton.reverse();
    } on TickerCanceled{}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('img/bg.jpg'), fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                Color.fromRGBO(162, 146, 199, 0.8),
                Color.fromRGBO(51, 51, 63, 0.9),
              ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter)),
          child: ListView(
            padding: const EdgeInsets.all(0.0),
            children: <Widget>[
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 270.0),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                            ),
                            TextField(
                              controller: editingControllerUser,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.person_outline,
                                    color: Colors.white,
                                  ),
                                  hintText: "Username"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                            ),
                            TextField(
                              controller: editingControllerPass,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.lock_outline,
                                    color: Colors.white,
                                  ),
                                  hintText: "Password"),
                            ),
                            Text(msg, style: TextStyle(color: Colors.yellow,fontSize: 18.0),),
                            FlatButton(
                              padding: const EdgeInsets.only(
                                  top: 202.0, bottom: 30.0),
                              onPressed: null,
                              child: Text(
                                "Don't have an account? Sign Up here",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 0.5),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  statusClick == 0
                      ? new InkWell(
                          onTap: () {
                            setState(() {
                              statusClick = 1;
                            });
                            _playAnimation();
                          },
                          child: new SignIn())
                      : new StartAnimation(
                        buttonControler: animationControllerButton.view,
                        user: editingControllerUser.text,
                        pass: editingControllerPass.text,
                        )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(60.0),
      child: new Container(
          alignment: FractionalOffset.center,
          width: 320.0,
          height: 60.0,
          decoration: BoxDecoration(
              color: Colors.red[700],
              borderRadius: BorderRadius.all(const Radius.circular(30.0))),
          child: Text(
            "Sign In",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
                letterSpacing: 0.3),
          )),
    );
  }
}
