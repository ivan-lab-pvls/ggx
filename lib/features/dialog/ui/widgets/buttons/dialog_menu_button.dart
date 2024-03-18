import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gg_game/features/blackjack/game/logic/game_bloc/game_bloc.dart';
import 'package:gg_game/router/router.dart';
import 'package:gg_game/theme/const.dart';
import 'package:gg_game/theme/widgets/custom_button.dart';

class DialogMenuButton extends StatelessWidget {
  const DialogMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: secondaryButtonColor,
      title: 'Menu',
      onPressed: () async {
        context.router.popForced();
        context.router.replace(const HomeRoute());
        context.read<GameBloc>().add(ResetGameEvent());
        context.read<GameBloc>().add(ExitGameEvent());
      },
    );
  }
}
