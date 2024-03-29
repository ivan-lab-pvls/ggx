import 'package:flutter/material.dart' hide Card;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gg_game/features/blackjack/game/logic/entity/card/card.dart';
import 'package:gg_game/features/blackjack/game/logic/entity/dealer/dealer_cubit.dart';
import 'package:gg_game/features/blackjack/game/logic/entity/player/player_cubit.dart';
import 'package:gg_game/theme/widgets/custom_container.dart';

class Score extends StatelessWidget {
  const Score({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<DealerCubit, List<Card>>(
          builder: (context, state) {
            return CustomContainer(
                child:
                    Text(context.read<DealerCubit>().sumOfCards().toString()));
          },
        ),
        const SizedBox(height: 44),
        BlocBuilder<PlayerCubit, List<Card>>(
          builder: (context, state) {
            return CustomContainer(
                child:
                    Text(context.read<PlayerCubit>().sumOfCards().toString()));
          },
        ),
      ],
    );
  }
}
