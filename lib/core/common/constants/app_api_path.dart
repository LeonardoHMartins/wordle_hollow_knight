import 'package:teste_firebase_web/core/common/constants/app_constants.dart';

class ApiPath {
  static String get baseUrl => AppConstants.baseUrl;

/* ----------------------------- ROTAS PUBLICAS ----------------------------- */
  static String get sendCode => '$baseUrl/auth/enviar_codigo';
  static String get verifyCode => '$baseUrl/auth/verificar_codigo';
  static String get refreshToken => '$baseUrl/auth/refresh_token';

/* --------------------------- ROTAS AUTENTICADAS --------------------------- */
  static String get osCancel => '$baseUrl/os/cancelar';
  static String get osSend => '$baseUrl/os/enviar_acoes';
  static String get osSendImages => '$baseUrl/os/enviar_imagens';
  static String get osBuscar => '$baseUrl/os/buscar';
  static String get getUser => '$baseUrl/funcionario/buscar';
  static String get sendAvailability => '$baseUrl/disponibilidade/alterar';
  static String get getContent => '$baseUrl/conteudo/geral';
}
