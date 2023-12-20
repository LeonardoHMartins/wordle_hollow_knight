// import 'package:dio/dio.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:limper/core/common/errors/exceptions.dart';
// import 'package:limper/main.dart';

// class CrashlyticsServices {
//   static String crashlyticsHandlerError(Object err) {
//     if (err is DioException) {
//       if (err.response?.data['message'] != null) {
//         return err.response?.data['message'];
//       }
//       return err.response.toString();
//     }
//     if (err is ServerException) {
//       return err.message ?? '';
//     }

//     return '';
//   }

//   static Future<void> crashlyticsCreateError(Object error) async {
//     if (error is DioException) {
//       var err = {
//         'type': 'DioException',
//         'url': error.requestOptions.path,
//         'message': error.response?.data['message'] ?? error.response?.data,
//         'date': DateTime.now().toIso8601String(),
//         'user': session.user?.toJson(),
//       };

//       await FirebaseCrashlytics.instance.recordError(
//         CrashlyticsServices.crashlyticsHandlerError(error),
//         error.stackTrace,
//         fatal: true,
//         information: [err],
//         printDetails: true,
//         reason: error.response?.data['message'],
//       );

//       throw ServerException(
//         message: error.response?.data['message'],
//         stackTrace: error.stackTrace,
//       );
//     }
//     if (error is ServerException) {
//       var err = {
//         'type': 'ServerException',
//         'StackTrace': error.stackTrace,
//         'date': DateTime.now().toIso8601String(),
//         'user': session.user?.toJson(),
//       };

//       FirebaseCrashlytics.instance.recordError(
//         CrashlyticsServices.crashlyticsHandlerError(error),
//         error.stackTrace,
//         fatal: true,
//         information: [err],
//         printDetails: true,
//         reason: error.message,
//       );
//     }
//   }
// }
