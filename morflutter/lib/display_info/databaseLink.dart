import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:morflutter/display_info/databaseClass.dart';

class databaseReadTest extends StatefulWidget {
  const databaseReadTest({super.key});

  @override
  State<databaseReadTest> createState() => _databaseReadTestState();
}

class _databaseReadTestState extends State<databaseReadTest> {
  // MORFO DATABASE REFERENCE:
  final database = FirebaseDatabase.instance.ref();

  // AUTH INSTANCE:
  User? newUser = FirebaseAuth.instance.currentUser;

  // Primary data:
  String databaseData = 'Data from database will be here';

  /**
   *  Initializes our app state so that it can read data in real time.
   */
  @override
  void initState() {
    super.initState();
    _activateListeners();
  }

  void LogOut() {
    FirebaseAuth.instance.signOut();
  }

  /**
   *  Listens to any updates to the desired child in the database.
   */
  void _activateListeners() {
    // taking current user UID to implement it in the path.
    String? userUID = newUser?.uid;
    String path = '/sensorSim/${userUID}/';
    print('Activating listeners at path: ${path}');

    /** 
     * Stream of events listener:
     *  where 'event' is our data.
    * */

    database.child(path).onValue.listen((event) {
      // saving our retrieved value in a variable:
      final String data = event.snapshot.value.toString();

      // create a SetState() call to change our value.
      setState(() {
        databaseData = 'Raw Database data:' + data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String? userUID = newUser?.uid;
    String path = '/sensorSim/${userUID}/';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title: Text('Fetch data from database'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /**
                 * USING A STREAM BUILDER AS AN EVENT LISTENER:
                 */
                /*
                StreamBuilder(
                    // Our Data Source to be listened.
                    stream: database.child(path).onValue,
                    // The function that makes up our widget tree based on the last data obtained.
                    builder: (context, snapshot) {
                      // check if there is data in our path.
                      if (snapshot.hasData &&
                          snapshot.data!.snapshot.value != null) {
                        // create a map from the data snapshot.
                        final data = Map<String, dynamic>.from(
                            snapshot.data!.snapshot.value as Map);

                        // create a list of widgets.
                        List<ListTile> sensorDataList = [];

                        data.forEach((date, muscleData) {
                          // for each piece of data, compose a listTile.
                          sensorDataList.add(ListTile(
                            title: Text(date),
                            subtitle: Column(
                              children: (muscleData as Map<dynamic, dynamic>)
                                  .entries
                                  .map((entry) {
                                return Text('${entry.key}: ${entry.value}');
                              }).toList(), // convert to a list
                            ),
                          ));
                        });

                        // display the listTile arrangement.
                        return ListView(
                          // add neverscrollable to allow singleChildScrollView to work:
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: sensorDataList,
                        );
                      } else {
                        // if we don't have data or is null:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),*/
                StreamBuilder(
                  stream: database.child(path).onValue,
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.data!.snapshot.value != null) {
                      final data = Map<String, dynamic>.from(
                          snapshot.data!.snapshot.value as Map);
                      List<MorfoData> sensorDataList = [];

                      data.forEach((date, muscleData) {
                        if (muscleData is Map<dynamic, dynamic>) {
                          sensorDataList.add(MorfoData.fromMap(
                              date, Map<String, dynamic>.from(muscleData)));
                        } else {
                          sensorDataList.add(MorfoData(
                              time: date, muscleData: {'data': muscleData}));
                        }
                      });

                      return ListView.builder(
                        // single child scrollview allowed:
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: sensorDataList.length,
                        itemBuilder: (context, index) {
                          final sensorData = sensorDataList[index];
                          return ListTile(
                            title: Text(sensorData.time),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  sensorData.muscleData.entries.map((entry) {
                                return Text('${entry.key}: ${entry.value}');
                              }).toList(),
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                ElevatedButton(onPressed: LogOut, child: Text('Change user'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
