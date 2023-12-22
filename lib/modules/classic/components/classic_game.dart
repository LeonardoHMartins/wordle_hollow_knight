import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:teste_firebase_web/core/common/constants/app_colors.dart';
import 'package:teste_firebase_web/core/shared/features/characters/domain/entities/character_entity.dart';

class ClassicGame extends StatefulWidget {
  const ClassicGame({super.key, required this.characters, this.characterToday});
  final List<CharacterEntity> characters;
  final CharacterEntity? characterToday;

  @override
  State<ClassicGame> createState() => _ClassicGameState();
}

class _ClassicGameState extends State<ClassicGame> {
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
            ...widget.characters.map((e) => SeparatedRow(
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
                      child: Center(
                          child: Text(
                        e.name,
                        style: const TextStyle(color: AppColors.white),
                      )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.secondary,
                      ),
                      width: 75,
                      height: 75,
                      child: Center(child: Text(e.location, style: const TextStyle(color: AppColors.white))),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.secondary,
                      ),
                      width: 75,
                      height: 75,
                      child: Center(child: Text(e.gender, style: const TextStyle(color: AppColors.white))),
                    )
                  ],
                )),
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
