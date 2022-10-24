import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_page_model.dart';

class FinalMassTextField extends StatelessWidget {
  const FinalMassTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: context.read<HomePageViewModel>().finalTextEditingController,
      decoration: const InputDecoration(labelText: 'Итоговая масса'),
      onChanged: context.read<HomePageViewModel>().onFinalMassTextEditing,
    );
  }
}
