import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doctors_of_salahaldin/Model/Doctors.dart';


class Search extends StatefulWidget {

   @override
  State<StatefulWidget> createState() {

    return new StateSearch();
  }
}

final doctorRefrance =
    FirebaseDatabase.instance.reference().child("Users").child("Doctor");




List<Doctors> itemsSearch;
List<Doctors> items;


StreamSubscription<Event> _onDoctorAddedSubscription;
StreamSubscription<Event> _onDoctorChangedSubscription;

class StateSearch extends State<Search> {

  TextEditingController searchControllar ;


  int radioValue ;


 Query fireQuery;



  void onChangeValue(int value) {
    setState(() {
      radioValue = value;
    });
  }

  @override
  void initState() {


    super.initState();


items = new List();
itemsSearch = new List();

searchControllar   = new TextEditingController();


items = itemsSearch;
    fireQuery = doctorRefrance;

  _onDoctorChangedSubscription = doctorRefrance.onChildChanged.listen(_onDoctortUpdated);
  _onDoctorAddedSubscription = doctorRefrance.onChildAdded.listen(_onDoctortAdded);



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
      appBar: new AppBar(
        shape: RoundedRectangleBorder(
            borderRadius:
                new BorderRadius.only(bottomRight: Radius.circular(35))
        ),
        title: new Text("دليل اطباء صلاح الدين"),
        centerTitle: true,
        backgroundColor: Color(0xff6A4BC3),
        actions: <Widget>[],
      ),

      body: new Stack(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(top: 300),

            child:
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
                                                    'العنوان : ${items[position].address}',
                                                    style:
                                                    TextStyle(fontSize: 13),
                                                    textDirection:
                                                    TextDirection.rtl,
                                                  ),
                                                  new Text(
                                                    'رقم هاتف الحجز : ${items[position].phonenumber}',
                                                    style:
                                                    TextStyle(fontSize: 13),
                                                    textDirection:
                                                    TextDirection.rtl,
                                                  ),

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
//                              onTap: () =>
//                                  _navigateToStudentInformation(
//                                      context, items[position]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),

          new Column(
            children: <Widget>[
              new Padding(padding: EdgeInsets.only(top: 20)),
              new Text(
                'ابحث حسب :',
                style: TextStyle(fontSize: 26),
                textDirection: TextDirection.rtl,
              ),
              new Padding(padding: EdgeInsets.only(top: 20)),
              new RadioListTile(
                value: 0,
                groupValue: radioValue,
                onChanged: onChangeValue,
                title: new Text('الاسم'),
                activeColor: Colors.greenAccent,

              ),
              new RadioListTile(
                value: 1,
                groupValue: radioValue,
                onChanged: onChangeValue,
                title: new Text('الاختصاص'),
                activeColor: Colors.deepPurple,

              ),
              new Padding(padding: EdgeInsets.only(top: 20)),
              new Container(
                child: new TextField(
                  onSubmitted:(searchText){


                    if(radioValue==0){
                      SearchName(searchControllar.text);

                    }else if(radioValue==1){

                        SearchDepartment(searchControllar.text);

                    }else if(radioValue==null){

                      alertDialogifnotselect();
                    }

                  },
                  textInputAction: TextInputAction.search,
                  controller: searchControllar,
                  decoration: InputDecoration(
                    labelText: "البحث",
                    icon: new Icon(Icons.search, color: Color(0xff6A4BC3)),
                    fillColor: Color(0xff6A4BC3),
                    labelStyle: TextStyle(color: Color(0xff6A4BC3)),
                  ),
                ),
                padding: EdgeInsets.only(left: 30,right: 30),
              ),



            ],
          ),


        ],
      )

    );

  }


  void SearchName(String searchname)  {
    items.clear();

    setState(() {

      var fireQuery = doctorRefrance.orderByChild('doctor_name').startAt(searchname).endAt(searchname + '\uf8ff');

      String name,department,addres,phonenumber,sign_number,image,city,mohafada,typeofuser;

      fireQuery.once().then(( snapshot) {

        setState(() {
          if(snapshot.value == null ){
            alertDialog();
          }
          else{

            snapshot.value.forEach((key , value){

              name = value['doctor_name'].toString().trim();
              department = value['doctor_department'].toString().trim();
              addres = value['doctor_addres'].toString().trim();
              phonenumber = value['doctor_phonenum'].toString().trim();
              sign_number = value['doctor_signup_num'].toString().trim();
              image = value['image_doctor'].toString().trim();
              city = value['city'].toString().trim();
              mohafada = value['mohafada'].toString().trim();
              typeofuser = value['typeofuser'].toString().trim();

              items.add(new Doctors(key, name, department, addres,
                  phonenumber,
                  sign_number, image
                  , city
                  ,  mohafada
                  , typeofuser));

            });
          }

        });



      });
    });
  }

  void SearchDepartment(String searchDepartment)  {
    items.clear();


    setState(() {

      fireQuery =doctorRefrance.orderByChild('doctor_department').startAt(searchDepartment).endAt(searchDepartment + '\uf8ff');

      String name,department,addres,phonenumber,sign_number,image,city,mohafada,typeofuser;

      fireQuery.once().then(( snapshot) {

        setState(() {
          if(snapshot.value == null ){
            alertDialog();
          }
          else{

            snapshot.value.forEach((key , value){

              name = value['doctor_name'].toString().trim();
              department = value['doctor_department'].toString().trim();
              addres = value['doctor_addres'].toString().trim();
              phonenumber = value['doctor_phonenum'].toString().trim();
              sign_number = value['doctor_signup_num'].toString().trim();
              image = value['image_doctor'].toString().trim();
              city = value['city'].toString().trim();
              mohafada = value['mohafada'].toString().trim();
              typeofuser = value['typeofuser'].toString().trim();

              items.add(new Doctors(key, name, department, addres,
                  phonenumber,
                  sign_number, image
                  , city
                  ,  mohafada
                  , typeofuser));

            });
          }

        });

      });
    });
  }





  void _onDoctortAdded(Event event) {
    setState(() {
      items.add(new Doctors.fromSnapShot(event.snapshot));
    });
  }

  void _onDoctortUpdated(Event event) {
    var oldDoctorValue =
    itemsSearch.singleWhere((doctors) => doctors.id == event.snapshot.key);
    setState(() {
      itemsSearch[itemsSearch.indexOf(oldDoctorValue)] = new Doctors.fromSnapShot(event.snapshot);
    });
  }


  Future<void> alertDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return new SimpleDialog(
            children: <Widget>[
              new Container(
                height: 100,
                child: new Column(
                  children: <Widget>[
                    new Text(
                      '!!هذا الطبيب غير موجود',
                      style: TextStyle(fontSize: 20),
                    ),
                    new Icon(
                      Icons.error,
                      size: 50,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ],

            elevation: 5,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10)),
          );
        });
  }

  Future<void> alertDialogifnotselect() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return new SimpleDialog(
            children: <Widget>[
              new Container(
                height: 100,
                child: new Column(
                  children: <Widget>[
                    new Text(
                      '!!يجب عليك اختيار نوع البحث',
                      style: TextStyle(fontSize: 20),
                    ),
                    new Icon(
                      Icons.error,
                      size: 50,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ],

            elevation: 5,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10)),
          );
        });
  }






}
