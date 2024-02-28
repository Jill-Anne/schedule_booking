import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'display_booking.dart';

class BookingScreen extends StatefulWidget {
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime _selectedDateTime = DateTime.now();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pickupController = TextEditingController();
  final TextEditingController _dropoffController = TextEditingController();
  final TextEditingController _dateTimeController = TextEditingController();

  Future<void> _presentDateTimePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (pickedDate == null) return;

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
    );
    if (pickedTime == null) return;

    setState(() {
      _selectedDateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
      _dateTimeController.text = _getFormattedDateTime();
    });
  }

  String _getFormattedDateTime() {
    final date = DateFormat.yMMMd().format(_selectedDateTime);
    final time = DateFormat.jm().format(_selectedDateTime);
    return "$date at $time";
  }

  void _addReservation() {
    FirebaseFirestore.instance.collection('reservations').add({
      'name': _nameController.text,
      'phone': _phoneController.text,
      'pickupLocation': _pickupController.text,
      'dropoffLocation': _dropoffController.text,
      'dateTime': _selectedDateTime,
    });

    // Navigate to DisplayBooking screen with reservation details
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayBooking(
          name: _nameController.text,
          phone: _phoneController.text,
          pickupLocation: _pickupController.text,
          dropoffLocation: _dropoffController.text,
          dateTime: _selectedDateTime,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule a Ride'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Your Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _pickupController,
                decoration: InputDecoration(
                  labelText: 'Pick-up Location',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _dropoffController,
                decoration: InputDecoration(
                  labelText: 'Drop-off Location',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _dateTimeController,
                decoration: InputDecoration(
                  labelText: 'Schedule Date and Time',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: _presentDateTimePicker,
                  ),
                ),
                readOnly: true,
                onTap: _presentDateTimePicker,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Schedule Ride'),
                onPressed: _addReservation,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _pickupController.dispose();
    _dropoffController.dispose();
    _dateTimeController.dispose();
    super.dispose();
  }
}
