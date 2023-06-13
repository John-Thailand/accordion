import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dataProvider = FutureProvider<List<String>>((ref) async {
  // ダミーの非同期処理（APIからデータを取得するなど）
  await Future.delayed(const Duration(seconds: 2));

  // 取得したデータを返す
  return ['Apple', 'Banana', 'Orange'];
});

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('FutureBuilderの使い方')),
        body: const _FutureWidget(),
      ),
    );
  }
}

class _FutureWidget extends ConsumerWidget {
  const _FutureWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataList = ref.watch(dataProvider); // データを監視

    return dataList.when(
      // データがロード中の場合
      loading: () => const CircularProgressIndicator(),
      // データが利用可能な場合
      data: (list) => ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(list[index]),
        ),
      ),
      // エラーが発生した場合
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}
