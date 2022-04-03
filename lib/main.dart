import 'package:app_weather_2/model/weather.dart';
import 'package:app_weather_2/service/weather_api_client.dart';
import 'package:app_weather_2/views/item_weather.dart';
import 'package:app_weather_2/views/weather_view.dart';
import 'package:flutter/material.dart';
import 'package:app_weather_2/contains.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime now = DateTime.now();
  var dayNow = DateFormat('EEEE').format(DateTime.now());
  WeatherApiClient client = WeatherApiClient();
  Weather? data;
  String resultDialog = 'Rome';
  Future<void> getData() async {
    data = await client.getCurrentWeather(resultDialog);
  }
  String? imgBackground = 'images/sun.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: data?.status == 'Sun' ? const AssetImage('images/clouds.png', ) : const AssetImage('images/sun.png'),
                  fit: BoxFit.cover,
                )
              ),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        showDialog(
                            context: context,
                            builder: (BuildContext context){
                              return SimpleDialog(
                                children: [
                                  SimpleDialogOption(
                                    child: const Text('Ha Noi'),
                                    onPressed: (){
                                      Navigator.pop(context, 'Hanoi');
                                    },
                                  ),
                                  SimpleDialogOption(
                                    child: const Text('Tokyo'),
                                    onPressed: (){
                                      Navigator.pop(context, 'Tokyo');
                                    },
                                  ),
                                  SimpleDialogOption(
                                    child: const Text('London'),
                                    onPressed: (){
                                      Navigator.pop(context, 'London');
                                    },
                                  ),
                                  SimpleDialogOption(
                                    child: const Text('Rome'),
                                    onPressed: (){
                                      Navigator.pop(context, 'Rome');
                                    },
                                  )
                                ],
                              );
                            }
                        ).then((value){
                          setState(() {
                            resultDialog =value;
                          });
                        });
                      },
                      child: const Icon(
                        Icons.add_location,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text(
                        '${data?.city}',
                        style: locationStyle,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    DateFormat('yyyy-MM-dd / kk:mm').format(now),
                    style: dateStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                  child: weatherInformation('${data?.temp}', dayNow, '${data?.tempMax}', '${data?.tempMin}',
                      'https://openweathermap.org/img/wn/${data?.image}@2x.png'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.blue,
                  ),
                  label: Text(
                    'Refresh',
                    style: reFreshStyle,
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: const Size(180, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 80, 10, 0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        itemWeather(
                            DateFormat('yyyy-MM-dd').format(now),
                            'http://openweathermap.org/img/wn/10d@2x.png',
                            31,
                            12),
                        itemWeather(
                            DateFormat('yyyy-MM-dd').format(now),
                            'http://openweathermap.org/img/wn/10d@2x.png',
                            31,
                            12),
                        itemWeather(
                            DateFormat('yyyy-MM-dd').format(now),
                            'http://openweathermap.org/img/wn/10d@2x.png',
                            31,
                            12),
                        itemWeather(
                            DateFormat('yyyy-MM-dd').format(now),
                            'http://openweathermap.org/img/wn/10d@2x.png',
                            31,
                            12),
                        itemWeather(
                            DateFormat('yyyy-MM-dd').format(now),
                            'http://openweathermap.org/img/wn/10d@2x.png',
                            31,
                            12),
                      ],
                    ),
                  ),
                )
              ],
            ),
            );
          }else if(snapshot.connectionState == ConnectionState.none){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }
}

