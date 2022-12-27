import 'package:covid_application_flutter/services/state_services.dart';
import 'package:covid_application_flutter/views/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/my_colors.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({super.key});

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList>
    with TickerProviderStateMixin {
  StateServices stateServices = StateServices();
  TextEditingController searchController = TextEditingController();
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Search any country here',
                    label: const Text('Country'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                    future: stateServices.getCountriesList(),
                    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: Column(
                            children: [
                              Shimmer.fromColors(
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Container(
                                          color: Colors.white,
                                          height: 10,
                                          width: 89,
                                        ),
                                        subtitle: Container(
                                          color: Colors.white,
                                          height: 10,
                                          width: 89,
                                        ),
                                        leading: Container(
                                          color: Colors.white,
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                    ],
                                  ),
                                  baseColor: Colors.grey.shade700,
                                  highlightColor: Colors.grey.shade100),
                              const Text('Loading data'),
                            ],
                          ),
                        );
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              String searchCountry =
                                  snapshot.data![index]['country'];
                              if (searchController.text.isEmpty) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    DetailsScreen(
                                                      active: null,
                                                      image: '',
                                                      name: '',
                                                      recovered: null,
                                                      test: null,
                                                      todayRecovered: null,
                                                      totalCase: null,
                                                      totalDeath: null,
                                                      totalRecovered: null,
                                                    ))));
                                      },
                                      child: ListTile(
                                        leading: Image(
                                          height: 50,
                                          width: 50,
                                          image: NetworkImage(
                                              snapshot.data![index]
                                                  ['countryInfo']['flag']),
                                        ),
                                        title: Text(
                                            snapshot.data![index]['country']),
                                        subtitle: Text(snapshot.data![index]
                                                ['cases']
                                            .toString()),
                                      ),
                                    ),
                                  ],
                                );
                              } else if (searchCountry.toLowerCase().contains(
                                  searchController.text.toLowerCase())) {
                                return Column(
                                  children: [
                                    ListTile(
                                      leading: Image(
                                        height: 50,
                                        width: 50,
                                        image: NetworkImage(
                                            snapshot.data![index]['countryInfo']
                                                ['flag']),
                                      ),
                                      title: Text(
                                          snapshot.data![index]['country']),
                                      subtitle: Text(snapshot.data![index]
                                              ['cases']
                                          .toString()),
                                    ),
                                  ],
                                );
                              } else {
                                return Center(
                                  child: Container(),
                                  // Column(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   children: [
                                  //     SpinKitFadingCube(
                                  //       color: Colors.blue,
                                  //       size: 200,
                                  //       controller: animationController,
                                  //     ),
                                  //     const Text(
                                  //       'Noting to found',
                                  //       style: TextStyle(
                                  //           color: Colors.red,
                                  //           fontSize: 25,
                                  //           fontWeight: FontWeight.bold),
                                  //     ),
                                  //   ],
                                  // ),
                                );
                              }
                            });
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
