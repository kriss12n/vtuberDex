import 'package:flutter/material.dart';

class CardDates extends StatelessWidget {
  final String date;
  final String title;

  const CardDates(this.date, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: 150,
      height: 68,
      decoration: BoxDecoration(
          color: const Color(0xffF8EBEB),
          borderRadius: BorderRadius.circular(15.0)),
      child: Row(children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
          child: const Icon(Icons.cake_outlined),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xffD4C1C1),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5.0),
              Text(
                date,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
