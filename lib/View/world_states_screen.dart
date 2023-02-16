import 'package:covid_tracker_api/Model/WorldStatesModel.dart';
import 'package:covid_tracker_api/Services/Utilities/states_services.dart';
import 'package:covid_tracker_api/View/countries_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStates extends StatefulWidget {
  const WorldStates({Key? key}) : super(key: key);

  @override
  State<WorldStates> createState() => _WorldStatesState();
}

class _WorldStatesState extends State<WorldStates>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 5), vsync: this)
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final colorList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa268),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {

    StatesServices statesServices = StatesServices();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
               FutureBuilder(
                 future: statesServices.fetchWorldStatesRecords(),
                   builder: (context, AsyncSnapshot<WorldStatesModel> snapshot){
                   if(!snapshot.hasData){
                     print(snapshot);
                     print("${snapshot.data} hhhhh");
                     return Expanded(
                       flex: 1,
                         child: SpinKitFadingCircle(
                       size: 50.0,
                       color: Colors.white,
                       controller: _controller,
                     ));
                   }
                   else{
                          return Expanded(
                            flex: 6,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                PieChart(
                                  chartValuesOptions: const ChartValuesOptions(
                                    showChartValuesInPercentage: true,
                                  ),
                                  chartRadius: 150.0,
                                  ringStrokeWidth: 20.0,
                                  dataMap: {
                                    'Total': double.parse(snapshot.data!.cases.toString(),),
                                    'Recovered': double.parse(snapshot.data!.recovered.toString(),),
                                    'Deaths': double.parse(snapshot.data!.deaths.toString(),),
                                  },
                                  legendOptions: const LegendOptions(
                                      legendPosition: LegendPosition.left,
                                      legendShape: BoxShape.rectangle),
                                  chartType: ChartType.ring,
                                  colorList: colorList,
                                  animationDuration: const Duration(seconds: 1),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.06,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                                  child: Card(
                                    child: Column(
                                      children:  [
                                        ReuseableRow(title: "Today Recovered", value: snapshot.data!.todayRecovered.toString()),
                                        ReuseableRow(title: "Deaths", value: snapshot.data!.deaths.toString()),
                                        ReuseableRow(title: "Recovered", value: snapshot.data!.recovered.toString()),
                                        ReuseableRow(title: "Active", value: snapshot.data!.active.toString()),
                                        ReuseableRow(title: "Critical", value: snapshot.data!.critical.toString()),
                                        ReuseableRow(title: "Today Deaths", value: snapshot.data!.todayDeaths.toString()),
                                        ReuseableRow(title: "Total", value: snapshot.data!.cases.toString()),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30,),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CountriesList()));
                               },
                                  child: Container(
                                    height: 50,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff1aa260),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: const Center(child: Text("Track Countries")),
                                  ),
                                ),
                              ],
                            ),
                          );
                   }

               }),
            ],
          ),
        ),
      ),
    );
  }
}


class ReuseableRow extends StatelessWidget {

  final title, value;

  const ReuseableRow({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}

