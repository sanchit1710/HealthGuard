import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class BloodPressureEntry {
  final String bloodPressure;
  final DateTime dateTime;

  BloodPressureEntry({
    required this.bloodPressure,
    required this.dateTime,
  });
  factory BloodPressureEntry.fromJson(Map<String, dynamic> json) {
    return BloodPressureEntry(
      bloodPressure: json['bloodPressure'],
      dateTime: DateTime.parse(json['dateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bloodPressure': bloodPressure,
      'dateTime': dateTime.toIso8601String(),
    };
  }
}

class BloodPressurePage extends StatefulWidget {
  const BloodPressurePage({Key? key}) : super(key: key);

  @override
  _BloodPressurePageState createState() => _BloodPressurePageState();
}

class _BloodPressurePageState extends State<BloodPressurePage> {
  List<BloodPressureEntry> bloodPressureData = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Pressure'),
      ),
      body: ListView.builder(
        itemCount: bloodPressureData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Blood Pressure: ${bloodPressureData[index].bloodPressure}'),
            subtitle: Text('Date & Time: ${bloodPressureData[index].dateTime.toString()}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the blood pressure input page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BloodPressureInputPage(),
            ),
          ).then((value) {
            // If the blood pressure is added, update the list and save data
            if (value != null) {
              setState(() {
                bloodPressureData.add(value);
                _saveData();
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = prefs.getStringList('bloodPressureData');
    if (jsonData != null) {
      setState(() {
        bloodPressureData = jsonData.map((e) => BloodPressureEntry.fromJson(jsonDecode(e))).toList();
      });
    }
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = bloodPressureData.map((e) => jsonEncode(e.toJson())).toList();
    prefs.setStringList('bloodPressureData', jsonData);
  }
}

class BloodPressureInputPage extends StatefulWidget {
  const BloodPressureInputPage({Key? key}) : super(key: key);

  @override
  _BloodPressureInputPageState createState() => _BloodPressureInputPageState();
}

class _BloodPressureInputPageState extends State<BloodPressureInputPage> {
  final TextEditingController _bloodPressureController = TextEditingController();
  late DateTime _selectedDateTime;

  @override
  void initState() {
    super.initState();
    _selectedDateTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Blood Pressure'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _bloodPressureController,
              decoration: InputDecoration(labelText: 'Enter Blood Pressure'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () async {
                final DateTime? pickedDateTime = await showDatePicker(
                  context: context,
                  initialDate: _selectedDateTime,
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                );
                if (pickedDateTime != null) {
                  final TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null) {
                    setState(() {
                      _selectedDateTime = DateTime(
                        pickedDateTime.year,
                        pickedDateTime.month,
                        pickedDateTime.day,
                        pickedTime.hour,
                        pickedTime.minute,
                      );
                    });
                  }
                }
              },
              child: Text('Select Date & Time: ${_formatDateTime(_selectedDateTime)}'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Return the entered blood pressure value to the previous page
                final bloodPressureEntry = BloodPressureEntry(
                  bloodPressure: _bloodPressureController.text,
                  dateTime: _selectedDateTime,
                );
                Navigator.pop(context, bloodPressureEntry);
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.year}-${dateTime.month}-${dateTime.day} ${dateTime.hour}:${dateTime.minute}';
  }
}


