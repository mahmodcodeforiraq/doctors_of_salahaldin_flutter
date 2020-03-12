import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doctors_of_salahaldin/Model/Doctors.dart';

class EditDoctorPage extends StatefulWidget {
  final Doctors doctors;
  EditDoctorPage(this.doctors);
  @override
  State<StatefulWidget> createState() {
    return new StateEditDoctorPage();
  }
}

final doctorRefrance =
    FirebaseDatabase.instance.reference().child('Users').child('Doctor');

class StateEditDoctorPage extends State<EditDoctorPage> {
  TextEditingController _nameControlar;
  TextEditingController _departmentControlar;
  TextEditingController _phonenumberControlar;
  TextEditingController _addressControlar;
  TextEditingController _cityControlar;
  TextEditingController _signNumberControlar;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameControlar = new TextEditingController(text: widget.doctors.name);
    _departmentControlar =
        new TextEditingController(text: widget.doctors.department);
    _phonenumberControlar =
        new TextEditingController(text: widget.doctors.phonenumber);
    _addressControlar = new TextEditingController(text: widget.doctors.address);
    _cityControlar = new TextEditingController(text: widget.doctors.city);
    _signNumberControlar =
        new TextEditingController(text: widget.doctors.signnumber);
  }

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
        body: new Container(
          padding: EdgeInsets.all(40),
          child: ListView(
            children: <Widget>[
              new TextField(
                controller: _nameControlar,
                decoration: InputDecoration(
                  labelText: "الاسم",
                  icon: new Icon(Icons.person, color: Color(0xff6A4BC3)),
                  fillColor: Color(0xff6A4BC3),
                  labelStyle: TextStyle(color: Color(0xff6A4BC3)),
                ),
              ),
              new Padding(padding: EdgeInsets.only(top: 10)),
              new TextField(
                controller: _departmentControlar,
                decoration: InputDecoration(
                    labelText: "الاختصاص",
                    icon: new Icon(
                      Icons.assignment,
                      color: Color(0xff6A4BC3),
                    ),
                    fillColor: Color(0xff6A4BC3),
                    labelStyle: TextStyle(color: Color(0xff6A4BC3))),
              ),
              new Padding(padding: EdgeInsets.only(top: 10)),
              new TextField(
                controller: _addressControlar,
                decoration: InputDecoration(
                  labelText: "العنوان",
                  icon: new Icon(Icons.location_city, color: Color(0xff6A4BC3)),
                  fillColor: Color(0xff6A4BC3),
                  labelStyle: TextStyle(color: Color(0xff6A4BC3)),
                ),
              ),
              new Padding(padding: EdgeInsets.only(top: 10)),
              new TextField(
                controller: _phonenumberControlar,
                decoration: InputDecoration(
                    labelText: "رقم هاتف الحجز",
                    icon: new Icon(
                      Icons.phone,
                      color: Color(0xff6A4BC3),
                    ),
                    fillColor: Color(0xff6A4BC3),
                    labelStyle: TextStyle(color: Color(0xff6A4BC3))),
              ),
              new Padding(padding: EdgeInsets.only(top: 10)),
              new TextField(
                controller: _signNumberControlar,
                decoration: InputDecoration(
                  labelText: "رقم الاجازة",
                  icon: new Icon(Icons.confirmation_number,
                      color: Color(0xff6A4BC3)),
                  fillColor: Color(0xff6A4BC3),
                  labelStyle: TextStyle(color: Color(0xff6A4BC3)),
                ),
              ),
              new Padding(padding: EdgeInsets.only(top: 10)),
              new TextField(
                controller: _cityControlar,
                decoration: InputDecoration(
                    labelText: "المدينة",
                    icon: new Icon(
                      Icons.location_on,
                      color: Colors.deepPurple,
                    ),
                    fillColor: Colors.deepPurple,
                    labelStyle: TextStyle(color: Colors.deepPurple)),
              ),
              new Padding(padding: EdgeInsets.only(top: 30)),
              FloatingActionButton(
                onPressed: () {
                  doctorRefrance.child(widget.doctors.id).set({
                    'doctor_id': widget.doctors.id,
                    'doctor_name': _nameControlar.text,
                    'doctor_department': _departmentControlar.text,
                    'doctor_addres': _addressControlar.text,
                    'doctor_phonenum': _phonenumberControlar.text,
                    'doctor_signup_num': _signNumberControlar.text,
                    'city': _cityControlar.text,
                    'image_doctor': widget.doctors.doctorimage,
                    'mohafada': 'صلاح الدين',
                    'typeofuser': 'طبيب',
                  }).then((_) {
                    Navigator.pop(context);
                  });
                },
                child: new Icon(Icons.forward),
                backgroundColor: Color(0xff6A4BC3),
              ),
              new Padding(padding: EdgeInsets.only(top: 50)),
            ],
          ),
        ));
  }
}
