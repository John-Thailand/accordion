import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool cute = false;
  bool beautiful = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ExpansionTile'),
        ),
        body: Column(
          children: [
            ExpansionTile(
              title: Text('好きなタイプは？'),
              onExpansionChanged: (bool changed) {
                setState(
                  () {
                    cute = false;
                    beautiful = changed;
                  },
                );
              },
              children: [
                CheckboxListTile(
                  value: cute,
                  onChanged: (checked) {
                    setState(() {
                      cute = checked!;
                    });
                  },
                  title: Text('可愛い系'),
                ),
                CheckboxListTile(
                  value: beautiful,
                  onChanged: (checked) {
                    setState(() {
                      beautiful = checked!;
                    });
                  },
                  title: Text('美人系'),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('説明'),
              children: [
                Container(
                  height: 50,
                  child: const Text('好きなタイプにチェックを入れよう！'),
                )
              ],
            )
          ],
        ));
  }
}
