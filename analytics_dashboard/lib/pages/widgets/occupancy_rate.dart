import 'package:analytics_dashboard/constants/occupancy_constants.dart';
import 'package:analytics_dashboard/data/dummy_data.dart';
import 'package:analytics_dashboard/themes/para_colors.dart';
import 'package:analytics_dashboard/themes/para_sizes.dart';
import 'package:analytics_dashboard/themes/para_text_styles.dart';
import 'package:analytics_dashboard/widgets/para_card.dart';
import 'package:contentsize_tabbarview/contentsize_tabbarview.dart';
import 'package:flutter/material.dart';
// import 'package:paracels/constants/occupancy_constants.dart';
// import 'package:paracels/data/dummy_data.dart';
// import 'package:paracels/themes/themes.dart';
// import 'package:paracels/widgets/para_card.dart';

class OccupancyRate extends StatefulWidget {
  const OccupancyRate({super.key});

  @override
  State<OccupancyRate> createState() => _OccupancyRateState();
}

class _OccupancyRateState extends State<OccupancyRate> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ParaCard(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: 390, // TODO(JVE): widget quick fix to avoid height change when changing tab
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: ParaSizes.spacing8,
              children: [
                Text(
                  'Users\' occupancy rate',
                  style: ParaTextStyles.headline3,
                ),
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'UsersWithState'),
                    Tab(text: 'UserWithCountry'),
                  ],
                  labelColor: ParaColors.selection,
                  unselectedLabelColor: ParaColors.secondary,
                  indicatorColor: ParaColors.selection,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  dividerColor: ParaColors.border,
                ),
                const SizedBox(
                  height: ParaSizes.spacing8,
                ),
                DefaultTabController(
                  length: 2,
                  child: ContentSizeTabBarView(
                    controller: _tabController,
                    children: const [
                      UsersWithState(),
                      UserWithCountry(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}

class UsersWithState extends StatelessWidget {
  const UsersWithState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: ParaSizes.spacing8,
      children: [
        for ( var i in  DummyData.usersCountStateWise.keys)...{
          DummyData.usersCountStateWise[i]!=null?OccupancyItem(label: '$i', value: DummyData.usersCountStateWise[i]!):OccupancyItem(label: '$i', value:0),
        }
      ],
    );
  }
}

class UserWithCountry extends StatelessWidget {
  const UserWithCountry({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: ParaSizes.spacing8,
      children: [
        for ( var i in  DummyData.usersCountCountryWise.keys)...{
          DummyData.usersCountCountryWise[i]!=null?OccupancyItem(label: '$i', value: DummyData.usersCountCountryWise[i]!):OccupancyItem(label: '$i', value:0),
        }
        // OccupancyItem(label: 'Released', value: 28),
        // OccupancyItem(label: 'Stable', value: 15),
        // OccupancyItem(label: 'Fair', value: 8),
        // OccupancyItem(label: 'Serious', value: 4),
        // OccupancyItem(label: 'Critical', value: 2),
        // OccupancyItem(label: 'Dead', value: 1),
      ],
    );
  }
}

class OccupancyItem extends StatelessWidget {
  const OccupancyItem({required this.label, required this.value, super.key});

  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        spacing: ParaSizes.spacing12,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: ParaTextStyles.body3,
              textAlign: TextAlign.end,
            ),
          ),
          Expanded(
            flex: 8,
            child: Stack(
              children: [
                Container(
                  height: ParaSizes.barChartHeight,
                  decoration: BoxDecoration(
                    color: ParaColors.backgroundPage,
                    borderRadius: BorderRadius.circular(ParaSizes.spacing2),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: value / OccupancyConstants.maxPatients,
                  child: Container(
                    height: ParaSizes.barChartHeight,
                    decoration: BoxDecoration(
                      color: ParaColors.chart,
                      borderRadius: BorderRadius.circular(ParaSizes.spacing2),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              '$value',
              style: ParaTextStyles.body2Secondary,
            ),
          ),
        ],
      ),
    );
  }
}
