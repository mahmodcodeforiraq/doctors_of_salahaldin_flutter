import 'dart:io';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doctors_of_salahaldin/Model/Doctors.dart';
import 'package:doctors_of_salahaldin/UI_Pages/homePage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class AddDoctorPage extends StatefulWidget {
  final Doctors doctors;
  AddDoctorPage(this.doctors);
  @override
  State<StatefulWidget> createState() {
    return new StateAddDoctorPage();
  }
}

final doctorRefrance =
    FirebaseDatabase.instance.reference().child("Users").child("Doctor");

File image;
String url ='';

class StateAddDoctorPage extends State<AddDoctorPage> {
  List<Doctors> items;

  TextEditingController _nameControlar = new TextEditingController();
  TextEditingController _departmentControlar = new TextEditingController();
  TextEditingController _phonenumberControlar = new TextEditingController();
  TextEditingController _addressControlar = new TextEditingController();
  TextEditingController _cityControlar = new TextEditingController();
  TextEditingController _signNumberControlar = new TextEditingController();

  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      image = tempImage;

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    items = new List();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          shape: RoundedRectangleBorder(
              borderRadius:
                  new BorderRadius.only(bottomRight: Radius.circular(35))),
          title: new Text("اضافة طبيب جديد"),
          centerTitle: true,
          backgroundColor: Color(0xff6A4BC3),
        ),
        body: new Container(
          padding: EdgeInsets.all(40),
          child: ListView(
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new FlatButton(
                    onPressed: getImage,
                    child: new Row(
                      children: <Widget>[
                        new Text("اضافة صورة"),
                        new Padding(padding: EdgeInsets.only(left: 10)),
                        new Icon(Icons.add_a_photo)
                      ],
                    ),
                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5)),
                    color: Color(0xff6A4BC3),
                    textColor: Colors.white,
                    splashColor: Colors.red,

                  ),
                ],
              ),

             image ==null ? Image.asset('img/logo.png',width: 75,height: 75,alignment: Alignment.center,)
                 :Image.file(image,width: 75,height: 75,alignment: Alignment.center,),

              new TextField(
                controller: _nameControlar,
                decoration: InputDecoration(
                  labelText: "الاسم",
                  icon: new Icon(Icons.person, color: Colors.deepPurple),
                  fillColor: Colors.deepPurple,
                  labelStyle: TextStyle(color: Colors.deepPurple),
                ),
              ),
              new Padding(padding: EdgeInsets.only(top: 10)),
              new TextField(
                controller: _departmentControlar,
                decoration: InputDecoration(
                    labelText: "الاختصاص",
                    icon: new Icon(
                      Icons.assignment,
                      color: Colors.deepPurple,
                    ),
                    fillColor: Colors.deepPurple,
                    labelStyle: TextStyle(color: Colors.deepPurple)),
              ),
              new Padding(padding: EdgeInsets.only(top: 10)),
              new TextField(
                controller: _addressControlar,
                decoration: InputDecoration(
                  labelText: "العنوان",
                  icon: new Icon(Icons.location_city, color: Colors.deepPurple),
                  fillColor: Colors.deepPurple,
                  labelStyle: TextStyle(color: Colors.deepPurple),
                ),
              ),
              new Padding(padding: EdgeInsets.only(top: 10)),
              new TextField(
                controller: _phonenumberControlar,
                decoration: InputDecoration(
                    labelText: "رقم هاتف الحجز",
                    icon: new Icon(
                      Icons.phone,
                      color: Colors.deepPurple,
                    ),
                    fillColor: Colors.deepPurple,
                    labelStyle: TextStyle(color: Colors.deepPurple)),
              ),
              new Padding(padding: EdgeInsets.only(top: 10)),
              new TextField(
                controller: _signNumberControlar,
                decoration: InputDecoration(
                  labelText: "رقم الاجازة",
                  icon: new Icon(Icons.confirmation_number,
                      color: Colors.deepPurple),
                  fillColor: Colors.deepPurple,
                  labelStyle: TextStyle(color: Colors.deepPurple),
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
              new FloatingActionButton(
                onPressed: checkname,
                child: new Icon(Icons.arrow_forward),
                backgroundColor: Colors.deepPurple,
              ),
              new Padding(padding: EdgeInsets.only(top: 50)),
            ]
          )
    )
    );
  }

  void checkname() {
    doctorRefrance
        .orderByChild('doctor_name').startAt(_nameControlar.text).endAt(_nameControlar.text).once()
        .then((DataSnapshot snapshot) {
      if (snapshot.value != null) {
        alertDialog();
      } else {

        uploadimage();


      }
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
                      'هذا الاسم موجود مسبقا !!',
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

  Future uploadimage()async {
    if (image != null) {
      var id = doctorRefrance
          .push()
          .key;

      var imagepath = id + '.jpg';


      StorageReference reference = FirebaseStorage.instance.ref().child(
          'personal_image/').child(imagepath);

      final StorageUploadTask task = reference.putFile(image);

      await task.onComplete;

      reference.getDownloadURL().then((fileUrl) {
        setState(() {
          doctorRefrance.push().set({
            'doctor_id': id,
            'doctor_name': _nameControlar.text,
            'doctor_department': _departmentControlar.text,
            'doctor_addres': _addressControlar.text,
            'doctor_phonenum': _phonenumberControlar.text,
            'doctor_signup_num': _signNumberControlar.text,
            'city': _cityControlar.text,
            'image_doctor': fileUrl,
            'mohafada': 'صلاح الدين',
            'typeofuser': 'طبيب',
          }).then((_) {
            Navigator.pop(context);
          });
        });
      });
    } else {
      var defultImage = 'https://firebasestorage.googleapis.com/v0/b/doctorsofsalahaldin.appspot.com/o/personal_image%2F-Lw8EsWa7iChTu2RAzpo.jpg?alt=media&token=81b397b9-b6e1-402b-8320-69dfeac420e7';

      var id = doctorRefrance
          .push()
          .key;


      doctorRefrance.push().set({
        'doctor_id': id,
        'doctor_name': _nameControlar.text,
        'doctor_department': _departmentControlar.text,
        'doctor_addres': _addressControlar.text,
        'doctor_phonenum': _phonenumberControlar.text,
        'doctor_signup_num': _signNumberControlar.text,
        'city': _cityControlar.text,
        'image_doctor': defultImage,
        'mohafada': 'صلاح الدين',
        'typeofuser': 'طبيب',
      }).then((_) {
        Navigator.pop(context);
      });
    }
  }
}
