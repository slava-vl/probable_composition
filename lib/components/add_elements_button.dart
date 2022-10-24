import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_page_model.dart';

class AddElementButton extends StatelessWidget {
  const AddElementButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: context.read<HomePageViewModel>().addMoleculeElements,
      icon: const Icon(Icons.add),
      splashRadius: 20,
    );
  }
}
