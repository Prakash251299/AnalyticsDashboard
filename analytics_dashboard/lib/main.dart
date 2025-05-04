import 'package:analytics_dashboard/data/dummy_data.dart';
import 'package:analytics_dashboard/firebase_options.dart';
import 'package:analytics_dashboard/pages/dashboard_page.dart';
import 'package:analytics_dashboard/themes/para_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:paracels/pages/dashboard_page.dart';
// import 'package:ana/themes/para_colors.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // MyApp({super.key});
  DummyData d = DummyData();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prakash Dashboard',
      theme: ThemeData(
        fontFamily: 'NunitoSans',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: ParaColors.background,
      ),
      home: ResponsiveBreakpoints.builder(
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
        child: FutureBuilder(
          future: d.fetchAllData(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            // } else if (snapshot.hasError) {
            //   return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              return DashboardPage();
            } else {
              d.refreshData();
              return DashboardPage();
              // return Center(child: Text('No data'));
            }
          }
        )
      ),
    );
  }
}
