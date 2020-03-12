import 'dart:async';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doctors_of_salahaldin/Model/Doctors.dart';
import 'package:doctors_of_salahaldin/UI_Pages/AddDoctorpage.dart';
import 'package:doctors_of_salahaldin/UI_Pages/EditDoctorpage.dart';
import 'package:doctors_of_salahaldin/UI_Pages/InfoDoctorPage.dart';
import 'package:flutter/rendering.dart';

final FirebaseAuth myAuth = FirebaseAuth.instance ;

final doctorRefrance = FirebaseDatabase.instance.reference().child('Users').child('Doctor');

class HomePage extends StatefulWidget {



  @override
  State<StatefulWidget> createState() {

        return new StateHomePage();

    }

  }



class StateHomePage extends State<HomePage> {


  List<Doctors> items;
  StreamSubscription<Event> _onDoctorAddedSubscription;
  StreamSubscription<Event> _onDoctorChangedSubscription;



  @override
  void initState() {
    super.initState();

    getUser().then((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed('/HomepageWithoutLogin');

      }
    });

    items = new List();

    _onDoctorAddedSubscription = doctorRefrance.onChildAdded.listen(_onDoctortAdded);
    _onDoctorChangedSubscription = doctorRefrance.onChildChanged.listen(_onDoctortUpdated);
  }

  Future<FirebaseUser> getUser() async {
    return await myAuth.currentUser();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _onDoctorAddedSubscription.cancel();
    _onDoctorChangedSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.only(
                bottomRight: Radius.circular(35))
        ),
        title: new Text("دليل اطباء صلاح الدين"),
        centerTitle: true,
        backgroundColor: Color(0xff6A4BC3),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.search), onPressed: (){
            Navigator.of(context).pushNamed('/Search');
          })
        ],
      ),

      floatingActionButton: new Container(
        padding: EdgeInsets.only(left: 40),
        alignment: Alignment.bottomLeft,
        child:  new FloatingActionButton(

          onPressed: () => _createNewStudent(context),
          backgroundColor: Color(0xff6A4BC3),
          child: Center(
            child: new Image.asset('img/add_doctor.png', color: Colors.white,),
          ),


        ),
      ),

      drawer: Drawer(
        child: Center(
          child: Column(
            children: <Widget>[
              new Padding(padding: EdgeInsets.only(top: 30)),

              Image.asset('img/logo.png',scale: 8,),
              new Text(
                "Code For Iraq",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 20),
              ),
              new Divider(color: Colors.blueGrey,),

              FlatButton(
                child: Row(
                  children: <Widget>[
                    new Image.asset('img/codeforiraq.png',scale: 8,),

                    new Padding(padding: EdgeInsets.only(left: 10)),
                    new Text(
                      "عن المبادرة",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(),
                    ),
                  ],
                ),
                onPressed:(){Navigator.of(context).pushNamed('/CodeForIraq');},
              ),

              FlatButton(
                child: Row(
                  children: <Widget>[
                    new Icon(Icons.people,color: Colors.deepPurple,),

                    new Padding(padding: EdgeInsets.only(left: 10)),
                    new Text(
                      "فرق العمل",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(),
                    ),
                  ],
                ),
                onPressed:(){Navigator.of(context).pushNamed('/AboutTeam');},
              ),

              FlatButton(
                child: Row(
                  children: <Widget>[
                    new Icon(Icons.assignment,color: Colors.deepPurple,),

                    new Padding(padding: EdgeInsets.only(left: 10)),
                    new Text(
                      "عن التطبيق",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(),
                    ),
                  ],
                ),
                onPressed:(){Navigator.of(context).pushNamed('/AboutApp');},
              ),

              FlatButton(
                child: Row(
                  children: <Widget>[
                    new Icon(Icons.do_not_disturb,color: Colors.deepPurple,),

                    new Padding(padding: EdgeInsets.only(left: 10)),
                    new Text(
                      "تسجيل الخروج",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(),
                    ),
                  ],
                ),
                onPressed:(){
                  myAuth.signOut().then((_){
                   Navigator.pop(context);
                   Navigator.pushReplacementNamed(context, '/Homepage').then((_){


                   });
                  });

                },
              ),

              FlatButton(
                child: Row(
                  children: <Widget>[
                    new Icon(Icons.exit_to_app,color: Colors.deepPurple,),

                    new Padding(padding: EdgeInsets.only(left: 10)),
                    new Text(
                      "خروج",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(),
                    ),
                  ],
                ),
                onPressed:(){exit(0);},
              ),
              new Padding(padding: EdgeInsets.only(top: 60)),


              new Text(
                "فريق صلاح الدين",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      body: new Stack(
        children: <Widget>[
          new ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, position) {
                return new Column(
                  textDirection: TextDirection.rtl,
                  children: <Widget>[
//
                    new Card(
                      elevation: 4,
                      child: new Column(
                        textDirection: TextDirection.rtl,
                        children: <Widget>[
                          new ListTile(
                            title: new Text(
                              '${items[position].name}',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff6A4BC3),
                                  fontWeight: FontWeight.w600),
                              textDirection: TextDirection.rtl,
                            ),
                            subtitle: new Row(
                              children: <Widget>[
                                Expanded(
                                  child: new Container(
                                    child: new Column(
                                      children: <Widget>[
                                        new Container(
//
                                          child: new Container(
                                            child: new Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                              children: <Widget>[
                                                new Text(
                                                  'العنوان : ${items[position]
                                                      .address}',
                                                  style:
                                                  TextStyle(fontSize: 13),
                                                  textDirection:
                                                  TextDirection.rtl,
                                                ),
                                                new Text(
                                                  'رقم هاتف الحجز : ${items[position]
                                                      .phonenumber}',
                                                  style:
                                                  TextStyle(fontSize: 13),
                                                  textDirection:
                                                  TextDirection.rtl,
                                                ),
                                                new Container(
                                                  height: 40,
                                                  child: new Card(
                                                      color: Color(0xff38BAC8),
                                                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20),
                                                          side:BorderSide(width: 2,color: Colors.white)),

                                                      child: new FlatButton(
                                                          child:
                                                          new Row(
                                                            children: <Widget>[
                                                              new Icon(
                                                                Icons.edit,
                                                                color: Color(
                                                                    0xff6A4BC3),
                                                                size: 15,
                                                              ),
                                                              new Text("تعديل",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),)
                                                            ],

                                                          ),
                                                          onPressed: () =>
                                                              _navigateToStudent(
                                                                  context,
                                                                  items[position])),
                                                    ),
                                                    margin: EdgeInsets.only(
                                                        right: 150),

                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                new Container(
                                  padding: EdgeInsets.only(left: 5),
                                  child:  new Card(
                                    margin: EdgeInsets.only(bottom: 20),
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(100000),
                                        side:BorderSide(width: 5,color: Colors.white)
                                    ),
                                    child:new Container(

                                      alignment: Alignment.center,
                                      width: 75,
                                      height: 75,
                                      decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                              fit: BoxFit.fill,
                                              image: new NetworkImage(
                                                  "${items[position].doctorimage}")
                                          )
                                      ),
                                    ),

                                  ),
                                ),
                              ],
                            ),
                            onTap: () =>
                                _navigateToStudentInformation(
                                    context, items[position]),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }

  void _onDoctortAdded(Event event) {
    setState(() {
      items.add(new Doctors.fromSnapShot(event.snapshot));
    });
  }

  void _onDoctortUpdated(Event event) {
    var oldDoctorValue =
    items.singleWhere((doctors) => doctors.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldDoctorValue)] =
      new Doctors.fromSnapShot(event.snapshot);
    });
  }

  void _navigateToStudent(BuildContext context, Doctors doctor) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditDoctorPage(doctor)),
    );
  }

  void _navigateToStudentInformation(BuildContext context,
      Doctors doctor) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InfoDoctorPage(doctor)),
    );
  }

  void _createNewStudent(BuildContext context) async {
      await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                AddDoctorPage(Doctors(
                  null,
                  '',
                  '',
                  '',
                  '',
                  '',
                  '',
                  '',
                  'صلاح الدين',
                  'طبيب',
                ))),
      );

  }



}


//
//new Container(
//padding: EdgeInsets.only(left: 5),
//child: new Card(
//margin: EdgeInsets.only(bottom: 30),
//elevation: 5,
//shape: RoundedRectangleBorder(
//borderRadius:
//new BorderRadius.circular(100000),
//side: BorderSide(
//width: 5, color: Colors.white)),
//child: new Container(
//padding: EdgeInsets.all(10),
//width: 80,
//height: 100,
//decoration: new BoxDecoration(
//shape: BoxShape.circle,
//image: new DecorationImage(
//fit: BoxFit.fill,
//image: new NetworkImage(
//"${items[position]
//.doctorimage}"))),
//),
//),
//),