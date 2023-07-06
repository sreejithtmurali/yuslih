import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../models/RspBanner.dart';

Widget BottomNav({VoidCallback? onPressed}) {
  int _current = 0;

  _onItemTapped(int i) {
    _current=i;
  }

  return BottomNavigationBar(
  items: const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
  icon: Icon(Icons.home),
  label: 'Home',
  ),
  BottomNavigationBarItem(
  icon: Icon(Icons.bookmark),
      label: 'Home',
  ),
  BottomNavigationBarItem(
  icon: Icon(Icons.contact_mail),
    label: 'Home',
  ),
  ],
  currentIndex: _current,
  selectedItemColor: Colors.amber[800],
  onTap: _onItemTapped,
  );

}


