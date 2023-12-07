import 'package:cbt_memo/stress_diary.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CBT Memo')),
      body: ListView(
        padding: const EdgeInsets.all(20), 
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StressDiaryPage()
                )
              );
            },
            child: const Text('ストレス日記'))
        ]
      ),
    );
  }
}
