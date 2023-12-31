import 'package:cbt_memo/app_bar.dart';
import 'package:cbt_memo/rebuttal_to_automatic_thought.dart';
import 'package:cbt_memo/stress_diary.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'CBT Memo'),
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
            child: const Text('ストレス日記')
          ),
          const SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RebuttalToAutomaticThoughtPage()
                )
              );
            },
            child: const Text('自動思考への反論')
          ),
        ]
      ),
    );
  }
}
