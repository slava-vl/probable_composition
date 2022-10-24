import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/add_elements_button.dart';
import 'components/elements_list.dart';
import 'components/final_mass_text_field.dart';
import 'components/possible_combinations_list.dart';
import 'components/start_button.dart';
import 'home_page_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Widget create() {
    return ChangeNotifierProvider(
      create: (context) => HomePageViewModel(),
      child: const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
        children: const [
          ElementsList(),
          AddElementButton(),
          FinalMassTextField(),
          StartButton(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text('Возможный состав:', style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
          ),
          PossibleCombinationsList()
        ],
      ),
    );
  }
}
