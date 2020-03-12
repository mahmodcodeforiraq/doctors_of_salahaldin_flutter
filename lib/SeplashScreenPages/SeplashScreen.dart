import 'dart:ui';

import 'package:doctors_of_salahaldin/About/AboutTeam.dart';
import 'package:doctors_of_salahaldin/SeplashScreenPages/SeplashScreenPages.dart';
import 'package:doctors_of_salahaldin/UI_Pages/AddDoctorpage.dart';
import 'package:doctors_of_salahaldin/UI_Pages/InfoDoctorPage.dart';
import 'package:doctors_of_salahaldin/UI_Pages/LoginPage.dart';
import 'package:doctors_of_salahaldin/UI_Pages/RegesterPage.dart';
import 'package:doctors_of_salahaldin/UI_Pages/Search.dart';
import 'package:doctors_of_salahaldin/UI_Pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SeplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new StateSeplashScreen();
  }

}


class StateSeplashScreen extends State<SeplashScreen>{

  int page;


  int number ;

  int pageViewIndex = 0;


  // Try single controller.
  PageController controller;


  Future<bool> setspFun(int) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt('spValue', number);

    return sp.commit();
  }
  Future<int> getspFun() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    number = sp.getInt('spValue');

    return number;
  }

  void saveSp(){

    number = 0;
    setspFun(number).then((bool commit){
//      Navigator.of(context).pushReplacementNamed('/HomePgae');

    });
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = PageController(initialPage: 0);

getspFun().then((int){
  if (number !=0){

    print('Welcome');

  }else if(number==0){
    Navigator.of(context).pushReplacementNamed('/Homepage');

  }
});


  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build


      return Scaffold(

        body: IndexedStack(
          index: 0,
          children: <Widget>[
           new  PageView.builder(
              itemBuilder: (context, int pageViewIndex) {
                return new Stack(
                  children: <Widget>[
                    new Center(

                      child:
                      pageViewIndex == 0 ? new Page1() :
                      pageViewIndex == 1 ? new Page2() :
                      pageViewIndex == 2 ? new Page3() :
                      pageViewIndex == 3 ? new Page4() :
                      new Text('nothing'),
                    ),


                    new Container(
                      color: new Color(0xff6A4BC3),

                      margin: EdgeInsets.only(top: 760),
                      height: 60,
                        width: 800,
                        child:  new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[



                              pageViewIndex == 0 ?
                              new Expanded(child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[

                                  new FlatButton(
                                    onPressed: () {
                                      saveSp();
                                      Navigator.of(context).pushReplacementNamed(
                                          '/Homepage');

                                    },
                                    child: new Text('تخطي',
                                        style: new TextStyle(fontSize: 20)),
                                    textColor: Colors.white,
                                  ),
                                  
                                  new Padding(padding: EdgeInsets.only(left: 80)),
                                  new Icon(Icons.linear_scale, color: Colors.green,size:40,),

                                  new Icon(Icons.linear_scale, color: Colors.black,),

                                  new Icon(Icons.linear_scale, color: Colors.black,),

                                  new Icon(Icons.linear_scale, color: Colors.black,),

                                  new Padding(padding: EdgeInsets.only(right: 150)),


                                ],)) :
                              pageViewIndex == 1 ?
                              new Expanded(child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: <Widget>[
                                  new FlatButton(
                                    onPressed: () {
                                      saveSp();
                                      Navigator.of(context).pushReplacementNamed(
                                          '/Homepage');

                                    },
                                    child: new Text('تخطي',
                                        style: new TextStyle(fontSize: 20)),
                                    textColor: Colors.white,
                                  ),

                                  new Padding(padding: EdgeInsets.only(left: 80)),
                                  new Icon(Icons.linear_scale, color: Colors.black,),

                                  new Icon(Icons.linear_scale, color: Colors.green,size:40,),

                                  new Icon(Icons.linear_scale, color: Colors.black,),

                                  new Icon(Icons.linear_scale, color: Colors.black,),
                                  new Padding(padding: EdgeInsets.only(right: 150)),


                                ],)) :

                              pageViewIndex == 2 ? new Expanded(child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: <Widget>[
                                  new FlatButton(
                                    onPressed: () {
                                      saveSp();
                                      Navigator.of(context).pushReplacementNamed(
                                          '/Homepage');

                                    },
                                    child: new Text('تخطي',
                                        style: new TextStyle(fontSize: 20)),
                                    textColor: Colors.white,
                                  ),

                                  new Padding(padding: EdgeInsets.only(left: 80)),
                                  new Icon(Icons.linear_scale, color: Colors.black,),

                                  new Icon(Icons.linear_scale, color: Colors.black,),

                                  new Icon(Icons.linear_scale, color: Colors.green,size:40,),

                                  new Icon(Icons.linear_scale, color: Colors.black,),

                                  new Padding(padding: EdgeInsets.only(right: 150)),


                                ],)) :
                              pageViewIndex == 3 ? new Expanded(child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: <Widget>[
                                  new FlatButton(
                                    onPressed: () {
                                      saveSp();
                                      Navigator.of(context).pushReplacementNamed(
                                          '/Homepage');

                                    },
                                    child: new Text('تخطي',
                                        style: new TextStyle(fontSize: 20)),
                                    textColor: Colors.white,
                                  ),

                                  new Padding(padding: EdgeInsets.only(left: 80)),
                                  new Icon(Icons.linear_scale, color: Colors.black,),
                                  new Icon(Icons.linear_scale, color: Colors.black,),
                                  new Icon(Icons.linear_scale, color: Colors.black,),
                                  new Icon(Icons.linear_scale, color: Colors.green,size:40,),
                                  new Padding(padding: EdgeInsets.only(right: 150)),



                                ],)) :
                              new Text('nothing'),



                            ],
                          ),

                        )



                  ],

                );
              },
              itemCount: 4,
            ),

          ],
        ),
      );



  }
}



