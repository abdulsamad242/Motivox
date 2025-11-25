import 'package:flutter/material.dart';

class QuoteSection extends StatelessWidget {
  final String quote;

  const QuoteSection({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "\"",
                  style: TextStyle(fontSize: 20, color: Colors.orange),
                ),
                TextSpan(
                  text: quote,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                TextSpan(
                  text: "\"",
                  style: TextStyle(fontSize: 20, color: Colors.orange),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
