import 'package:flutter/material.dart';

class TextInfo extends StatelessWidget {
  const TextInfo({super.key, required this.title, required this.text});

  final String title;
  final String text;

  static Widget expanded({required String title, required String text}) {
    return Expanded(
      child: TextInfo(
        title: title,
        text: text,
      ),
    );
  }

  static Widget count({
    required List<String> titles,
    required List<String> texts,
    required int itemCount,
  }) {
    if (titles.length != itemCount || texts.length != itemCount) {
      throw "the length of the item must be the same as the itemCount";
    }

    return Row(
      children: [
        for (var i = 0; i < itemCount; i++)
          Expanded(
            child: TextInfo(
              title: titles[i],
              text: texts[i],
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 2),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }
}
