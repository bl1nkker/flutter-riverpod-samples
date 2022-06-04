class Notifier {
  final List<String> _notes = [];
  List<String> get notes => _notes;

  void addNote(String note) {
    _notes.add(note);
  }
}
