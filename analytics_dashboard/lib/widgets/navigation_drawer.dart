import 'package:analytics_dashboard/themes/para_colors.dart';
import 'package:analytics_dashboard/themes/para_sizes.dart';
import 'package:analytics_dashboard/themes/para_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:paracels/themes/themes.dart';

class ParaNavigationDrawer extends StatelessWidget {
  const ParaNavigationDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ParaSizes.drawerWidth,
      child: Drawer(
        backgroundColor: ParaColors.primary,
        shape: const RoundedRectangleBorder(),
        child: Column(
          children: [
            SizedBox(
              height: ParaSizes.headerHeight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: ParaSizes.spacing32,
                ),
                child: Row(
                  children: [
                    ClipOval(
                      child: ColoredBox(
                        color: ParaColors.background,
                        child: SvgPicture.asset(
                          'assets/icons/para_icon.svg',
                          colorFilter: ColorFilter.mode(ParaColors.paraColor, BlendMode.srcIn),
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Analyser',
                      style: ParaTextStyles.body2White,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: ParaSizes.spacing8),
            // Menu items
            const DrawerListTile(
              icon: Icons.grid_view_outlined,
              title: 'Dashboard',
            ),
            // const DrawerListTile(icon: Icons.more_time_outlined, title: 'Appointments'),
            const DrawerListTile(icon: Icons.analytics_outlined, title: 'Analytics and reports'),
            const Spacer(),
            const DrawerListTile(icon: Icons.help_outline_outlined, title: 'Support'),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    required this.icon,
    required this.title,
    super.key,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: ParaSizes.spacing32,
      ),
      hoverColor: ParaColors.hoverColor,
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      onTap: () {},
      title: Text(
        title,
        style: ParaTextStyles.body2White,
      ),
      selected: true,
    );
  }
}
