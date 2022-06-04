import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_notes_app/notes_list_screen.dart';
import 'package:riverpod_notes_app/providers/notifier.dart';

class AddNoteScreen extends ConsumerWidget {
  final TextEditingController _controller = TextEditingController();
  AddNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(notesNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Add some note here...',
                  labelStyle: TextStyle(color: Colors.grey)),
              controller: _controller,
            ),
            const SizedBox(height: 10),
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: GestureDetector(
                      onTap: () {
                        notifier.addNote(_controller.text);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const NotesListScreen()));
                      },
                      child: const Text('Add Note',
                          style: TextStyle(color: Colors.white))),
                ))
          ],
        )),
      ),
    );
  }
}
