import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_page_model.dart';

class StartButton extends StatelessWidget {
  const StartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: context.read<HomePageViewModel>().fetchPossibleCombinations,
      child: const Text('Провести расчёт'),
    );
  }
}
