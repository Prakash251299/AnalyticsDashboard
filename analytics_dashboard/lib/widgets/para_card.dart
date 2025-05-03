import 'package:analytics_dashboard/themes/para_colors.dart';
import 'package:analytics_dashboard/themes/para_sizes.dart';
import 'package:flutter/material.dart';
// import 'package:paracels/themes/para_colors.dart';
// import 'package:paracels/themes/para_sizes.dart';

class ParaCard extends StatelessWidget {
  const ParaCard({required this.child, this.paddingSpacing, super.key});

  final Widget child;
  final double? paddingSpacing;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        color: ParaColors.background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(paddingSpacing ?? ParaSizes.spacing16),
          child: child,
        ),);
  }
}
