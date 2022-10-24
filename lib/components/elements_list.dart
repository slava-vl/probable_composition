import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_page_model.dart';
import 'elements_list_item.dart';

class ElementsList extends StatelessWidget {
  const ElementsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final elements = context.watch<HomePageViewModel>().elements;
    return Column(
      children: elements.map((e) => ElementsListItem(e)).toList(),
    );
  }
}
