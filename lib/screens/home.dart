import 'package:flutter/material.dart';
import 'package:flutter_training/components/nav_bar.dart';
import 'package:flutter_training/components/product.dart';
import 'package:flutter_training/components/promotion.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height* 0.2,
                      color: Color.fromRGBO(219, 69, 69, 1),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height* 0.5,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height* 0.17,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 30, top: 50, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 260,
                              height: 42,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                    ),
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 7),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'search product...',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color.fromRGBO(176, 178, 181, 1)),
                                    ),
                                    Icon(
                                      Icons.search,
                                      color: Color.fromRGBO(176, 178, 181, 1),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Image.asset('images/message.png', width: 22),
                            Image.asset('images/noti.png', width: 22),
                            Image.asset('images/person.png', width: 22),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height* 0.745,
                      child: Column(
                        children: <Widget>[
                          Padding(
                      padding: const EdgeInsets.only(top: 40, left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('Categories',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700])),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, top: 15, right: 15),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: Offset(0.5, 1)),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      'images/baju.png',
                                      width: 40,
                                      height: 35,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        'Clothing',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(162, 162, 162, 1),
                                            fontSize: 10),
                                      ),
                                    )
                                  ]),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'images/lip.png',
                                    width: 40,
                                    height: 35,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'Beauty',
                                      style: TextStyle(
                                          color: Color.fromRGBO(162, 162, 162, 1),
                                          fontSize: 10),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'images/heel.png',
                                    width: 40,
                                    height: 35,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'Shoes',
                                      style: TextStyle(
                                          color: Color.fromRGBO(162, 162, 162, 1),
                                          fontSize: 10),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'images/tv.png',
                                    width: 40,
                                    height: 35,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'Electronics',
                                      style: TextStyle(
                                          color: Color.fromRGBO(162, 162, 162, 1),
                                          fontSize: 10),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'images/all.png',
                                    width: 40,
                                    height: 35,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 0),
                                    child: Text(
                                      'See all',
                                      style: TextStyle(
                                          color: Color.fromRGBO(162, 162, 162, 1),
                                          fontSize: 10),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('Latest',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700])),
                        ],
                      ),
                    ),
                    Promotion(),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('Top Picks',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700])),
                        ],
                      ),
                    ),
                    Product()
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: NavBar(),
      ),
    );
  }
}
