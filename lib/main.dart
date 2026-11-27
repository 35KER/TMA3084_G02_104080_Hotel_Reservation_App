import 'package:flutter/material.dart';

import 'booking_form_page.dart';

void main() => runApp(const HotelReservationApp());

class HotelReservationApp extends StatelessWidget {
  const HotelReservationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Reservation',
      theme: ThemeData(colorSchemeSeed: Colors.deepPurple, useMaterial3: true),
      home: const BookingFormPage(),
    );
  }
}
