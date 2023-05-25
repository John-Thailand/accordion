import 'package:flutter/material.dart';

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
            InkWell(
              // highlightColor: Colors.grey,
              splashColor: Colors.grey,
              onTap: () {
                print('AAAA');
              },
              child: Text('AAAA'),
            ),
            ExpansionTile(
              initiallyExpanded: true,
              maintainState: true,
              // subtitle: Text('AAA'),
              // leading: Text('BBB'),
              trailing: const SizedBox.shrink(),
              backgroundColor: Colors.amber,
              collapsedBackgroundColor: Colors.red,
              title: Row(
                children: [Text('好きなタイプは？'), Text('A')],
              ),
              onExpansionChanged: (bool changed) {
                setState(
                  () {
                    cute = false;
                    beautiful = changed;
                  },
                );
              },
              children: [
                InkWell(
                  highlightColor: Colors.grey,
                  onTap: () {
                    print('AAAA');
                  },
                  child: Text('AAAA'),
                ),
                ListTile(
                  title: Text('子要素2'),
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
