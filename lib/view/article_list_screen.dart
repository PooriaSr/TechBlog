import 'package:flutter/material.dart';

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          width: 30,
          height: 30,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.pink),
        ),
      ),
    );
  }
}
