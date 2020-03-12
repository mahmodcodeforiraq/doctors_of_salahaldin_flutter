
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doctors_of_salahaldin/Model/Doctors.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoDoctorPage extends StatefulWidget{
  final Doctors doctors ;
  InfoDoctorPage(this.doctors);
  @override
  State<StatefulWidget> createState() {

    return new StateInfoDoctorPage();
  }

}
final doctorRefrance = FirebaseDatabase.instance.reference().child('Users').child('Doctor');

class StateInfoDoctorPage extends State<InfoDoctorPage>{
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.only(bottomRight: Radius.circular(35))
        ),
        title: new Text("بيانات الطبيب"),
        centerTitle: true,
        backgroundColor: Color(0xff6A4BC3),
      ),

      body: new Container(
        alignment:Alignment.center,
        child: new ListView(
          children: <Widget>[
            new Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[

                new Padding(padding: EdgeInsets.only(top: 50)),
                new  Container(
                  margin: EdgeInsets.only(top: 150,left: 8),
                    alignment: Alignment.center,
                    width: 420,
                    height: 178,
                    decoration: BoxDecoration(
                      color: const Color(0xff888888).withOpacity(0.17),
                      border: Border.all(width: 4,color: const Color(0xffffffff),),
                      borderRadius: BorderRadius.circular(22),

                    ),

                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.end,

                    children: <Widget>[

                      new Padding(padding: EdgeInsets.only(top: 50)),

                      new Text('الاسم : ${widget.doctors.name}',textDirection: TextDirection.ltr,style: TextStyle(fontSize: 18),),
                      new Text('رقم هاتف الحجز : ${widget.doctors.phonenumber}',textDirection: TextDirection.ltr,style: TextStyle(fontSize: 18),),

                    ],

                  ),
                  ),
                new Card(
                  margin: EdgeInsets.only(top: 40),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(100000),
                      side:BorderSide(width: 5,color: Colors.white)
                  ),
                  child:new Container(

                    alignment: Alignment.center,
                    width: 150,
                    height: 150,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(
                                "${widget.doctors.doctorimage}")
                        )
                    ),
                  ),

                ),


                new Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 250 ,left:20),
                  child: new FloatingActionButton(onPressed: (){ launch('tel://${widget.doctors.phonenumber}'); },

                    backgroundColor: Colors.white,

                    child: Center(
                      child:
                      new Icon(Icons.call,color: Colors.deepPurple,size: 30,),
                    ),
                  ) ,
                )

              ],

            ),
            new  Container(
              margin: EdgeInsets.only(top: 100,left: 8,right: 8),
              padding: EdgeInsets.only(right: 10),
              alignment: Alignment.centerRight,
              width: 420,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xff888888).withOpacity(0.07),
                border: Border.all(width: 1,color: const Color(0xff000000),),
                borderRadius: BorderRadius.circular(22),

              ),

              child:new Text('الاختصاص : ${widget.doctors.department}',textDirection: TextDirection.ltr,style: TextStyle(fontSize: 18),),
            ),
            new  Container(
              margin: EdgeInsets.only(top: 10,left: 8,right: 8),
              alignment: Alignment.centerRight,
              width: 420,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xff888888).withOpacity(0.07),
                border: Border.all(width: 1,color: const Color(0xff000000),),
                borderRadius: BorderRadius.circular(22),

              ),

              child: new Text('العنوان : ${widget.doctors.address}',textDirection: TextDirection.rtl,style: TextStyle(fontSize: 18),),

            ),
            new  Container(
              margin: EdgeInsets.only(top: 10,left: 8,right: 8),
              padding: EdgeInsets.only(right: 10),
              alignment: Alignment.centerRight,
              width: 420,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xff888888).withOpacity(0.07),
                border: Border.all(width: 1,color: const Color(0xff000000),),
                borderRadius: BorderRadius.circular(22),

              ),

              child: new Text('المحافظة : ${widget.doctors.mohafada}',textDirection: TextDirection.ltr,style: TextStyle(fontSize: 18),),

            ),
            new  Container(
              margin: EdgeInsets.only(top: 10,left: 8,right: 8),
              padding: EdgeInsets.only(right: 10),
              alignment: Alignment.centerRight,
              width: 420,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xff888888).withOpacity(0.07),
                border: Border.all(width: 1,color: const Color(0xff000000),),
                borderRadius: BorderRadius.circular(22),

              ),

              child:  new Text('المدينة : ${widget.doctors.city}',textDirection: TextDirection.ltr,style: TextStyle(fontSize: 18),),

            ),
            new  Container(
              margin: EdgeInsets.only(top: 10,left: 8,right: 8),
              padding: EdgeInsets.only(right: 10),
              alignment: Alignment.centerRight,
              width: 420,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xff888888).withOpacity(0.07),
                border: Border.all(width: 1,color: const Color(0xff000000),),
                borderRadius: BorderRadius.circular(22),

              ),

              child: new Text('رقم الاجازة : ${widget.doctors.signnumber}',textDirection: TextDirection.ltr,style: TextStyle(fontSize: 18),),


            ),


          ],
        )

      ),
    );
  }

}


