import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_page_model.dart';
import '../models/text_input_element.dart';

class ElementsListItem extends StatelessWidget {
  const ElementsListItem(this.item, {Key? key}) : super(key: key);

  final TextInputElementModel item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: TextEditingController(text: item.value),
            onChanged: item.changeValue,
            decoration: InputDecoration(
              labelText: item.name,
              enabled: item.isEnable,
            ),
          ),
        ),
        if (item.isEnable)
          IconButton(
            onPressed: () => context.read<HomePageViewModel>().deleteMoleculeElements(item),
            icon: const Icon(Icons.delete),
          )
      ],
    );
  }
}
