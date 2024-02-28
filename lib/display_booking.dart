import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DisplayBooking extends StatelessWidget {
  final String name;
  final String phone;
  final String pickupLocation;
  final String dropoffLocation;
  final DateTime dateTime;

  DisplayBooking({
    required this.name,
    required this.phone,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDateTime = DateFormat.yMMMd().add_jm().format(dateTime);

    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: $name',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Phone: $phone',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Pick-up Location: $pickupLocation',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Drop-off Location: $dropoffLocation',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Date and Time: $formattedDateTime',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
