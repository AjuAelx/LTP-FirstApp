import 'package:flutter/cupertino.dart';

class DestinProvider extends ChangeNotifier {
  List<Destins> _destins = <Destins>[];

  List<Destins> get getDestins {
    return _destins;
  }

  DestinProvider() {
    addDestins("title", "description");
  }

  void addDestins(title, imageUrl) {
    Destins destin = new Destins(title, imageUrl);

    _destins.add(destin);
    notifyListeners();
  }

  void removeNotes(int index) {
    _destins.removeAt(index);
    notifyListeners();
  }
}

class Destins {
  Destins(String title, String imageUrl);
}
