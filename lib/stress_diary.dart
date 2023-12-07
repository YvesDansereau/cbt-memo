import 'package:flutter/material.dart';

import 'title_and_text_field.dart';

class StressDiaryPage extends StatefulWidget {
  const StressDiaryPage({super.key});

  @override
  State<StressDiaryPage> createState() => _StressDiaryPageState();
}

class _StressDiaryPageState extends State<StressDiaryPage> {
  final event = TextEditingController();

  final automaticThought = TextEditingController();

  final physicalSensation = TextEditingController();

  final sentiment = TextEditingController();

  final handling = TextEditingController();

  final diaries = <StressDiary>[];

  void postDiary() {
    final diary = StressDiary(event.text, automaticThought.text,
        physicalSensation.text, sentiment.text, handling.text);
    setState(() {
      diaries.add(diary);
    });

    event.clear();
    automaticThought.clear();
    physicalSensation.clear();
    sentiment.clear();
    handling.clear();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('CBT Memo')),
      body: ListView(
        padding: const EdgeInsets.all(20), 
        children: <Widget>[
          TitleAndTextField(
            title: '出来事',
            controller: event,
          ),
          TitleAndTextField(
            title: '自動思考',
            controller: automaticThought,
          ),
          TitleAndTextField(
            title: '身体感覚',
            controller: physicalSensation,
          ),
          TitleAndTextField(
            title: '感情',
            controller: sentiment,
          ),
          TitleAndTextField(
            title: '対処',
            controller: handling,
          ),
          ElevatedButton(
            onPressed: postDiary,
            style: ElevatedButton.styleFrom(
                foregroundColor: theme.colorScheme.onPrimary,
                backgroundColor: theme.colorScheme.primary),
            child: const Text('投稿'),
          ),
          const SizedBox(height: 20,),
          for (var diary in diaries.reversed) StressDiaryCard(stressDiary: diary),
        ]
      ),
    );
  }
}

class StressDiary {
  const StressDiary(this.event, this.automaticThought, this.physicalSensation,
      this.sentiment, this.handling);

  final String event;
  final String automaticThought;
  final String physicalSensation;
  final String sentiment;
  final String handling;
}

class StressDiaryCard extends StatelessWidget {
  final StressDiary stressDiary;

  const StressDiaryCard({super.key, required this.stressDiary});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('事象: ${stressDiary.event}\n'
            '自動思考: ${stressDiary.automaticThought}\n'
            '身体感覚: ${stressDiary.physicalSensation}\n'
            '感情: ${stressDiary.sentiment}\n'
            '対処: ${stressDiary.handling}'),
      ),
    );
  }
}
