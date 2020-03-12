import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutTeam extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new StateAboutTeam();
  }
}

class StateAboutTeam extends State<AboutTeam> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          shape: RoundedRectangleBorder(
              borderRadius:
                  new BorderRadius.only(bottomRight: Radius.circular(35))),
          title: new Text("عن الفريق"),
          centerTitle: true,
          backgroundColor: Color(0xff6A4BC3),
          actions: <Widget>[],
        ),
        body: new ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Container(
                  child: new Image.asset(
                    'img/logo.png',
                    width: 200,
                    height: 200,
                  ),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 40),
                ),
                new Padding(padding: EdgeInsets.only(top: 20)),
                new Text(
                  'البرمجة من اجل العراق',
                  style: TextStyle(fontSize: 18),
                ),
                new Text(
                  'فريق صلاح الدين',
                  style: TextStyle(fontSize: 18),
                ),
                new Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: new Column(
                      children: <Widget>[
                        new FlatButton(
                            onPressed: () {
                              launch('https://www.facebook.com/AbuAlror');
                            },
                            child: new Column(
                              children: <Widget>[
                                new Image.asset('img/marwan.png'),
                                new Text('مدير المشروع'),
                              ],
                            )),
                        new Row(
                              children: <Widget>[
                                new Column(
                                  children: <Widget>[
                                    new FlatButton(
                                        onPressed: () {
                                          launch(
                                              'https://www.facebook.com/mahm00d.nory');
                                        },
                                        child: new Column(
                                          children: <Widget>[
                                            new Image.asset('img/mahmod.png'),
                                            new Text('مبرمج المشروع'),
                                          ],
                                        ))
                                  ],
                                ),

//                                new Padding(padding: EdgeInsets.only(left: 50)),
                                new FlatButton(
                                    onPressed: () {
                                      launch(
                                          'https://www.facebook.com/osama.alsamarrai.77');
                                    },
                                    child: new Column(
                                      children: <Widget>[
                                        new Image.asset('img/osama.png'),
                                        new Text('خوارزمية المشروع'),
                                      ],
                                    ))
                              ],
                            ),



                      ],
                    ))
              ],
            ),
          ],
        ));
  }
}
