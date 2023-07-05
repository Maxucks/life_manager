import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.leftText,
    required this.rightText,
    this.emphasized = false,
    this.editable = false,
    this.rightTextColor,
  });

  final String leftText;
  final String rightText;
  final bool editable;
  final Color? rightTextColor;
  final bool emphasized;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: emphasized ? Colors.green : Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: emphasized
            ? [
                BoxShadow(
                  color: Colors.green.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 5,
                  offset: const Offset(0, 5),
                ),
              ]
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: TextStyle(
              fontSize: 16,
              color: emphasized ? Colors.white : Colors.black,
            ),
          ),
          const Spacer(),
          Text(
            rightText,
            style: TextStyle(
              fontSize: 18,
              color: emphasized ? Colors.white : rightTextColor,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.5,
            ),
          ),
          if (editable) ...[
            const SizedBox(width: 8),
            const Icon(
              Icons.edit,
              size: 16,
              color: Colors.grey,
            ),
          ],
        ],
      ),
    );
  }
}
