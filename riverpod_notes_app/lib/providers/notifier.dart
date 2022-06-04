import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotesNotifier {
  final List<String> _notes = ['First'];
  List<String> get notes => _notes;

  void addNote(String note) {
    _notes.add(note);
  }
}

final notesNotifierProvider = Provider((ref) => NotesNotifier());
