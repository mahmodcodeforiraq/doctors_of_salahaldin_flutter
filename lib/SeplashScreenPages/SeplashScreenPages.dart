import 'package:flutter/material.dart';



class Page1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new StetePage1();
  }


}

class StetePage1 extends State<Page1>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(


      body:new Container(
        alignment: Alignment.center,

        child: new Column(
          children: <Widget>[

            new Padding(padding: EdgeInsets.only(top: 50)),
            new Container(
              padding: EdgeInsets.only(left: 50),
              child: new Image.asset('img/logo.png',height: 300,width: 300,),

            ),
            new Padding(padding: EdgeInsets.only(top: 100)),

            new Text('اهلا وسهلا بكم في',style: new TextStyle(fontSize: 25),),
            new Text('تطبيق دليل اطباء صلاح الدين',style: new TextStyle(fontSize: 25),),

          ],
        ),


      ),
      );

  }

}



class Page2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new StetePage2();
  }


}

class StetePage2 extends State<Page2>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(

      body:new Container(
        alignment: Alignment.center,

        child: new Column(
          children: <Widget>[

            new Padding(padding: EdgeInsets.only(top: 50)),
            new Image.asset('img/doctor.png',scale: 1,),
            new Padding(padding: EdgeInsets.only(top: 100)),

            new Text('يستطيع الطبيب اضافة البيانات',style: new TextStyle(fontSize: 25),),
            new Text('الخاصة به و رقم التسجيل',style: new TextStyle(fontSize: 25),),

          ],
        ),


      ),
    );

  }

}



class Page3 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new StetePage3();
  }


}

class StetePage3 extends State<Page3>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(

      body:new Container(
        alignment: Alignment.center,

        child: new Column(
          children: <Widget>[

            new Padding(padding: EdgeInsets.only(top: 50)),
            new Image.asset('img/people.png',scale: 1,),
            new Padding(padding: EdgeInsets.only(top: 100)),

            new Text('يستطيع المواطن الحجز و الاستفسار',style: new TextStyle(fontSize: 30),),

          ],
        ),


      ),
    );

  }

}





class Page4 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new StetePage4();
  }


}

class StetePage4 extends State<Page4>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(

      body:new Container(
        alignment: Alignment.center,

        child: new Column(
          children: <Widget>[

            new Padding(padding: EdgeInsets.only(top: 50)),
            new Image.asset('img/codeforiraq.png',height: 300,width: 300,),
            new Padding(padding: EdgeInsets.only(top: 100)),

            new Container(
              alignment: Alignment.center,
              child: new Column(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Text('هذا التطبيق من اعداد',style: new TextStyle(fontSize: 30),),
                  new Text('البرمجة من اجل العراق',style: new TextStyle(fontSize: 30),),
                  new Text('فريق صلاح الدين',style: new TextStyle(fontSize: 30),),

                ],
              ),
            )


          ],
        ),


      ),
    );

  }

}