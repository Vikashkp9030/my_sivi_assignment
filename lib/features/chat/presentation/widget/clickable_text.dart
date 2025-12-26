import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/service/dectionary_service.dart';

class ClickableText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const ClickableText({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    final words = text.split(' ');

    return RichText(
      text: TextSpan(
        children: words.map((word) {
          final cleanWord = word.replaceAll(RegExp(r'[^\w]'), '');

          return TextSpan(
            text: '$word ',
            style:
                style ??
                const TextStyle(color: Color(0xFF111827), fontSize: 16),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                if (cleanWord.isNotEmpty) {
                  showMeaningBottomSheet(context, cleanWord);
                }
              },
          );
        }).toList(),
      ),
    );
  }
}

void showMeaningBottomSheet(BuildContext context, String word) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<String>(
          future: DictionaryService().fetchMeaning(word),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text('No meaning found for "$word"');
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  word,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(snapshot.data!, style: const TextStyle(fontSize: 16)),
              ],
            );
          },
        ),
      );
    },
  );
}
