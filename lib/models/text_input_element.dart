class TextInputElementModel{
  String? name;
  String? value;
  bool isEnable;

  TextInputElementModel({this.name, this.value, this.isEnable=true});

  void changeValue(String val) => value = val;
}