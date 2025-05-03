import 'package:analytics_dashboard/pages/widgets/occupancy_rate.dart';
import 'package:analytics_dashboard/pages/widgets/para_calendar.dart';
import 'package:analytics_dashboard/pages/widgets/para_timeline.dart';
import 'package:analytics_dashboard/pages/widgets/rate_of_use.dart';
import 'package:analytics_dashboard/pages/widgets/stat_card.dart';
import 'package:analytics_dashboard/pages/widgets/user_age_chart.dart';
import 'package:analytics_dashboard/themes/para_colors.dart';
import 'package:analytics_dashboard/themes/para_sizes.dart';
import 'package:analytics_dashboard/themes/para_text_styles.dart';
import 'package:analytics_dashboard/widgets/para_page.dart';
import 'package:flutter/material.dart';
// import 'package:paracels/pages/widgets/occupancy_rate.dart';
// import 'package:paracels/pages/widgets/para_calendar.dart';
// import 'package:paracels/pages/widgets/para_timeline.dart';
// import 'package:paracels/pages/widgets/user_age_chart.dart';
// import 'package:paracels/pages/widgets/rate_of_use.dart';
// import 'package:paracels/pages/widgets/stat_card.dart';
// import 'package:paracels/themes/para_colors.dart';
// import 'package:paracels/themes/para_sizes.dart';
// import 'package:paracels/themes/para_text_styles.dart';
// import 'package:paracels/widgets/para_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ParaPage(
      body: ColoredBox(
        color: ParaColors.backgroundPage,
        child: ListView(
          padding: const EdgeInsets.all(ParaSizes.spacing24),
          children: [
            Text(
              "Get a comprehensive overview of your apps activity",
              style: ParaTextStyles.body1Secondary,
            ),
            const DashboardGap(),
            const Row(
              children: [
                StatCard(
                  value: '30 min+',
                  label: "Average users with more than 30 min",
                  percentage: 2,
                ),
                DashboardGap(),
                StatCard(
                  value: '<30 min',
                  label: "Percentage users below 30 min",
                  percentage: 10,
                ),
                DashboardGap(),
                StatCard(
                  value: 'New users',
                  label: 'New users account created',
                  percentage: -7,
                ),
                DashboardGap(),
                StatCard(
                  value: 'All users',
                  label: 'Total number of Users',
                ),
              ],
            ),
            const DashboardGap(),
            const IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: ParaCalendar(),
                  ),
                  DashboardGap(),
                  // Timeline
                  Expanded(
                    flex: 7,
                    child: ParaTimeline(),
                  ),
                ],
              ),
            ),
            const DashboardGap(),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: 
                    Container(
                      // height: 390,
                      child: OccupancyRate()
                    ),
                  ),
                  // DashboardGap(),
                  // Expanded(
                  //   flex: 3,
                  //   child: HospitalActivityCard(),
                  // ),
                ],
              ),
            ),
            const DashboardGap(),
            const IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: RateOfUse(),
                  ),
                  DashboardGap(),
                  Expanded(
                    flex: 2,
                    child: UserAgeChart(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardGap extends StatelessWidget {
  const DashboardGap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: ParaSizes.spacing16,
      height: ParaSizes.spacing16,
    );
  }
}
