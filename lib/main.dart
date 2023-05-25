import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PopExamplePage(),
    );
  }
}

// 遷移元
class PopExamplePage extends StatefulWidget {
  const PopExamplePage({super.key});

  @override
  State<PopExamplePage> createState() => _PopExamplePageState();
}

class _PopExamplePageState extends State<PopExamplePage> {
  late String _result;

  @override
  void initState() {
    super.initState();
    _result = "遷移先に移動";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Home Page（遷移元）'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _result,
              style: Theme.of(context).textTheme.headline5,
            ),
            ElevatedButton(
              onPressed: () async {
                var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EditPage(receive: 'Hello! from HomePage.'),
                  ),
                );
                print(result);
                setState(() {
                  _result = result;
                });
              },
              child: const Text('Go to Edit Page'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _result = "遷移先に移動";
          });
        },
        tooltip: '遷移先に移動',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

// 遷移先
class EditPage extends StatelessWidget {
  const EditPage({
    super.key,
    required this.receive,
  });

  final String receive;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        // 第二引数にわたす値を設定
        Navigator.pop(context, 'Thank you! from 戻るアイコン');
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Edit Page（遷移先）'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                receive,
                style: Theme.of(context).textTheme.headline5,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop('Thank you! from 戻るボタン');
                },
                child: Text('Return'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
