import 'package:firebase_database/firebase_database.dart';

class Doctors {
  String _id;
  String _name;
  String _department;
  String _address;
  String _phonenumber;
  String _signnumber;
  String _doctorimage;
  String _city;
  String _mohafada;
  String _typeofuser;

  Doctors(
      this._id,
      this._name,
      this._department,
      this._address,
      this._phonenumber,
      this._signnumber,
      this._doctorimage,
      this._city,
      this._typeofuser,
      this._mohafada);

  Doctors.map(dynamic obj) {
    this._id = obj['doctor_id'];
    this._name = obj['doctor_name'];
    this._department = obj['doctor_department'];
    this._address = obj['doctor_addres'];
    this._phonenumber = obj['doctor_phonenum'];
    this._signnumber = obj['doctor_signup_num'];
    this._doctorimage = obj['image_doctor'];
    this._city = obj['city'];
    this._mohafada = obj['mohafada'];
    this._typeofuser = obj['typeofuser'];
  }

  String get id => _id;
  String get name => _name;
  String get department => _department;
  String get address => _address;
  String get phonenumber => _phonenumber;
  String get signnumber => _signnumber;
  String get doctorimage => _doctorimage;
  String get city => _city;
  String get mohafada => _mohafada;
  String get typeofuser => _typeofuser;

  Doctors.fromSnapShot(DataSnapshot snapshot) {
    _id = snapshot.value['doctor_id'];
    _name = snapshot.value['doctor_name'];
    _department = snapshot.value['doctor_department'];
    _address = snapshot.value['doctor_addres'];
    _phonenumber = snapshot.value['doctor_phonenum'];
    _signnumber = snapshot.value['doctor_signup_num'];
    _doctorimage = snapshot.value['image_doctor'];
    _city = snapshot.value['city'];
    _mohafada = snapshot.value['mohafada'];
    _typeofuser = snapshot.value['typeofuser'];
  }
}
