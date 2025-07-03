import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tandorost/main.dart';
import 'package:tandorost_components/tandorost_components.dart';
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  debugPrint('notificationTapBackground: ${notificationResponse.payload}');
  if (notificationResponse.input != null) {
    debugPrint(
      'notificationTapBackground: input ${notificationResponse.input}',
    );
    didReceiveNotificationResponseStreamController.add(notificationResponse.input);
    // You would typically process this background input here,
    // e.g., send it to a server or store it.
    flutterLocalNotificationsPlugin.cancel(
      notificationResponse.id ?? 0,
    ); // Cancel the notification
  }
}

// Future<void> initalizeNotification() async {
//   await flutterLocalNotificationsPlugin.initialize(
//     initializationSettings,
//     onDidReceiveNotificationResponse: (
//       NotificationResponse notificationResponse,
//     ) async {
//       debugPrint(
//         'onDidReceiveNotificationResponse: ${notificationResponse.payload}',
//       );
//       if (notificationResponse.input != null) {
//         debugPrint(
//           'onDidReceiveNotificationResponse: input ${notificationResponse.input}',
//         );
//         // Here, you would update your UI with the input
//         // Since we're using a StatefulWidget, we can use a callback or a global stream.
//         // For simplicity in this example, we'll use a global variable updated by a setState in MyHomePage
//         // or you could use a more robust state management solution.
//         didReceiveNotificationResponseStreamController.add(
//           notificationResponse.input,
//         );
//         flutterLocalNotificationsPlugin.cancel(notificationResponse.id ?? 0);
//         debugPrint(
//           'Foreground: Notification with ID ${notificationResponse.id} cancelled after reply.',
//         );
//       }
//     },
//     onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
//   );
// }
// A StreamController to pass input from foreground notification taps to the UI
final StreamController<String?> didReceiveNotificationResponseStreamController =
    StreamController<String?>.broadcast();
// class NotificationPermissionHandler extends StatelessWidget {
//   const NotificationPermissionHandler({super.key, required this.child});
//   final Widget child;

//   Future<bool> _checkAndRequestPermission() async {
//     final androidPlugin =
//         flutterLocalNotificationsPlugin
//             .resolvePlatformSpecificImplementation<
//               AndroidFlutterLocalNotificationsPlugin
//             >();
//     if (androidPlugin == null) return true;
//     final enabled = await androidPlugin.areNotificationsEnabled();
//     if (enabled == true) return true;
//     final requested = await androidPlugin.requestNotificationsPermission();
//     return requested ?? false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<bool>(
//       future: _checkAndRequestPermission(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done &&
//             snapshot.data == true) {
//           return FutureBuilder(
//             future: scheduleDailyFoodLogReminders(context),
//             builder: (context2, snapshot2) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 return child;
//               } else {
//                 return const SizedBox();
//               }
//             },
//           );
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const SizedBox();
//         }
//         // If permission denied or error, still show the app
//         return child;
//       },
//     );
//   }
// }

// tz.TZDateTime nextInstanceOfTime(int hour, int minute) {
//   final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//   tz.TZDateTime scheduledDate = tz.TZDateTime(
//     tz.local,
//     now.year,
//     now.month,
//     now.day,
//     hour,
//     minute,
//   );
//   if (scheduledDate.isBefore(now)) {
//     scheduledDate = scheduledDate.add(const Duration(days: 1));
//   }
//   return scheduledDate;
// }

// Future<void> scheduleDailyFoodLogReminders(BuildContext context) async {
//   final List<Map<String, dynamic>> reminders = [
//     {'id': 1, 'hour': 12, 'minute': 0},
//     {'id': 2, 'hour': 17, 'minute': 0},
//     {'id': 3, 'hour': 23, 'minute': 0},
//   ];

//   for (final reminder in reminders) {
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       reminder['id'],
//       context.l10n.scheduleMessageTitle,
//       context.l10n.scheduleMessageText,
//       nextInstanceOfTime(reminder['hour'], reminder['minute']),
//       NotificationDetails(
//         android: AndroidNotificationDetails(
//           'food_log_channel',
//           context.l10n.scheduleMessageTitle,
//           channelDescription: context.l10n.scheduleMessageText,
//           importance: Importance.max,
//           priority: Priority.high,
//         ),
//       ),
//       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//       matchDateTimeComponents: DateTimeComponents.time,
//     );
//   }
// }
