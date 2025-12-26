import 'package:flutter/material.dart';

import 'clickable_text.dart';

class ReceiverMessage extends StatelessWidget {
  final String text;
  final String time;
  final String name;

  const ReceiverMessage({
    super.key,
    required this.text,
    required this.time,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: const Color(0xFF7B6CF6),
            child: Text(
              name[0].toLowerCase(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 260),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFDCDCDC),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClickableText(text: text),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: const TextStyle(fontSize: 11, color: Color(0xFF6B7280)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
