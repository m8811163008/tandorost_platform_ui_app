import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tandorost/main.dart';
import 'package:tandorost_components/tandorost_components.dart';
import 'package:timezone/timezone.dart' as tz;

tz.TZDateTime nextInstanceOfTime(int hour, int minute) {
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  tz.TZDateTime scheduledDate = tz.TZDateTime(
    tz.local,
    now.year,
    now.month,
    now.day,
    hour,
    minute,
  );
  if (scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(const Duration(days: 1));
  }
  return scheduledDate;
}

Future<void> scheduleDailyFoodLogReminders(BuildContext context) async {
  final List<Map<String, dynamic>> reminders = [
    {'id': 1, 'hour': 12, 'minute': 0},
    {'id': 2, 'hour': 17, 'minute': 0},
    {'id': 3, 'hour': 23, 'minute': 0},
  ];

  for (final reminder in reminders) {
    await flutterLocalNotificationsPlugin.zonedSchedule(
      reminder['id'],
      context.l10n.scheduleMessageTitle,
      context.l10n.scheduleMessageText,
      nextInstanceOfTime(reminder['hour'], reminder['minute']),
      NotificationDetails(
        android: AndroidNotificationDetails(
          'food_log_channel',
          context.l10n.scheduleMessageTitle,
          channelDescription: context.l10n.scheduleMessageText,
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }
}
