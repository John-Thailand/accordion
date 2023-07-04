import 'package:flutter/material.dart';

class PjtAppBar extends StatelessWidget with PreferredSizeWidget {
  const PjtAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('AppBar'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(44);
}
