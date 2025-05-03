import 'package:analytics_dashboard/data/dummy_data.dart';
import 'package:analytics_dashboard/themes/para_sizes.dart';
import 'package:analytics_dashboard/themes/para_text_styles.dart';
import 'package:analytics_dashboard/widgets/para_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:paracels/data/dummy_data.dart';
// import 'package:paracels/themes/para_sizes.dart';
// import 'package:paracels/themes/para_text_styles.dart';
// import 'package:paracels/widgets/para_card.dart';

class ChartSection {
  ChartSection({required this.color, required this.text, required this.percent});

  final Color color;
  final String text;
  final int percent;
}

final List<ChartSection> ageSections = [
  ChartSection(color: HexColor('#eb4a97'), text: '0-17', percent: DummyData.ageDistribution["0_17"]!),
  ChartSection(color: HexColor('#7d21d9'), text: '18-35', percent: DummyData.ageDistribution["18_35"]!),
  ChartSection(color: HexColor('#e31a54'), text: '36-59', percent: DummyData.ageDistribution["36_59"]!),
  ChartSection(color: HexColor('#0086c9'), text: '60+', percent: DummyData.ageDistribution["60+"]!),
];

class UserAgeChart extends StatelessWidget {
  const UserAgeChart({super.key});

  @override
  Widget build(BuildContext context) {
    return ParaCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Users' age distribution",
            style: ParaTextStyles.headline3,
          ),
          const PatientsAgePieChart(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: ParaSizes.spacing2,
            children:
                ageSections.map((ageSection) => Indicator(color: ageSection.color, text: ageSection.text)).toList(),
          ),
        ],
      ),
    );
  }
}

class PatientsAgePieChart extends StatelessWidget {
  const PatientsAgePieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: PieChart(
        PieChartData(
          borderData: FlBorderData(
            show: false,
          ),
          sectionsSpace: 0,
          centerSpaceRadius: 50,
          sections: () {
            const radius = 35.0;
            return ageSections
                .map(
                  (ageSection) => PieChartSectionData(
                    color: ageSection.color,
                    value: ageSection.percent.toDouble(),
                    radius: radius,
                    showTitle: false,
                  ),
                )
                .toList();
          }(),
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    required this.color,
    required this.text,
    super.key,
  });

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        Text(text, style: ParaTextStyles.body3),
      ],
    );
  }
}
