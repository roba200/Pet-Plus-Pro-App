import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Workmanager().executeTask((task, inputData) {
                print("Manually triggering background task");
                return Future.value(true);
              });
            },
            child: Text("Execute Task")),
      ),
    );
  }
}
