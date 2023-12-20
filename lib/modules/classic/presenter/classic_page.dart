import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:teste_firebase_web/core/common/constants/app_colors.dart';
import 'package:teste_firebase_web/main.dart';
import 'package:teste_firebase_web/modules/classic/components/classic_game.dart';
import 'package:teste_firebase_web/ui/components/button.dart';
import 'package:teste_firebase_web/ui/components/container_description.dart';
import 'package:teste_firebase_web/ui/components/input.dart';

class ClassicPage extends StatefulWidget {
  const ClassicPage({super.key});

  @override
  State<ClassicPage> createState() => _ClassicPageState();
}

class _ClassicPageState extends State<ClassicPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/wordle-hk.appspot.com/o/hollow_knight.jpg?alt=media&token=6fa27b5e-5eff-4d7b-afb6-bb7fc577bc83',
                fit: BoxFit.cover,
                opacity: const AlwaysStoppedAnimation(0.3),
                colorBlendMode: BlendMode.dstOver,
                color: AppColors.grey800,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Center(
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
                    const ContainerDescription(
                      width: 350,
                      title: 'Advinhe o personagem de Hollow Knight de hoje!',
                      subTitle: 'Digite qualquer personagem para começar.',
                    ),
                    const Gap(20),
                    SizedBox(
                        width: 350,
                        child: Input(
                          controller,
                          hint: 'Ex: Grimm..',
                        )),
                    const Text('12313 pessoas já descobriram', style: TextStyle(fontSize: 12, color: AppColors.white)),
                    const Gap(10),
                    const ClassicGame(),
                    const Gap(20),
                    Button(
                        onPressed: () async {
                          await session.getPersonagens();
                        },
                        child: const Text('alou'))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
