import 'package:flutter/material.dart';
import 'package:life_manager/app/core/ui/theme/core/theme_provider.dart';

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
    final usedRightTextColor =
        rightTextColor ?? context.theme.palette.text.primary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: emphasized
            ? context.theme.palette.status.positive
            : context.theme.palette.foreground.primary,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: emphasized
            ? [
                BoxShadow(
                  color: context.theme.palette.status.positive.withOpacity(0.1),
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
              color: emphasized
                  ? context.theme.palette.text.primaryInverted
                  : context.theme.palette.text.primary,
            ),
          ),
          const Spacer(),
          Text(
            rightText,
            style: TextStyle(
              fontSize: 18,
              color: emphasized
                  ? context.theme.palette.text.primaryInverted
                  : usedRightTextColor,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.5,
            ),
          ),
          if (editable) ...[
            const SizedBox(width: 8),
            Icon(
              Icons.edit,
              size: 16,
              color: context.theme.palette.text.secondary,
            ),
          ],
        ],
      ),
    );
  }
}
