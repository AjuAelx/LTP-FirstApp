import 'package:flutter/material.dart';

import 'Notes.dart';

class NotesProvider extends ChangeNotifier {
  List<Notes> _notes = <Notes>[];

  List<Notes> get getNotes {
    return _notes;
  }

  NotesProvider() {
    addNotes("Munnar", "assets/Munnar.jpg");
    addNotes("Palakkadu", "assets/Palakkad.jpg");
    addNotes("Kalvari Mount", "assets/Kalvari Mount.jpg");
    addNotes("Illikkalkkallu", "assets/illikkalkallu.jpg");
    addNotes("Alappuzha", "assets/Alappuzha.jpg");
    addNotes("Idukki", "assets/idukki.jpg");
    addNotes("Kumarakam", "assets/Kumarakam.jpg");
    addNotes("Cherai Beach", "assets/Cherai Beach.jpg");
    
  }

  void addNotes(String title, String description) {
    Notes note = new Notes(title, description);

    _notes.add(note);
    notifyListeners();
  }

  void removeNotes(int index) {
    _notes.removeAt(index);
    notifyListeners();
  }
}
