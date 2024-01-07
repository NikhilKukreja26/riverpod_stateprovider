import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_provider/pages/basic/basic_provider.dart';

class BasicPage extends ConsumerWidget {
  const BasicPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.listen<int>(
    //   counterProvider,
    //   (previous, next) {
    //     if (next == 3) {
    //       showDialog(
    //         context: context,
    //         builder: (_) {
    //           return AlertDialog(
    //             content: Text('Counter: $next'),
    //           );
    //         },
    //       );
    //     }
    //   },
    // );
    final value = ref.watch(ageProvider);
    // if (value == 3) {
    //   showDialog(
    //       context: context,
    //       builder: (_) {
    //         return AlertDialog(
    //           content: Text('Counter: $value'),
    //         );
    //       });
    // }
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateProvider'),
      ),
      body: Center(
        child: Text(
          '$value',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}