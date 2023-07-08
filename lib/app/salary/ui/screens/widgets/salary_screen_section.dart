import 'package:flutter/material.dart';

class SalaryScreenSection extends StatelessWidget {
  const SalaryScreenSection({
    super.key,
    required this.title,
    required this.body,
    this.trailing,
  });

  final String title;
  final Widget body;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.grey,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: style),
              if (trailing != null) Text(trailing!, style: style),
            ],
          ),
        ),
        const SizedBox(height: 8),
        body,
      ],
    );
  }
}
