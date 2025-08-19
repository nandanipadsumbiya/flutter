import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetReminderPage extends StatelessWidget {
  const SetReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Reminder'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.schedule,
                      size: 80,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Set Medicine Reminder',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Never miss your medication again! Set personalized reminders for each medicine.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    FilledButton.icon(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Go Back'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildReminderTypes(context),
          ],
        ),
      ),
    );
  }

  Widget _buildReminderTypes(BuildContext context) {
    final reminderTypes = [
      {'icon': Icons.alarm, 'title': 'Daily Reminders', 'subtitle': 'Set specific times each day'},
      {'icon': Icons.repeat, 'title': 'Interval Reminders', 'subtitle': 'Every 4, 6, 8, or 12 hours'},
      {'icon': Icons.event, 'title': 'Custom Schedule', 'subtitle': 'Specific days and times'},
      {'icon': Icons.notifications_active, 'title': 'Smart Notifications', 'subtitle': 'Adaptive reminders'},
    ];

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reminder Options:',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...reminderTypes.map((type) => ListTile(
              leading: Icon(
                type['icon'] as IconData,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(type['title'] as String),
              subtitle: Text(type['subtitle'] as String),
              contentPadding: EdgeInsets.zero,
            )),
          ],
        ),
      ),
    );
  }
}
