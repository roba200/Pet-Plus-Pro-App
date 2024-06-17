import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SensorCard extends StatefulWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String data;
  const SensorCard(
      {super.key,
      required this.color,
      required this.icon,
      required this.title,
      required this.data});

  @override
  State<SensorCard> createState() => _SensorCardState();
}

class _SensorCardState extends State<SensorCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 100,
        width: size.width,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(blurRadius: 5, spreadRadius: 1, color: Colors.grey)
        ], color: widget.color, borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FaIcon(
                shadows: [Shadow(blurRadius: 5, color: Colors.white)],
                widget.icon,
                size: 70,
                color: Colors.white,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25),
                ),
                Text(
                  widget.data,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 40),
                )
              ],
            ),
            SizedBox(
              width: 30,
            )
          ],
        ),
      ),
    );
  }
}
