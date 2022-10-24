import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_page_model.dart';

class PossibleCombinationsList extends StatelessWidget {
  const PossibleCombinationsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final combinations = context.watch<HomePageViewModel>().combinations;
    return combinations.isEmpty
        ? const Text('Ничего не найдено')
        : Text(combinations);
  }
}
