import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref('Device/history');
  List<Map<dynamic, dynamic>> _historyItems = [];

  @override
  void initState() {
    super.initState();
    _listenForData();
  }

  void _listenForData() {
    _databaseReference.onValue.listen((DatabaseEvent event) {
      Map<dynamic, dynamic>? data = event.snapshot.value as Map?;
      if (data != null) {
        setState(() {
          _historyItems = data.entries
              .map((entry) => {'key': entry.key, 'value': entry.value})
              .toList();
        });
      }
    });
  }

  String transformKey(String key) {
    List<String> parts = key.split('-');
    if (parts.length >= 3) {
      int year = int.parse(parts[0]) + 1900;
      int month = int.parse(parts[1]) + 1;
      String day = parts[2];
      return '$year-$month-$day';
    }
    return key;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Step Count History"),
      ),
      body: _historyItems.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _historyItems.length,
              itemBuilder: (context, index) {
                final item = _historyItems[index];
                String transformedKey = transformKey(item['key'].toString());
                return ListTile(
                  title: Text("Date : " + transformedKey),
                  subtitle:
                      Text("Total Step Count : " + item['value'].toString()),
                );
              },
            ),
    );
  }
}
