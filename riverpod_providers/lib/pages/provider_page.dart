import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_providers/widgets/text_widget.dart';

// Easiest solution. However this can not be changed
final numberProvider = Provider<int>((ref) => 42);

// Using ConsumerWidget
class ProviderPage extends ConsumerWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final number = ref.watch(numberProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Center(child: TextWidget('$number')),
    );
  }
}

// Using Consumer Widget. More optimized method
// class ProviderPage extends StatelessWidget {
//   const ProviderPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Provider'),
//       ),
//       body: Center(
//         child: Consumer(
//           builder: (context, WidgetRef ref, child) {
//             final number = ref.watch(numberProvider);
//             return TextWidget('$number');
//           },
//         ),
//       ),
//     );
//   }
// }
