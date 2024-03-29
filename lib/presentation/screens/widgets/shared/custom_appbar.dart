import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SafeArea(
      child: Container(
        color: Colors.amber.withAlpha(1),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: SizedBox(
            width: double.infinity,
            height: 60,
            child: Row(children: [
              Icon(Icons.movie, color: colors.primary),
              const SizedBox(width: 15),
              Text('Cinemapedia', style: titleStyle),
              const Spacer(),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            ]),
          ),
        ),
      ),
    );
  }
}
