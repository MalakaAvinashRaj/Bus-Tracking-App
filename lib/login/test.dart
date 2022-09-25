import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_password_login/model/shared_preference.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login_screen.dart';

class testScreen extends StatefulWidget {
  @override
  _testScreenState createState() => _testScreenState();
}

class _testScreenState extends State<testScreen> {
  User? users = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final Stream<QuerySnapshot> _user = FirebaseFirestore.instance.collection('users').snapshots();

  PrefService _prefService = PrefService();
  

  getData() async {
    String userUid = await FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance.collection('users').doc(userUid);
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  Future<bool?> _onBackPressed() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Do you want to exit?'),
            actions: <Widget>[
              TextButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              TextButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                  SystemNavigator.pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          bool? result = await _onBackPressed();
          if (result == null) {
            result = false;
          }
          return result;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                _onBackPressed();
              },
            ),
          ),
          // body: StreamBuilder(
          //   stream: FirebaseFirestore.instance.collection('users').snapshots(),
          //   builder: (context, (context, snapshot) {
          //     if(!snapshot.hasData) {
          //       return Text('Loading..');
          //     }
          //     if(snapshot.hasData) {
          //       return Text('Loading..');
          //     }
            
          // }))
    ));
  }
}
