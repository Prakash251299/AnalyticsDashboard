import 'package:analytics_dashboard/data/dummy_data.dart';
import 'package:analytics_dashboard/themes/para_colors.dart';
import 'package:analytics_dashboard/themes/para_sizes.dart';
import 'package:analytics_dashboard/themes/para_text_styles.dart';
import 'package:analytics_dashboard/widgets/para_card.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    required this.value,
    required this.label,
    this.percentage,
    super.key,
  });

  final String value;
  final String label;
  final double? percentage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ParaCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: ParaTextStyles.headline2,
            ),
            const SizedBox(height: ParaSizes.spacing4),
            Text(
              label,
              style: ParaTextStyles.body2Bold.copyWith(color: ParaColors.secondary),
            ),
            const SizedBox(height: ParaSizes.spacing16),
            percentage!=null? PercentageInfo(percentage: percentage!):Text("${DummyData.allUsers}",style: TextStyle(color: HexColor('#1db466'),fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}

class PercentageInfo extends StatelessWidget {
  const PercentageInfo({
    required this.percentage,
    super.key,
  });

  final double percentage;

  @override
  Widget build(BuildContext context) {
    final color = percentage < 0 ? ParaColors.error : ParaColors.valid;
    final arrowWidget = percentage < 0 ? Icons.arrow_downward_outlined : Icons.arrow_upward_outlined;
    final percentageText = percentage < 0 ? '${percentage.toStringAsFixed(0)}%' : '+${percentage.toStringAsFixed(0)}%';

    return Row(
      spacing: ParaSizes.spacing8,
      children: [
        Icon(
          arrowWidget,
          color: color,
        ),
        Text(
          percentageText,
          style: ParaTextStyles.body2.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
