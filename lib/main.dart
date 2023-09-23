import 'package:flutter/material.dart';
import 'package:tempo/pages/homepage.dart';

void main() {
  runApp(
    MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        debugShowCheckedModeBanner: false,
        home: Homepage()),
  );
}
