import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_providers/widgets/text_widget.dart';

Stream<int> countStream() async* {
  int i = 0;
  while (true) {
    await Future.delayed(const Duration(seconds: 1));
    yield i++;
  }
}

final streamProvider = StreamProvider.autoDispose<int>((ref) => countStream());

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({Key? key}) : super(key: key);

  Widget buildStreamWhen(WidgetRef ref) {
    AsyncValue<int> stream = ref.watch(streamProvider);
    return stream.when(
        data: (data) => TextWidget(data.toString()),
        error: (error, strace) => const TextWidget('Some error'),
        loading: () => const CircularProgressIndicator());
  }

  Widget buildStreamBuilder(WidgetRef ref) {
    final stream = ref.watch(streamProvider.stream);
    return StreamBuilder<int>(
        stream: stream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const TextWidget('Not initialized');
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            case ConnectionState.active:
              return TextWidget(snapshot.data.toString());
            case ConnectionState.done:
              return TextWidget(snapshot.data.toString());
          }
        });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: Center(
        child: buildStreamWhen(ref),
      ),
    );
  }
}
