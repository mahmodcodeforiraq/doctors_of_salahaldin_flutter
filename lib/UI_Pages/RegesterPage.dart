import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

FirebaseAuth myAuth = FirebaseAuth.instance;

class RegesterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new StateRegesterPage();
  }
}

class StateRegesterPage extends State<RegesterPage> {
  TextEditingController emailControlar = new TextEditingController();
  TextEditingController passwordControlar = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          shape: RoundedRectangleBorder(
              borderRadius:
                  new BorderRadius.only(bottomRight: Radius.circular(35))),
          title: new Text("تسجيل حساب جديد"),
          centerTitle: true,
          backgroundColor: Color(0xff6A4BC3),
        ),
        body: new ListView(
          children: <Widget>[
            new Container(
              margin: EdgeInsets.only(top: 100),
              padding: EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new TextField(
                    controller: emailControlar,
                    decoration: InputDecoration(
                      labelText: "البريد الالكتروني",
                      icon: new Icon(Icons.email, color: Color(0xff6A4BC3)),
                      fillColor: Color(0xff6A4BC3),
                      labelStyle: TextStyle(color: Color(0xff6A4BC3)),
                    ),
                  ),
                  new Padding(padding: EdgeInsets.only(top: 5)),
                  new TextField(
                    controller: passwordControlar,
                    decoration: InputDecoration(
                        labelText: "كلمة المرور",
                        icon: new Icon(
                          Icons.lock,
                          color: Color(0xff6A4BC3),
                        ),
                        fillColor: Color(0xff6A4BC3),
                        labelStyle: TextStyle(color: Color(0xff6A4BC3))),
                  ),
                  new Padding(padding: EdgeInsets.only(top: 40)),
                  FloatingActionButton(
                    onPressed: () {
                      myAuth
                          .createUserWithEmailAndPassword(
                              email: emailControlar.text,
                              password: passwordControlar.text)
                          .then((_) {
                        Navigator.pushReplacementNamed(context, '/Homepage');
                      });
                    },
                    child: new Icon(Icons.forward),
                    backgroundColor: Color(0xff6A4BC3),
                  ),
                  new Padding(padding: EdgeInsets.only(top: 50)),
                ],
              ),
            )
          ],
        ));
  }
}
