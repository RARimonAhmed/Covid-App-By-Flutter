import 'package:covid_application_flutter/constants/my_colors.dart';
import 'package:covid_application_flutter/widgets/reusable_row.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  MyColor myColor = MyColor();
  late final AnimationController animationController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              PieChart(
                dataMap: const {
                  "Total": 20,
                  "Death": 5,
                  "Recoverd": 15,
                },
                chartType: ChartType.ring,
                animationDuration: const Duration(
                  milliseconds: 1200,
                ),
                colorList: myColor.colorList,
                legendOptions: const LegendOptions(
                  legendPosition: LegendPosition.left,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.06),
                child: Card(
                  child: Column(
                    children: [
                      ReusableRow(title: 'Total', values: '200'),
                      ReusableRow(title: 'Total', values: '200'),
                      ReusableRow(title: 'Total', values: '200'),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff1aa260),
                ),
                child: const Center(child: Text('Track Countries')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
