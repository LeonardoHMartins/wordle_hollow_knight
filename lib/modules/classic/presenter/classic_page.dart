import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:teste_firebase_web/core/common/constants/app_colors.dart';
import 'package:teste_firebase_web/core/shared/features/characters/domain/entities/character_entity.dart';
import 'package:teste_firebase_web/modules/classic/components/classic_game.dart';
import 'package:teste_firebase_web/modules/classic/cubit/classic_cubit.dart';
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
  ClassicCubit cubit = ClassicCubit();

  @override
  void initState() {
    super.initState();
    cubit.init();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/hollow_knight.jpg',
              fit: BoxFit.cover,
              opacity: const AlwaysStoppedAnimation(0.3),
              colorBlendMode: BlendMode.dstOver,
              color: AppColors.grey800,
            ),
          ),
          BlocConsumer<ClassicCubit, ClassicState>(
            bloc: cubit,
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is ClassicLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return SingleChildScrollView(
                child: Padding(
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
                            onChange: (p0) {
                              cubit.searchCharacter(controller.text);
                              setState(() {});
                            },
                          ),
                        ),
                        DropdownButton2<CharacterEntity>(
                          value: cubit.selected,
                          items: cubit.charactersFiltered
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      e.name,
                                      style: const TextStyle(color: AppColors.white),
                                    ),
                                  ))
                              .toList(),
                          dropdownStyleData: const DropdownStyleData(decoration: BoxDecoration(color: AppColors.secondary)),
                          onChanged: (character) {
                            // print(character);
                            // Atualiza o campeão selecionado
                            setState(() {
                              cubit.selected = character;
                            });
                          },
                        ),
                        const Text('12313 pessoas já descobriram', style: TextStyle(fontSize: 12, color: AppColors.white)),
                        const Gap(10),
                        ClassicGame(characters: cubit.characters, characterToday: cubit.characterToday),
                        const Gap(20),
                        Button(
                            onPressed: () async {
                              setState(() {});
                              // cubit.isCharacterToday();
                              // print(resp);
                            },
                            child: const Text('alou'))
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
