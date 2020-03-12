import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return new StateLoginPage();
  }


}

FirebaseAuth myAuth = FirebaseAuth.instance;

class StateLoginPage extends State<LoginPage>{
 TextEditingController emailControlar = new TextEditingController();
 TextEditingController passwordControlar = new TextEditingController();

  @override
  Widget build(BuildContext context) {


    return new Scaffold(
        appBar: new AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.only(bottomRight: Radius.circular(35))
          ),
          title: new Text("دليل اطباء صلاح الدين"),
          centerTitle: true,
          backgroundColor: Color(0xff6A4BC3),
        ),
        body:new ListView(
          
          children: <Widget>[
          new Container(
            padding:EdgeInsets.all(40),
            child: Column(
              children: <Widget>[


                new Padding(padding: EdgeInsets.only(top: 70)),
                new TextField(
                  controller: emailControlar,
                  decoration: InputDecoration(labelText: "البريد الالكتروني",
                    icon: new Icon(Icons.email,color: Color(0xff6A4BC3)),
                    fillColor: Color(0xff6A4BC3),
                    labelStyle: TextStyle(color: Color(0xff6A4BC3)),

                  ),

                ),
                new Padding(padding: EdgeInsets.only(top: 5)),
                new TextField(
                  controller: passwordControlar,
                  decoration: InputDecoration(labelText: "كلمة المرور",
                      icon: new Icon(Icons.lock,color: Color(0xff6A4BC3),),
                      fillColor: Color(0xff6A4BC3),
                      labelStyle: TextStyle(color: Color(0xff6A4BC3))
                  ),
                ),
                new Padding(padding: EdgeInsets.only(top: 40)),

                FloatingActionButton(
                  onPressed: (){
                    myAuth.signInWithEmailAndPassword(email: emailControlar.text,
                        password: passwordControlar.text).then((_){
                      Navigator.of(context).pushReplacementNamed('/Homepage');
                    });
                  },
                  child: new Icon(Icons.forward),
                  backgroundColor: Color(0xff6A4BC3),
                ),
                new Padding(padding: EdgeInsets.only(top: 50)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    new FlatButton(onPressed: (){
                      Navigator.of(context).pushNamed('/Regester');
                    },
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text('سجل الان',style: TextStyle(fontSize: 20,color: Color(0xff6A4BC3)),),
                            new Padding(padding: EdgeInsets.only(left: 10)),
                            new Icon(Icons.person_add,color: Color(0xff6A4BC3),)
                          ],
                        )
                    ),

                    new Text('لا تمتلك حساب؟',
                        textDirection:TextDirection.ltr ,
                        style: new TextStyle(fontSize: 18,color: Colors.black ,)
                    ),


                  ],
                ),


              ],
            ),
          )


        ],)
    );
  }



}