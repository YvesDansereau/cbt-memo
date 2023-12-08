import 'package:cbt_memo/app_bar.dart';
import 'package:cbt_memo/title_and_text_field.dart';
import 'package:flutter/material.dart';

class RebuttalToAutomaticThoughtPage extends StatefulWidget {
  const RebuttalToAutomaticThoughtPage({super.key});

  @override
  State<RebuttalToAutomaticThoughtPage> createState() =>
      _RebuttalToAutomaticThoughtPageState();
}

class _RebuttalToAutomaticThoughtPageState
    extends State<RebuttalToAutomaticThoughtPage> {
  final event = TextEditingController();

  final automaticThought = TextEditingController();

  final possibilityBeforeRebuttal = TextEditingController();

  final evidence = TextEditingController();

  final rebuttal = TextEditingController();

  final possibilityAfterRebuttal = TextEditingController();

  final items = <RebuttalItem>[];

  void postItem() {
    final item = RebuttalItem(
        event.text,
        automaticThought.text,
        possibilityBeforeRebuttal.text,
        evidence.text,
        rebuttal.text,
        possibilityAfterRebuttal.text);

    setState(() {
      items.add(item);
    });

    event.clear();
    automaticThought.clear();
    possibilityBeforeRebuttal.clear();
    evidence.clear();
    rebuttal.clear();
    possibilityAfterRebuttal.clear();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const CommonAppBar(title: '自動思考への反論'),
      body: ListView(padding: const EdgeInsets.all(20), children: <Widget>[
        TitleAndTextField(
          title: '出来事',
          controller: event,
        ),
        TitleAndTextField(
          title: '自動思考',
          controller: automaticThought,
        ),
        TitleAndTextField(
          title: '悪いことが起こると最初に思った確率',
          controller: possibilityBeforeRebuttal,
        ),
        TitleAndTextField(
          title: '自動思考の証拠',
          controller: evidence,
        ),
        TitleAndTextField(
          title: '自動思考への反論',
          controller: rebuttal,
        ),
        TitleAndTextField(
          title: '悪いことが起こると反論後に思った確率',
          controller: possibilityAfterRebuttal,
        ),
        ElevatedButton(
          onPressed: postItem,
          style: ElevatedButton.styleFrom(
              foregroundColor: theme.colorScheme.onPrimary,
              backgroundColor: theme.colorScheme.primary),
          child: const Text('投稿'),
        ),
        const SizedBox(
          height: 20,
        ),
        for (var item in items.reversed) RebuttalCard(rebuttalItem: item,),
      ]),
    );
  }
}

class RebuttalItem {
  final String event;
  final String automaticThought;
  final String possibilityBeforeRebuttal;
  final String evidence;
  final String rebuttal;
  final String possibilityAfterRebuttal;

  const RebuttalItem(
      this.event,
      this.automaticThought,
      this.possibilityBeforeRebuttal,
      this.evidence,
      this.rebuttal,
      this.possibilityAfterRebuttal);
}

class RebuttalCard extends StatelessWidget {
  final RebuttalItem rebuttalItem;

  const RebuttalCard({super.key, required this.rebuttalItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('事象: ${rebuttalItem.event}\n'
            '自動思考: ${rebuttalItem.automaticThought}\n'
            '悪いことが起こると最初に思った確率: ${rebuttalItem.possibilityBeforeRebuttal}\n'
            '証拠: ${rebuttalItem.evidence}\n'
            '反論: ${rebuttalItem.rebuttal}\n'
            '悪いことが起こると反論後に思った確率: ${rebuttalItem.possibilityAfterRebuttal}'),
      ),
    );
  }
}
