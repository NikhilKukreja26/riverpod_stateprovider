import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_provider/pages/auto_dispose_family/auto_dispose_family_provider.dart';

class AutoDisposeFamilyPage extends ConsumerWidget {
  const AutoDisposeFamilyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final incrementValue = ref.watch(autoDisposeFamilyCounterProvider(10));
    final decrementValue = ref.watch(autoDisposeFamilyCounterProvider(-10));
    return Scaffold(
      appBar: AppBar(
        title: const Text('AutoDisposeFamilyStateProvider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$incrementValue',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(width: 20.0),
                FilledButton(
                  onPressed: () {
                    ref
                        .read(autoDisposeFamilyCounterProvider(10).notifier)
                        .update((state) => state + 10);
                  },
                  child: const Text(
                    'Increment',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$decrementValue',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(width: 20.0),
                FilledButton(
                  onPressed: () {
                    ref
                        .read(autoDisposeFamilyCounterProvider(-10).notifier)
                        .update((state) => state - 10);
                  },
                  child: const Text(
                    'Decrement',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
