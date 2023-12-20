import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:teste_firebase_web/core/common/services/connection/connection_service.dart';

class InternetConnectionCheckerImpl extends ConnectionService {
  @override
  Future<bool> get isConnected async => await InternetConnection().hasInternetAccess;
}
