import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Chip;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gg_game/features/blackjack/betting/ui/layout/betting_layout.dart';
import 'package:gg_game/features/blackjack/game/logic/game_bloc/game_bloc.dart';
import 'package:gg_game/features/dialog/logic/dialog_bloc/bloc/dialog_bloc.dart';
import 'package:gg_game/features/dialog/logic/dialog_manager_game.dart';
import 'package:gg_game/features/blackjack/game/ui/layout/game_layout.dart';
import 'package:gg_game/theme/const.dart';
import 'package:gg_game/theme/widgets/custom_app_bar.dart';

@RoutePage()
class BlackjackScreen extends StatefulWidget {
  const BlackjackScreen({super.key});

  @override
  State<BlackjackScreen> createState() => _BlackjackScreenState();
}

class _BlackjackScreenState extends State<BlackjackScreen> {
  late StreamSubscription<GameState> _gameStateSubscription;

  @override
  void initState() {
    super.initState();
    _gameStateSubscription =
        BlocProvider.of<GameBloc>(context).stream.listen((state) {
      DialogManagerGame.showDialog(context, state);
    });
  }

  @override
  void dispose() {
    _gameStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<GameBloc>().add(StartBettingEvent());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: greyColor,
      appBar: CustomAppBar(
        width: size.width,
        leading: IconButton(
            onPressed: () =>
                context.read<DialogBloc>().add(PauseEvent(context: context)),
            icon: const Icon(Icons.menu_rounded)),
      ),
      body: SafeArea(
        child: Container(
          color: semiBlackColor,
          child: BlocBuilder<GameBloc, GameState>(
            builder: (context, state) {
              if (state is BettingState) {
                return const BettingLayout();
              } else {
                return const GameLayout();
              }
            },
          ),
        ),
      ),
    );
  }
}
