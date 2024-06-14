import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pet_plus_pro/components/mood_card.dart';
import 'package:pet_plus_pro/components/sensor_card.dart';
import 'package:pet_plus_pro/map_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              icon: FontAwesomeIcons.faceSmile,
              status: "Happy",
            ),
            SizedBox(
              height: 20,
            ),
            SensorCard(
              color: Colors.redAccent,
              icon: FontAwesomeIcons.shoePrints,
              title: 'Steps',
              data: '1000',
            ),
            SizedBox(
              height: 20,
            ),
            SensorCard(
              color: Colors.greenAccent,
              icon: FontAwesomeIcons.bowlFood,
              title: 'Burned Calories',
              data: '30cal',
            ),
            SizedBox(
              height: 20,
            ),
            SensorCard(
              color: Colors.deepOrangeAccent,
              icon: FontAwesomeIcons.heartPulse,
              title: 'Heart Rate',
              data: '80 per min',
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
