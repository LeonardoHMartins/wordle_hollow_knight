// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:limper/core/common/errors/failures.dart';
// import 'package:limper/core/common/extensions/date_format_extension.dart';

// class NotificationCache {
//   NotificationCache._();
//   static final NotificationCache _instance = NotificationCache._();
//   factory NotificationCache() => NotificationCache._instance;

//   late SharedPreferences sp;
//   Future<void> setInstanceCache() async {
//     sp = await SharedPreferences.getInstance();
//     // await sp.remove('notifications_key');
//   }

//   /* ---------------------------------- KEYS ---------------------------------- */
//   String nofiticationKey = 'notifications_key';
//   String lastDateKey = 'last_date_key';

// /* -------------------------------- FUNCTIONS ------------------------------- */

// /* ---------------------------- GET NOTIFICATIONS --------------------------- */
//   List<NotificationModel> get() {
//     List<String>? strings = sp.getStringList(nofiticationKey);
//     List<NotificationModel> orderedList = [];
//     if (strings != null && strings.isNotEmpty) {
//       orderedList.addAll(
//         strings.map<NotificationModel>((e) => NotificationModel.fromMap(json.decode(e))).where((n) => n.isNew).toList(),
//       );
//       orderedList.addAll(
//         strings.map<NotificationModel>((e) => NotificationModel.fromMap(json.decode(e))).where((n) => !n.isNew).toList(),
//       );
//       return orderedList;
//     }
//     return <NotificationModel>[];
//   }

// /* -------------------------- INSERT NOTIFICATIONS -------------------------- */
//   Future<void> insert({required List<NotificationModel> notifications}) async {
//     List<NotificationModel> localNotifications = get();
//     List<String>? localStrings = sp.getStringList(nofiticationKey);
//     List<String> newList = [];

//     if (localStrings != null && localStrings.isNotEmpty) {
//       newList.addAll(localStrings);
//     }

//     try {
//       if (notifications.isNotEmpty) {
//         List<String> strings = [];

//         for (var e in notifications) {
//           if (localNotifications.where((element) => element.id == e.id).isEmpty) {
//             strings.add(e.toJson());
//           }
//         }
//         newList.addAll(strings);
//       }

//       bool success = await sp.setStringList(nofiticationKey, newList);
//       if (success) await sp.setString(lastDateKey, DateTime.now().dateConvert() ?? '');
//     } on Exception {
//       throw ServerFailure(title: 'Erro ao salvar novas notificações', description: 'Não foi possível salvar as novas notificações no cache');
//     }
//   }

// /* ------------------------------ GET LAST DATE ----------------------------- */
//   DateTime? getLastDate() {
//     String? stringDate = sp.getString(lastDateKey);
//     if (stringDate != null) return DateTime.tryParse(stringDate);
//     return null;
//   }

//   DateTime? getLastMonth() {
//     String? stringDate = sp.getString(lastDateKey);
//     DateTime? date;

//     if (stringDate != null) {
//       date = DateTime.tryParse(stringDate);
//     }
//     if (date != null) {
//       return DateTime(date.year, date.month, 1);
//     }
//     return null;
//   }

// /* ------------------------------ MARK AS READ ------------------------------ */
//   Future<void> markAsRead({required int idNotification}) async {
//     List<NotificationModel> notifications = get();

//     for (var n in notifications) {
//       if (n.id == idNotification) {
//         var updated = NotificationModel(
//           id: n.id,
//           title: n.title,
//           text: n.text,
//           createdAt: n.createdAt,
//           isNew: false,
//         );
//         notifications[notifications.indexOf(n)] = updated;
//         break;
//       }
//     }

//     List<String> updatedList = notifications.map((e) => e.toJson()).toList();
//     await sp.setStringList(nofiticationKey, updatedList);
//   }

//   /* ------------------------------ MARK AS READ ------------------------------ */
//   Future<void> markAllAsRead() async {
//     List<NotificationModel> notifications = get();

//     for (var n in notifications) {
//       var updated = NotificationModel(
//         id: n.id,
//         title: n.title,
//         text: n.text,
//         createdAt: n.createdAt,
//         isNew: false,
//       );
//       notifications[notifications.indexOf(n)] = updated;
//     }

//     List<String> updatedList = notifications.map((e) => e.toJson()).toList();
//     await sp.setStringList(nofiticationKey, updatedList);
//   }

// /* ------------------------ VERIFY NEWS NOTIFICATIONS ----------------------- */
//   bool verifyNews() {
//     List<NotificationModel> notifications = get();
//     return notifications.any((n) => n.isNew);
//   }
// }
