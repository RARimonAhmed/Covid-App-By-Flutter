import 'package:covid_application_flutter/constants/my_colors.dart';
import 'package:covid_application_flutter/models/world_state_model.dart';
import 'package:covid_application_flutter/services/state_services.dart';
import 'package:covid_application_flutter/views/countries_list.dart';
import 'package:covid_application_flutter/widgets/reusable_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
    StateServices stateServices = StateServices();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                FutureBuilder(
                    future: stateServices.getWorldStateRecords(),
                    builder:
                        (context, AsyncSnapshot<WorldStateModel> snapshot) {
                      if (!snapshot.hasData) {
                        return Expanded(
                          flex: 1,
                          child: SpinKitFadingCircle(
                            color: Colors.white,
                            size: 50,
                            controller: animationController,
                          ),
                        );
                      } else {
                        return Column(
                          children: [
                            PieChart(
                              dataMap: {
                                "Total": double.parse(
                                    snapshot.data!.cases!.toString()),
                                "Death": double.parse(
                                    snapshot.data!.deaths.toString()),
                                "Recoverd": double.parse(
                                    snapshot.data!.recovered.toString()),
                              },
                              chartType: ChartType.ring,
                              animationDuration: const Duration(
                                milliseconds: 1200,
                              ),
                              colorList: myColor.colorList,
                              legendOptions: const LegendOptions(
                                legendPosition: LegendPosition.left,
                              ),
                              chartRadius:
                                  MediaQuery.of(context).size.height / 4.2,
                              chartValuesOptions: const ChartValuesOptions(
                                showChartValuesInPercentage: true,
                                chartValueBackgroundColor: Colors.purple,
                                chartValueStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height *
                                      0.06),
                              child: Card(
                                child: Column(
                                  children: [
                                    ReusableRow(
                                        title: 'Total',
                                        values:
                                            snapshot.data!.cases!.toString()),
                                    ReusableRow(
                                        title: 'Deaths',
                                        values:
                                            snapshot.data!.deaths!.toString()),
                                    ReusableRow(
                                        title: 'Recovered',
                                        values: snapshot.data!.recovered!
                                            .toString()),
                                    ReusableRow(
                                        title: 'Active',
                                        values:
                                            snapshot.data!.active!.toString()),
                                    ReusableRow(
                                        title: 'Critical',
                                        values: snapshot.data!.critical!
                                            .toString()),
                                    ReusableRow(
                                        title: 'Todays Recovered',
                                        values: snapshot.data!.todayRecovered!
                                            .toString()),
                                    ReusableRow(
                                        title: 'Todays Deaths',
                                        values: snapshot.data!.todayDeaths!
                                            .toString()),
                                    ReusableRow(
                                        title: 'Todays Cases',
                                        values: snapshot.data!.todayCases!
                                            .toString()),
                                    // ReusableRow(
                                    //     title: 'Updated',
                                    //     values:
                                    //         snapshot.data!.updated!.toString()),
                                    // ReusableRow(
                                    //     title: 'Tests',
                                    //     values:
                                    //         snapshot.data!.tests!.toString()),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CountriesList()));
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xff1aa260),
                                ),
                                child: const Center(
                                    child: Text('Track Countries')),
                              ),
                            ),
                          ],
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
