import 'package:flutter/material.dart';

/// Calendar page - placeholder for MVP.
/// Following PRD.md section 7 - not in MVP scope.
class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalender'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.calendar_month_outlined,
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              'Fitur dalam pengembangan',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Kalender expiry akan tersedia di versi selanjutnya',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}