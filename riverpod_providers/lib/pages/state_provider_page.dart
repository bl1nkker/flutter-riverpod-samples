import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_providers/widgets/text_widget.dart';

// Fully flexible provider. Can change the state
final stateProvider = StateProvider.autoDispose<int>((ref) => 0);

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(stateProvider.state);
    final counter = provider.state.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          provider.state++;
        },
      ),
      body: Center(
        child: TextWidget(counter),
      ),
    );
  }
}
