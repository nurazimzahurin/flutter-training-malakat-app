import 'package:flutter/material.dart';
import 'package:flutter_training/services/auth.dart';
import 'package:flutter_training/services/database.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File imageFile;

  final AuthService _auth = AuthService();

  Position _currentPosition;

  String name;
  String email;
  String phone;
  Widget setImage;
  

  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  _cacheImage(path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String user = await _auth.currentUser();

    prefs.setString("profile_photo_$user", path);
  }

  Future<Widget> _getCacheImage() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String user = await _auth.currentUser();

      final image = prefs.getString("profile_photo_$user");

      if (image != null) {
        setState(() {
          imageFile = File(image);
        });
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
@override
void initState() { 
  getUsername();
  super.initState();
  _getCacheImage();
}
  _openGallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);

    Directory getPath = await getApplicationDocumentsDirectory();

    String appDocPath = getPath.path;

    String user = await _auth.currentUser();

    dynamic time = DateTime.now();

    var gambar = await picture.copy('$appDocPath/$time._profile_picture.jpg');

    var set = gambar.path;

    _cacheImage(set);

    setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);

    Directory getPath = await getApplicationDocumentsDirectory();

    String appDocPath = getPath.path;

    String user = await _auth.currentUser();

    dynamic time = DateTime.now();

    var gambar = await picture.copy('$appDocPath/$time._profile_picture.jpg');

    var set = gambar.path;

    _cacheImage(set);

    setState(() {
      imageFile = gambar;
    });

    Navigator.of(context).pop();
  }

  Future<void> _showDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Make a choice!'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text('Gallery'),
                    onTap: () {
                      _openGallery(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  GestureDetector(
                    child: Text('Camera'),
                    onTap: () {
                      _openCamera(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _chooseImage() {
    if (imageFile == null) {
      return Text('No image');
    } else {
      return Image.file(
        imageFile,
        width: 300,
        height: 300,
        fit: BoxFit.cover,
      );
    }
  }

  getUsername() async {
    var uid = await _auth.currentUser();

    var profile = await DatabaseService(uid: uid).getProfile();

    setState(() {
      name = profile['name'];
      email = profile['email'];
      phone = profile['phoneNumber'];
      _emailController.text = email;
      _phoneController.text = phone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          InkWell(
            child: Icon(Icons.exit_to_app),
            onTap: () async {
              await _auth.signOut();
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
            },
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    color: Color.fromRGBO(232, 165, 52, 1),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.6,
                    color: Color.fromRGBO(241, 241, 241, 1),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    child: CircleAvatar(
                      radius: 52,
                      child: ClipRRect(
                        child: _chooseImage(),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 20,
                    child: InkWell(
                        onTap: () {
                          _showDialog(context);
                        },
                        child: Text('Edit Photo',
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(34, 27, 227, 1)))),
                  ), //edit photo
                  SizedBox(
                    height: 7,
                  ),
                  SizedBox(
                    height: 30,
                    child: Text(
                      name != null ? name : 'Loading ...',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ), //nama
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                    child: Container(
                      height: 300,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Phone number',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            TextField(
                              controller: _phoneController,
                              decoration: InputDecoration(hintText: phone),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Email Address',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            TextField(
                              controller: _emailController,
                              decoration: InputDecoration(hintText: email),
                            ),
                            SizedBox(height: 50),
                            InkWell(
                                onTap: () {
                                  _getCurrentLocation();
                                },
                                child: Text('Get Location',
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(34, 27, 227, 1)))),
                            SizedBox(
                              height: 10,
                            ),
                            if (_currentPosition != null)
                              Text(
                                  "LN ${_currentPosition.longitude}  LT ${_currentPosition.latitude}"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                              width: 160,
                              child: RaisedButton(
                                color: Color.fromRGBO(147, 147, 147, 1),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                          SizedBox(
                              width: 160,
                              child: RaisedButton(
                                color: Color.fromRGBO(232, 165, 52, 1),
                                onPressed: () async {
                                  dynamic result =
                                      await AuthService().currentUser();
                                  if (result != null) {
                                    DatabaseService(uid: result).updateProfile(
                                        _emailController.text,
                                        _phoneController.text);
                                    Navigator.pop(context);
                                    print('yes');
                                  } else {
                                    print('no');
                                  }
                                },
                                child: Text(
                                  'Save',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }
}
