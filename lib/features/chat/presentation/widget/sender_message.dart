import 'package:flutter/material.dart';

import 'clickable_text.dart';

class SenderMessage extends StatelessWidget {
  final String text;
  final String time;

  const SenderMessage({required this.text, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bubble + time
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 260),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFF3B5DF6),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(2),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: ClickableText(
                  text: text,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),

                // child: Text(
                //   text,
                //   style: const TextStyle(color: Colors.white, fontSize: 14),
                // ),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: const TextStyle(fontSize: 11, color: Color(0xFF6B7280)),
              ),
            ],
          ),

          const SizedBox(width: 8),

          // Avatar
          const CircleAvatar(
            radius: 24,
            backgroundColor: Color(0xFFEC4899),
            child: Text('Y', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
