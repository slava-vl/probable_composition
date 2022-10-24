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

  final List<String> _combinations = [];
  List<String> get combinations => _combinations;

  HomePageViewModel() {
    finalTextEditingController = TextEditingController();
  }

  void fetchPossibleCombinations() {
    _combinations.clear();
    if (finalMass == null) return;

    int elementsSum = 0;
    for (var element in _moleculeElements) {
      elementsSum += element.value == null || element.value!.isEmpty ? 0 : int.parse(element.value!);
    }
    if (finalMass! < elementsSum) return;

    String finalResult = '';

    List<int> masses = _moleculeElements.map((e) => int.parse(e.value ?? '0')).toList();
    masses.sort();

    Map<int, int> maxes = {};

    for (var mass in masses) {
      maxes.addAll({mass: (finalMass! - (elementsSum - mass)) ~/ mass});
    }
    final list = List.generate(masses.length, (index) => 1);
    bool isEnd = false;
    while (!isEnd) {
      int maxEnd = 0;
      for (int i = 0; i < list.length; i++) {
        if (list[list.length - 1 - i] == maxes.values.toList()[list.length - 1 - i]) {
          maxEnd += 1;
        } else {
          break;
        }
      }
      finalResult = '';
      int sum = 0;
      bool flag = false;
      for (int i = 0; i < list.length - maxEnd; i++) {
        if (flag) break;

        if (list[i] < maxes.values.toList()[i]) {
          list[i] += 1;
          flag = true;
        } else {
          list[i] = 1;
        }
      }
      for (int i = 0; i < list.length; i++) {
        sum += list[i] * masses[i];
        finalResult += '${list[i]}*${masses[i]} + ';
      }
      if (sum == finalMass) {
        _combinations.add('${finalResult.substring(0,finalResult.length-2)}= $sum');
      }
      isEnd = true;
      for (int i = 0; i < list.length; i++) {
        isEnd = isEnd && list[i] == maxes.values.toList()[i];
      }
      if (isEnd) {
        break;
      }
      // print(finalResult);
    }
    notifyListeners();

    // final list = List.generate(masses.length, (index) => 1);
    // while (true) {
    //   finalResult = '';
    //   for (int i = 0; i < list.length; i++) {
    //     list[i] = Random().nextInt(maxes[maxes.keys.toList()[i]]! - 1) + 1;
    //
    //   }
    //   if (!_combinations.contains(finalResult)) {
    //     int sum = 0;
    //     for (int i = 0; i < list.length; i++) {
    //       sum += list[i] * masses[i];
    //     }
    //     if (sum == finalMass) {
    //       _combinations.add(finalResult);
    //       notifyListeners();
    //     }
    //   }
    // }
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
