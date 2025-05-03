import 'package:analytics_dashboard/data/dummy_data.dart';
import 'package:analytics_dashboard/themes/para_colors.dart';
import 'package:analytics_dashboard/themes/para_sizes.dart';
import 'package:analytics_dashboard/themes/para_text_styles.dart';
import 'package:analytics_dashboard/widgets/para_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
// import 'package:paracels/data/dummy_data.dart';
// import 'package:paracels/themes/para_colors.dart';
// import 'package:paracels/themes/para_sizes.dart';
// import 'package:paracels/themes/para_text_styles.dart';
// import 'package:paracels/widgets/para_card.dart';

class RateOfUse extends StatelessWidget {
  const RateOfUse({super.key});

  @override
  Widget build(BuildContext context) {
    return ParaCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: ParaSizes.spacing16,
        children: [
          Text(
            'Users\' rate of use',
            style: ParaTextStyles.headline3,
          ),
          const LineChartSample4(),
        ],
      ),
    );
  }
}

TextStyle chartTextStyle = ParaTextStyles.body3Condensed.copyWith(
  color: ParaColors.secondary,
  fontWeight: FontWeight.w600,
);

class LineChartSample4 extends StatelessWidget {
  const LineChartSample4({
    super.key,
  });

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Jan';
      case 1:
        text = 'Feb';
      case 2:
        text = 'Mar';
      case 3:
        text = 'Apr';
      case 4:
        text = 'May';
      case 5:
        text = 'Jun';
      case 6:
        text = 'Jul';
      case 7:
        text = 'Aug';
      case 8:
        text = 'Sep';
      case 9:
        text = 'Oct';
      case 10:
        text = 'Nov';
      case 11:
        text = 'Dec';
      default:
        return Container();
    }

    return SideTitleWidget(
      meta: meta,
      space: 4,
      child: Text(
        text,
        style: chartTextStyle,
      ),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    final style = chartTextStyle;
    return SideTitleWidget(
      meta: meta,
      child: Text(value.toStringAsFixed(0), style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    // DummyData d = DummyData();
    Map<String,int> dateMap = DummyData.getCurrentDate();
    // print(month);

    List<FlSpot> patientNumber = [];
    patientNumber.add(FlSpot(-0.5, 0),);

    for(int i=0;i<12;i++){
      // print(DummyData.monthlyRequests.keys.indexed.elementAt(i).$2);
      if(i>=dateMap["month"]!){break;}
      patientNumber.add(FlSpot(double.parse(i.toString()),DummyData.monthlyRequests[DummyData.monthlyRequests.keys.indexed.elementAt(i).$2]!=null?DummyData.monthlyRequests[DummyData.monthlyRequests.keys.indexed.elementAt(i).$2]!:0));
    }
    // patientNumber.add(FlSpot(12,0));

    return AspectRatio(
      aspectRatio: 3,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 12,
          right: 28,
          top: 22,
          bottom: 12,
        ),
        child: LineChart(
          LineChartData(
            lineTouchData: const LineTouchData(enabled: false),
            lineBarsData: [
              LineChartBarData(
                spots: patientNumber,
                isCurved: true,
                color: ParaColors.chart,
                belowBarData: BarAreaData(
                  show: true,
                  color: ParaColors.chart.withValues(alpha: 0.3),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      ParaColors.chart.withValues(alpha: 0.3),
                      ParaColors.chart.withValues(alpha: 0.03),
                    ],
                  ),
                ),
                dotData: const FlDotData(
                  show: false,
                ),
              ),
            ],
            minX: -0.5,
            maxX: 11.5,
            minY: 0,
            maxY: 1300,
            titlesData: FlTitlesData(
              topTitles: const AxisTitles(),
              rightTitles: const AxisTitles(),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  maxIncluded: false,
                  minIncluded: false,
                  reservedSize: 18,
                  interval: 1,
                  getTitlesWidget: bottomTitleWidgets,
                ),
              ),
              leftTitles: AxisTitles(
                axisNameSize: 20,
                sideTitles: SideTitles(
                  showTitles: true,
                  maxIncluded: false,
                  interval: 200,
                  reservedSize: 40,
                  getTitlesWidget: leftTitleWidgets,
                ),
              ),
            ),
            borderData: FlBorderData(
              show: false,
              border: Border(bottom: BorderSide(color: ParaColors.border)),
            ),
            gridData: const FlGridData(
              drawVerticalLine: false,
              horizontalInterval: 200,
            ),
          ),
        ),
      ),
    );
  }
}
