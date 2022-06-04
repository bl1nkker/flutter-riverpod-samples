import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_notes_app/providers/notifier.dart';

class NotesListScreen extends ConsumerWidget {
  const NotesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesNotifier = ref.watch(notesNotifierProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Notes'),
        ),
        body: ListView.builder(
          itemCount: notesNotifier.notes.length,
          itemBuilder: (context, index) {
            final note = notesNotifier.notes[index];
            return ListTile(
              title: Text(note),
            );
          },
        ));
  }
}
