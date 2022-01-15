import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const PHONE = "phone";
  static const VOTES = "votes";
  static const TRIPS = "trips";
  static const RATING = "rating";
  static const TOKEN = "token";
  static const PHOTO = "photo";




 late String _id;
  late String _name;
  late String _email;
  late String _phone;
  late String _token;
  late String _photo;


  late int _votes;
  late int _trips;
  late double _rating;


//  getters
  String get name => _name;
  String get email => _email;
  String get id => _id;
  String get phone => _phone;
  int get votes => _votes;
  int get trips => _trips;
  double get rating => _rating;
  String get token => _token;
  String get photo => _photo;



  UserModel.fromSnapshot(DocumentSnapshot snapshot){
    _name = snapshot.data()![NAME];
    _email = snapshot.data()![EMAIL];
    _id = snapshot.data()![ID];
    _phone = snapshot.data()![PHONE];
    _token = snapshot.data()![TOKEN];
    _photo = snapshot.data()![TOKEN];
    _votes = snapshot.data()![VOTES];
    _trips = snapshot.data()![TRIPS];
    _rating = snapshot.data()![RATING];


  }

}