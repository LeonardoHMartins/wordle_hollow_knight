import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:teste_firebase_web/core/common/constants/app_colors.dart';
import 'package:teste_firebase_web/core/common/constants/app_routes.dart';
import 'package:teste_firebase_web/modules/home/components/container_games.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network('https://firebasestorage.googleapis.com/v0/b/wordle-hk.appspot.com/o/hollow_knight.jpg?alt=media&token=6fa27b5e-5eff-4d7b-afb6-bb7fc577bc83',
                fit: BoxFit.cover,
                opacity: const AlwaysStoppedAnimation(0.3),
                colorBlendMode: BlendMode.dstOver,
                color: AppColors.grey800,
                headers: const {
                  "Access-Control-Allow-Origin": "*",
                  "Access-Control-Allow-Credentials": "true",
                  "Access-Control-Allow-Methods": "GET,HEAD,OPTIONS,POST,PUT",
                  "Access-Control-Allow-Headers": "Origin, X-Requested-With, Content-Type, Accept, Authorization"
                }),
          ),
          Center(
            child: SeparatedColumn(
              separatorBuilder: () => const Gap(10),
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: AppColors.secondary,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('HKdle', style: TextStyle(fontSize: 100, color: AppColors.white)),
                    )),
                const Gap(10),
                const Text('Advinhe os personagens de Hollow Knight', style: TextStyle(fontSize: 22, color: AppColors.white)),
                const Gap(20),
                ContainerGames(
                  onTap: () => Modular.to.pushReplacementNamed(AppRoutes.classic),
                  title: 'Clássico',
                  subTitle: 'consiga pistas a cada tentativa',
                ),
                const ContainerGames(
                  title: 'Falas',
                  subTitle: 'advinhe com as falas do personagem',
                ),
                const ContainerGames(
                  title: 'Habilidade',
                  subTitle: 'uma habilidade, um personagem',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
