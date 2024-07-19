import 'package:flutter/material.dart';
import 'package:morflutter/display_info/databaseLink.dart';
import 'package:morflutter/display_info/sensorData.dart';
import 'package:morflutter/starting_pages/tests/tabSendData.dart';
import 'package:morflutter/starting_pages/ui/homepage.dart';
import 'package:morflutter/starting_pages/ui/intro_screens/onboard_screen.dart';

class Sendsensordata extends StatefulWidget {
  const Sendsensordata({super.key});

  @override
  State<Sendsensordata> createState() => _SendsensordataState();
}

class _SendsensordataState extends State<Sendsensordata> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              actions: [
                // visualize data:
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => databaseReadTest()));
                      },
                      icon: Icon(Icons.data_saver_off_rounded)),
                )
              ],
              title: Text(
                'Send sensor data',
                style: TextStyle(fontSize: 15),
              ),
              backgroundColor: Colors.purple[100],
              // go to homepage:
              leading: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OnBoardingScreen()));
                  },
                  icon: Icon(Icons.home_filled)),
              bottom: TabBar(tabs: [
                Tab(
                  icon: Icon(Icons.boy_rounded),
                  text: 'sensor 1',
                ),
                Tab(
                  icon: Icon(Icons.boy_rounded),
                  text: 'sensor 2',
                ),
                Tab(
                  icon: Icon(Icons.boy_rounded),
                  text: 'sensor 3',
                )
              ]),
            ),
            body: TabBarView(children: [
              tabSendSensorData(),
              tabSendSensorData(),
              tabSendSensorData(),
            ]),
          )),
    );
  }
}
