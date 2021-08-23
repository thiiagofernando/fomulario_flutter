import 'package:flutter/material.dart';

class MeuInputDate extends StatefulWidget {
  @override
  _MeuInputDateState createState() => _MeuInputDateState();
}

class _MeuInputDateState extends State<MeuInputDate> {
  String date = "";
  late DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: _selectedDate(context),
            child: Text("Calendário"),
          ),
          Text(
            "Compra realizada em: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
          ),
        ],
      ),
    );
  }

  dynamic _selectedDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }
}
