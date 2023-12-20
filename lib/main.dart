import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:teste_firebase_web/app_module.dart';
import 'package:teste_firebase_web/app_widget.dart';
import 'package:teste_firebase_web/core/common/constants/app_colors.dart';
import 'package:teste_firebase_web/core/common/services/current_session.dart';
import 'package:teste_firebase_web/firebase_options.dart';

CurrentSession session = CurrentSession();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  ErrorWidget.builder = (details) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: AppColors.grey200,
          body: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning_rounded,
                    color: AppColors.primary,
                    size: 80,
                  ),
                  Gap(20),
                  Text(
                    'Houve um erro inesperado\n\n Caso o erro persista, contate o suporte.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.primary,
                      fontFamily: 'Avenir',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      systemStatusBarContrastEnforced: false,
    ),
  );

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
