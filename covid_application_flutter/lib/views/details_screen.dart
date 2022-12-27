// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:covid_application_flutter/widgets/reusable_row.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  String name, image;
  int totalCase,
      population,
      totalDeath,
      active,
      recovered,
      todayRecovered,
      todayDeaths,
      critical,
      test;
  DetailsScreen({
    Key? key,
    required this.image,
    required this.name,
    required this.critical,
    required this.todayDeaths,
    required this.active,
    required this.recovered,
    required this.test,
    required this.todayRecovered,
    required this.totalCase,
    required this.totalDeath,
    required this.population,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.name,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .06,
                      ),
                      ReusableRow(
                          title: 'Country Name',
                          values: widget.name.toString()),
                      ReusableRow(
                          title: 'Population',
                          values: widget.population.toString()),
                      ReusableRow(
                          title: 'Test', values: widget.test.toString()),
                      ReusableRow(
                          title: 'Cases', values: widget.totalCase.toString()),
                      ReusableRow(
                          title: 'Active', values: widget.active.toString()),
                      ReusableRow(
                          title: 'Recovered',
                          values: widget.recovered.toString()),
                      ReusableRow(
                          title: 'Today Recovered',
                          values: widget.todayRecovered.toString()),
                      ReusableRow(
                          title: 'Critical',
                          values: widget.critical.toString()),
                      ReusableRow(
                          title: 'Today Death',
                          values: widget.todayDeaths.toString()),
                      ReusableRow(
                          title: 'Death', values: widget.totalDeath.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image.toString()),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
