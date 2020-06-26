import 'package:flutter/material.dart';
import 'package:flutter_training/components/loading.dart';
import 'package:flutter_training/screens/register.dart';
import 'package:flutter_training/services/auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _email = TextEditingController();
  final _pass = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading == true
        ? Loading()
        : Scaffold(
            body: SingleChildScrollView(
              child: Container(
                color: Color.fromRGBO(255, 255, 255, 1),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(60, 130, 60, 60),
                      child: Image.asset('images/login3.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: Text('Sign in',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: TextField(
                        controller: _email,
                        decoration: InputDecoration(
                          hintText: 'Email Address',
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.grey)),
                          prefixIcon: new Padding(
                            padding: const EdgeInsets.only(
                                top: 17, left: 5, right: 5, bottom: 17),
                            child: SizedBox(
                              height: 1,
                              child: Image.asset(
                                'images/login1.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 60),
                      child: TextField(
                        controller: _pass,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(
                                  color: Color.fromRGBO(26, 26, 26, 1))),
                          prefixIcon: new Padding(
                            padding: const EdgeInsets.only(
                                top: 15, left: 5, right: 0, bottom: 15),
                            child: new SizedBox(
                              height: 3,
                              child: Image.asset('images/login2.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 20),
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: FlatButton(
                          onPressed: () async {
                            setState(() {
                              loading = true;
                            });

                            if (_email.text == '' || _pass.text == '') {
                              setState(() {
                                loading = false;
                              });

                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Oops'),
                                      content: Text(
                                        'All fields are required',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 18),
                                      ),
                                    );
                                  });
                              return;
                            }

                            dynamic result = await AuthService()
                                .signIn(_email.text, _pass.text);

                            if (result == false) {
                              setState(() {
                                loading = false;
                              });

                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Oops'),
                                      content: Text('Invalid credentials',
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 18)),
                                    );
                                  });
                              return;
                            } else if (result == true) {
                              Navigator.pushReplacementNamed(context, '/home');
                            }else{
                              setState(() {
                                loading = false;
                              });

                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Oops'),
                                      content: Text('Network Error',
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 18)),
                                    );
                                  });
                            }
                          },
                          child: Text('Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(
                                color: Color.fromRGBO(219, 69, 69, 1)),
                          ),
                          color: Color.fromRGBO(219, 69, 69, 1),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Forgot password? ',
                            style: TextStyle(
                                color: Color.fromRGBO(84, 94, 218, 1))),
                        Text('or'),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()),
                            );
                          },
                          child: Text(' Register',
                              style: TextStyle(
                                  color: Color.fromRGBO(84, 94, 218, 1))),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
