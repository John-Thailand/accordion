import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  // 入力
  const envFile = String.fromEnvironment('env');
  await dotenv.load(fileName: envFile);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: Scaffold(
          body: InkWell(
            onTap: () async {
              await Future.delayed(const Duration(seconds: 2));
              if (context.mounted) Navigator.pop(context);
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
