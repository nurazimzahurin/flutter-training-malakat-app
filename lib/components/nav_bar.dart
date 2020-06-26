import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: SizedBox(
              height: 15,
              child: Image.asset('images/nav1.png'),
            ),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 9),
            )),
        BottomNavigationBarItem(
            icon: SizedBox(
              height: 15,
              child: Image.asset('images/nav2.png'),
            ),
            title: Text(
              'Search',
              style: TextStyle(fontSize: 9),
            )),
        BottomNavigationBarItem(
            icon: SizedBox(
              height: 15,
              child: Image.asset('images/nav3.png'),
            ),
            title: Text(
              'Cart',
              style: TextStyle(fontSize: 9),
            )),
        BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/profile');
              },
              child: SizedBox(
                height: 15,
                child: Image.asset('images/nav4.png'),
              ),
            ),
            title: Text(
              'Profile',
              style: TextStyle(fontSize: 9),
            )),
        BottomNavigationBarItem(
            icon: SizedBox(
              height: 12,
              child: Image.asset('images/nav5.png'),
            ),
            title: Text(
              'More',
              style: TextStyle(fontSize: 9),
            )),
      ],
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,
    );
  }
}
