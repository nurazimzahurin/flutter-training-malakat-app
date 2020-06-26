import 'package:flutter/material.dart';
import 'package:flutter_training/services/auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  final Color gradientStart = Color.fromRGBO(173, 37, 37, 1);
  final Color gradientEnd = Color.fromRGBO(232, 165, 52, 1);

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(28.0),
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [gradientStart, gradientEnd],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(60, 90, 60, 20),
                child: Image.asset('images/login3.png'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text('Sign Up',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white)),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Name',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: new OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: new OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Email Address',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: new OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: FlatButton(
                    onPressed: () async {

                      if(_emailController.text == '' || _passwordController.text == ''){
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Oops'),
                                content: Text('Email and Password fields are required', style: TextStyle(color: Colors.red, fontSize: 18),),
                              );
                            });
                        return;
                      }

                      dynamic result =
                          await _auth.register(_nameController.text, _phoneController.text, _emailController.text, _passwordController.text);
                      if (result == 'success') {
                        Navigator.pushReplacementNamed(context, '/home');
                      }else{
                        var error = result;
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Oops'),
                                content: Text(error, style: TextStyle(color: Colors.red, fontSize: 18)),
                              );
                            });
                        return;
                      }
                    },
                    child: Text('Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Color.fromRGBO(112, 60, 14, 1)),
                    ),
                    color: Color.fromRGBO(112, 60, 14, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
