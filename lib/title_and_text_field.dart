import 'package:flutter/material.dart';

class TitleAndTextField extends StatelessWidget {
  const TitleAndTextField({super.key, required this.title, required this.controller});
  
  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title),
        TextField(
          controller: controller,
          decoration: const InputDecoration(border: OutlineInputBorder()),
        ),
        const SizedBox(height: 10,)
      ],
    );
  }
}
