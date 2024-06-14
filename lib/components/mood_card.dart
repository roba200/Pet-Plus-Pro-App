import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoodCard extends StatefulWidget {
  final IconData icon;
  final String status;
  MoodCard({super.key, required this.icon, required this.status});

  @override
  State<MoodCard> createState() => _MoodCardState();
}

class _MoodCardState extends State<MoodCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            boxShadow: [
              BoxShadow(blurRadius: 5, spreadRadius: 1, color: Colors.grey)
            ],
            borderRadius: BorderRadius.circular(12)),
        height: 170,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              shadows: [Shadow(blurRadius: 5, color: Colors.white)],
              widget.icon,
              size: 70,
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              widget.status,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 50),
            )
          ],
        ),
      ),
    );
  }
}
