import 'package:flutter/cupertino.dart';

import 'models/text_input_element.dart';

class HomePageViewModel with ChangeNotifier {
  late final TextEditingController finalTextEditingController;

  static const carbonMass = 12;
  static const hydrogenMass = 1;
  int? finalMass;
  final _moleculeElements = [
    TextInputElementModel(name: 'Масса углерода', value: '12', isEnable: false),
    TextInputElementModel(name: 'Масса водорода', value: '1', isEnable: false),
  ];

  List<TextInputElementModel> get elements => _moleculeElements;

  HomePageViewModel() {
    finalTextEditingController = TextEditingController();
  }

  String _combinations = '';
  String get combinations => _combinations;

  void fetchPossibleCombinations() {
    if (finalMass == null) return;

    int elementsSum = 0;
    for (var element in _moleculeElements) {
      elementsSum += element.value == null || element.value!.isEmpty ? 0 : int.parse(element.value!);
    }
    if (finalMass! < elementsSum) return;

    String finalResult = '';

    List<int> masses = _moleculeElements.map((e) => int.parse(e.value ?? '0')).toList();

    for (var mass in masses) {
      finalResult += '(1; ${(finalMass! - (elementsSum - mass)) ~/ mass}) * $mass + ';
    }

    _combinations = '${finalResult.substring(0, finalResult.length - 2)}= $finalMass';
    notifyListeners();
  }

  void onFinalMassTextEditing(String value) {
    finalMass = int.tryParse(value);
    notifyListeners();
  }

  void addMoleculeElements() {
    _moleculeElements.add(TextInputElementModel(name: '${_moleculeElements.length + 1} элемент'));
    notifyListeners();
  }

  void deleteMoleculeElements(TextInputElementModel item) {
    _moleculeElements.remove(item);
    notifyListeners();
  }

  @override
  void dispose() {
    finalTextEditingController.dispose();
    super.dispose();
  }
}
