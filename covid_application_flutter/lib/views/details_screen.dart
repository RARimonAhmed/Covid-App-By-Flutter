// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  String name, image;
  int totalCase,
      totalRecovered,
      totalDeath,
      active,
      recovered,
      todayRecovered,
      test;
  DetailsScreen({
    Key? key,
    required this.image,
    required this.name,
    required this.active,
    required this.recovered,
    required this.test,
    required this.todayRecovered,
    required this.totalCase,
    required this.totalDeath,
    required this.totalRecovered,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(elevation: 0, title: Text('Raj')),
      body: Column(
        children: [Text('Rimon Ahmed')],
      ),
    ));
  }
}
