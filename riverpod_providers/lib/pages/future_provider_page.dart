import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_providers/widgets/text_widget.dart';

Future<String> fetchWeather() async {
  await Future.delayed(const Duration(seconds: 2));
  return 'Sunny';
}

final futureProvider = FutureProvider<String>((ref) => fetchWeather());

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<String> future = ref.watch(futureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: Center(
          child: future.when(
        data: (data) => TextWidget(data),
        loading: () => const CircularProgressIndicator(),
        error: (error, strace) => TextWidget(error.toString()),
      )),
    );
  }
}
