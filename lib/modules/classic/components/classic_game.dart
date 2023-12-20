import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:teste_firebase_web/core/common/constants/app_colors.dart';

class ClassicGame extends StatefulWidget {
  const ClassicGame({super.key});

  @override
  State<ClassicGame> createState() => _ClassicGameState();
}

class _ClassicGameState extends State<ClassicGame> {
  Map<String, dynamic> listPersonagem = {'personagem': 'iselda', 'genero': 'feminino', 'regiao': 'dirtmouth'};

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                const Text('Personagem', style: TextStyle(color: AppColors.white)),
                Container(
                  width: 75,
                  height: 1,
                  color: AppColors.background,
                ),
              ],
            ),
            const Gap(5),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Genêro', style: TextStyle(color: AppColors.white)),
                Container(
                  width: 75,
                  height: 1,
                  color: AppColors.background,
                ),
              ],
            ),
            const Gap(5),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Região', style: TextStyle(color: AppColors.white)),
                Container(
                  width: 75,
                  height: 1,
                  color: AppColors.background,
                ),
              ],
            ),
          ],
        ),
        const Gap(10),
        SeparatedColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          separatorBuilder: () => const Gap(5),
          children: [
            SeparatedRow(
              separatorBuilder: () => const Gap(5),
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.secondary,
                  ),
                  width: 75,
                  height: 75,
                  child: const Center(
                      child: Text(
                    'Iselda',
                    style: TextStyle(color: AppColors.white),
                  )),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.secondary,
                  ),
                  width: 75,
                  height: 75,
                  child: const Center(child: Text('Dirtmounth', style: TextStyle(color: AppColors.white))),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.secondary,
                  ),
                  width: 75,
                  height: 75,
                  child: const Center(child: Text('Feminino', style: TextStyle(color: AppColors.white))),
                )
              ],
            )
          ],
        ),
        const Gap(20),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.secondary,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Indicadores de cor',
                  style: TextStyle(color: AppColors.white),
                ),
                const Gap(15),
                SeparatedRow(
                  separatorBuilder: () => const Gap(20),
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.green,
                        ),
                        const Text('Correta', style: TextStyle(color: AppColors.white)),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.orange,
                        ),
                        const Text('Parcial', style: TextStyle(color: AppColors.white)),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          color: Colors.red,
                        ),
                        const Text('Incorreta', style: TextStyle(color: AppColors.white)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
