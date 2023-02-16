import 'package:covid_tracker_api/Services/Utilities/states_services.dart';
import 'package:covid_tracker_api/View/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {

  TextEditingController searchController = TextEditingController();
  StatesServices statesServices = StatesServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged:(values){
                setState(() {

                });
              },
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search with country name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                )
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: statesServices.countriesListApi(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot){

              if(!snapshot.hasData){
                return ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, index){
                      return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade100,
                          child:  Column(
                            children: [
                              ListTile(
                                leading: Container(height: 50, width: 50, color: Colors.white,),
                                title: Container(height: 10, width: 89, color: Colors.white,),
                                subtitle: Container(height: 10, width: 89, color: Colors.white,),
                              ),
                            ],
                          ));

                    });
              }
              else
                {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                      itemBuilder: (context, index){

                      String name = snapshot.data![index]['country'];

                      if(searchController.text.isEmpty){
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailScreen(
                              name: snapshot.data![index]['country'],
                              image: snapshot.data![index]['countryInfo']['flag'],
                              totalCases: snapshot.data![index]['cases'],
                              totalDiscovered: snapshot.data![index]['recovered'],
                              totalDeaths: snapshot.data![index]['deaths'],
                              active: snapshot.data![index]['active'],
                              test: snapshot.data![index]['tests'],
                              todayRecovered: snapshot.data![index]['todayRecovered'],
                              critical: snapshot.data![index]['critical'],
                            )));
                          },
                          child: Column(
                            children: [
                              ListTile(
                                leading: Image(image: NetworkImage(snapshot.data![index]['countryInfo']['flag'].toString())),
                                title: Text(snapshot.data![index]['country']),
                                subtitle: Text(snapshot.data![index]['cases'].toString()),
                              ),
                            ],
                          ),
                        );
                      }else if(name.toLowerCase().contains(searchController.text.toLowerCase())){
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailScreen(
                              name: snapshot.data![index]['country'],
                              image: snapshot.data![index]['countryInfo']['flag'],
                              totalCases: snapshot.data![index]['cases'],
                              totalDiscovered: snapshot.data![index]['recovered'],
                              totalDeaths: snapshot.data![index]['deaths'],
                              active: snapshot.data![index]['active'],
                              test: snapshot.data![index]['tests'],
                              todayRecovered: snapshot.data![index]['todayRecovered'],
                              critical: snapshot.data![index]['critical'],
                            )));
                          },
                          child: Column(
                            children: [
                              ListTile(
                                leading: Image(image: NetworkImage(snapshot.data![index]['countryInfo']['flag'].toString())),
                                title: Text(snapshot.data![index]['country']),
                                subtitle: Text(snapshot.data![index]['cases'].toString()),
                              ),
                            ],
                          ),
                        );
                      }
                      else {
                        return Container();

                      }
                  });
                }
            }),
          )
        ],
      ),
    );
  }
}
