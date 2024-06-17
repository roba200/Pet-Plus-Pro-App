import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pet_plus_pro/components/mood_card.dart';
import 'package:pet_plus_pro/components/sensor_card.dart';
import 'package:pet_plus_pro/map_page.dart';

class HomePage extends StatefulWidget {
  final String category;
  final double weight;
  const HomePage({super.key, required this.category, required this.weight});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String heartRate = "0";
  String steps = "0";

  @override
  void initState() {
    FirebaseDatabase.instance
        .ref()
        .child("Device/heart_rate")
        .onValue
        .listen((event) {
      setState(() {
        heartRate = event.snapshot.value.toString();
        print(heartRate);
      });
    });

    FirebaseDatabase.instance
        .ref()
        .child("Device/steps")
        .onValue
        .listen((event) {
      setState(() {
        steps = event.snapshot.value.toString();
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
            child: Icon(FontAwesomeIcons.map),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MapPage()));
            }),
        body: ListView(
          children: [
            SizedBox(
              height: 80,
            ),
            MoodCard(
              icon: (int.parse(steps) < 7500 && int.parse(steps) > 5500) &&
                      (int.parse(heartRate) < 140 && int.parse(heartRate) > 60)
                  ? FontAwesomeIcons.faceLaugh
                  : (int.parse(steps) < 5500) &&
                          (int.parse(heartRate) < 140 &&
                              int.parse(heartRate) > 60)
                      ? FontAwesomeIcons.faceMeh
                      : (int.parse(steps) < 5500) ||
                              (int.parse(heartRate) > 140 ||
                                  int.parse(heartRate) < 60)
                          ? FontAwesomeIcons.faceFrown
                          : FontAwesomeIcons.xmark,
              status: (int.parse(steps) < 7500 && int.parse(steps) > 5500) &&
                      (int.parse(heartRate) < 140 && int.parse(heartRate) > 60)
                  ? "Happy"
                  : (int.parse(steps) < 5500) &&
                          (int.parse(heartRate) < 140 &&
                              int.parse(heartRate) > 60)
                      ? "Lazy"
                      : (int.parse(steps) < 5500) ||
                              (int.parse(heartRate) > 140 ||
                                  int.parse(heartRate) < 60)
                          ? "Sick"
                          : "Not Recognized",
            ),
            SizedBox(
              height: 20,
            ),
            SensorCard(
              color: Color.fromARGB(255, 0, 190, 250),
              icon: FontAwesomeIcons.shoePrints,
              title: 'Steps',
              data: steps,
            ),
            SizedBox(
              height: 20,
            ),
            SensorCard(
              color: Color.fromARGB(255, 250, 0, 90),
              icon: FontAwesomeIcons.bowlFood,
              title: 'Burned Calories',
              data: widget.category == 'small'
                  ? ((8 * widget.weight * int.parse(steps)) / 6336)
                      .toStringAsFixed(2)
                  : widget.category == 'medium'
                      ? ((8 * widget.weight * int.parse(steps)) / 3168)
                          .toStringAsFixed(2)
                      : ((8 * widget.weight * int.parse(steps)) / 2112)
                          .toStringAsFixed(2),
            ),
            SizedBox(
              height: 20,
            ),
            SensorCard(
              color: Colors.deepOrangeAccent,
              icon: FontAwesomeIcons.heartPulse,
              title: 'Heart Rate',
              data: '$heartRate BPM',
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
