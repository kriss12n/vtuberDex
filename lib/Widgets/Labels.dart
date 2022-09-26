import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String label;
  final String data;

  const Labels({
    super.key,
    required this.label,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: SizedBox(
            width: 120,
            child: Text(
              label,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(width: 30.0),
        SizedBox(
          width: 140,
          child: Text(
            data,
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        )
      ],
    );
  }
}
