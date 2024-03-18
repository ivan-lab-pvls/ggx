import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Dialog;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gg_game/features/blackjack/game/logic/game_bloc/game_bloc.dart';
import 'package:gg_game/features/dialog/logic/dialog_bloc/bloc/dialog_bloc.dart';
import 'package:gg_game/features/dialog/ui/dialog.dart';
import 'package:gg_game/router/router.dart';
import 'package:gg_game/theme/const.dart';
import 'package:gg_game/theme/widgets/custom_button.dart';

class DialogPause extends Dialog {
  void showDialog(BuildContext context) {
    Widget widget = Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: [
          Text(
            'Pause',
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
          CustomButton(
              color: primaryRedColor,
              title: 'Back to game',
              icon: const Icon(Icons.play_arrow_rounded),
              onPressed: () {
                context.read<DialogBloc>().add(CloseEvent());
                context.router.popForced();
              }),
          const SizedBox(height: 8),
          CustomButton(
              color: secondaryButtonColor,
              title: 'Menu',
              onPressed: () async {
                context.router.popForced();
                context.router.replace(const HomeRoute());
                context.read<GameBloc>().add(ResetGameEvent());
                context.read<GameBloc>().add(ExitGameEvent());
              }),
        ],
      ),
    );
    buildDialog(context, widget, false, Colors.black87);
  }
}
