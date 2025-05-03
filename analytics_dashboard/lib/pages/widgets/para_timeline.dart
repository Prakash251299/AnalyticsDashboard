import 'package:analytics_dashboard/data/dummy_data.dart';
import 'package:analytics_dashboard/painter/dashed_line_painter.dart';
import 'package:analytics_dashboard/themes/para_colors.dart';
import 'package:analytics_dashboard/themes/para_sizes.dart';
import 'package:analytics_dashboard/themes/para_text_styles.dart';
import 'package:analytics_dashboard/widgets/para_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:paracels/data/dummy_data.dart';
// import 'package:paracels/painter/dashed_line_painter.dart';
// import 'package:paracels/themes/themes.dart';
// import 'package:paracels/widgets/para_card.dart';

class ParaTimeline extends StatelessWidget {
  const ParaTimeline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ParaCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: ParaSizes.spacing16,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today's timeline",
                style: ParaTextStyles.headline3,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'View all',
                  style:
                      ParaTextStyles.body2Secondary.copyWith(color: ParaColors.selection, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const Timeline(),
        ],
      ),
    );
  }
}

class Timeline extends StatelessWidget {
  const Timeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimelineItem(
          hourTime: 8,
          title:'Active users',
          subtitle: '${DummyData.activeUsersWithTime["8_9"]}',
          temporality: Temporality.past,
        ),
        TimelineItem(
          hourTime: 9,
          title: 'Active users',
          subtitle: '${DummyData.activeUsersWithTime["9_10"]}',
          temporality: Temporality.actual,
        ),
        TimelineItem(
          hourTime: 10,
          title: 'Active users',
          subtitle: '${DummyData.activeUsersWithTime["10_11"]}',
          temporality: Temporality.future,
        ),
      ],
    );
  }
}

enum Temporality {
  actual,
  past,
  future,
}

class TimelineItem extends StatelessWidget {
  const TimelineItem({
    required this.hourTime,
    required this.title,
    required this.subtitle,
    required this.temporality,
    super.key,
  });
  final int hourTime;
  final String title;
  final String subtitle;
  final Temporality temporality;

  @override
  Widget build(BuildContext context) {
    Color getTimelineTextColor() {
      switch (temporality) {
        case Temporality.actual:
          return ParaColors.selection;
        case Temporality.past:
          return ParaColors.secondary;
        case Temporality.future:
          return ParaColors.primary;
      }
    }

    final textStyle = ParaTextStyles.body2Bold.copyWith(
      color: getTimelineTextColor(),
      fontWeight: FontWeight.w600,
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            child: Text(
              DateFormat('HH:mm').format(DateTime(2023, 1, 1, hourTime)),
              style: ParaTextStyles.body3Condensed.copyWith(
                color: ParaColors.secondary,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: CustomPaint(
                    painter: DashedLinePainter(),
                  ),
                ),
                const SizedBox(
                  height: ParaSizes.spacing12,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: temporality == Temporality.actual
                        ? ParaColors.selection.withValues(alpha: 0.1)
                        : ParaColors.backgroundPage,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: textStyle,
                      ),
                      const SizedBox(height: ParaSizes.spacing8),
                      Text(
                        subtitle,
                        style: textStyle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: ParaSizes.spacing12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
