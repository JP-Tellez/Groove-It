import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  //variables
  var _nameController = TextEditingController();
  var _locationController = TextEditingController();
  var _notesController = TextEditingController();
  bool _checkbox = false;
  List<dynamic> _lista = [];
  int _selected = 0;

  //getters
  TextEditingController get getNameController => _nameController;
  TextEditingController get getLocationController => _locationController;
  TextEditingController get getNotesController => _notesController;
  bool get getCheckBox => _checkbox;
  List get getLista => _lista;
  int get getSelected => _selected;

  //metodos
  void setCheckbox(bool? cambiar) {
    _checkbox = cambiar ?? false;
    notifyListeners();
  }

  void elDelete() {
    _nameController = TextEditingController();
    _locationController = TextEditingController();
    _notesController = TextEditingController();
    _checkbox = false;
    notifyListeners();
  }

  void elSave() {
    String season;
    if (_checkbox == true) {
      season = "Currently in season";
    } else {
      season = "Currently not in season";
    }

    Map<String, dynamic> elNuevo = {
      "name": _nameController.text,
      "location": _locationController.text,
      "inSeason": season,
      "notes": _notesController.text,
    };
    _lista.add(elNuevo);
    notifyListeners();
  }

  void setSelected(int i) {
    _selected = i;
  }
}
