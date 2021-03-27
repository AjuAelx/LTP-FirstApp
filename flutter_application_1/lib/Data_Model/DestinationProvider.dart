import 'package:flutter/cupertino.dart';

import 'Destins.dart';

class DestinProvider extends ChangeNotifier {
  List<Destins> _destins = <Destins>[];

  List<Destins> get getDestins {
    return _destins;
  }

  DestinProvider() {
    addDestins("title", "description");
  }

  void addDestins(String title, String description) {
    Destins destin = new Destins(title, description);

    _destins.add(destin);
    notifyListeners();
  }

  void removeNotes(int index) {
    _destins.removeAt(index);
    notifyListeners();
  }
}
