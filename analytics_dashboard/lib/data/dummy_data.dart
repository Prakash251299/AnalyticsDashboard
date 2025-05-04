// import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:paracels/models/room.dart';

//In a true app, this would be in a repository to access to backend in all initState with fetch commands

class DummyData {
  static refreshData()async{
    var db = FirebaseFirestore.instance;
    // List<dynamic> topThreeGenres = getTopThreeGenres(topGenre);
    await db
    .collection("LinkifyData")
    .doc("Linkify")
    .set({
      "new0to20":DummyData.new0to20,
      "new20to100":DummyData.new20to100,
      "new100andMore":DummyData.new100andMore,
      "percentUsersMoreThan30Min":DummyData.percentUsersMoreThan30Min,
      "percentUsersLessThan30min":DummyData.percentUsersLessThan30min,
      "newUsers":DummyData.newUsers,
      "allUsers":DummyData.allUsers,
      "activeUsersWithTime":DummyData.activeUsersWithTime,
      "usersCountStateWise":DummyData.usersCountStateWise,
      "usersCountCountryWise":DummyData.usersCountCountryWise,
      "monthlyRequests":DummyData.monthlyRequests,
      "ageDistribution":DummyData.ageDistribution,
    })
    .onError((e, _) => print("Error writing user info in firebase: $e"));
  }
  static Map<String,int> getCurrentDate() {
    DateTime now = DateTime.now();
    Map<String,int>m={"year":2025,"month":4,"day":29};
    m = {"year":int.parse(DateFormat('y').format(now)),"month":int.parse(DateFormat('M').format(now)),"day":int.parse(DateFormat('d').format(now))};
    return m;
  }
  // DummyData d = DummyData();
  static Map<String,int>dateMap = DummyData.getCurrentDate();
  // dateMap["day"]!>
  static final new0to20 = [
    DateTime(dateMap["year"]!, dateMap["day"]!>28?dateMap["month"]!:dateMap["month"]!-1, 28),
    DateTime(dateMap["year"]!, dateMap["day"]!>9?dateMap["month"]!:dateMap["month"]!-1, 9),
    DateTime(dateMap["year"]!, dateMap["day"]!>12?dateMap["month"]!:dateMap["month"]!-1, 12),
    DateTime(dateMap["year"]!, dateMap["day"]!>22?dateMap["month"]!:dateMap["month"]!-1, 22),
    DateTime(dateMap["year"]!, dateMap["day"]!>24?dateMap["month"]!:dateMap["month"]!-1, 24),
  ];

  static final new20to100 = [
    DateTime(dateMap["year"]!, dateMap["day"]!>10?dateMap["month"]!:dateMap["month"]!-1, 10),
    DateTime(dateMap["year"]!, dateMap["day"]!>14?dateMap["month"]!:dateMap["month"]!-1, 14),
    DateTime(dateMap["year"]!, dateMap["day"]!>3?dateMap["month"]!:dateMap["month"]!-1, 3),
  ];

  static final new100andMore = [
    DateTime(dateMap["year"]!, dateMap["day"]!>11?dateMap["month"]!:dateMap["month"]!-1, 11),
    DateTime(dateMap["year"]!, dateMap["day"]!>16?dateMap["month"]!:dateMap["month"]!-1, 16),
    DateTime(dateMap["year"]!, dateMap["day"]!>20?dateMap["month"]!:dateMap["month"]!-1, 20),
  ];

  static final int percentUsersMoreThan30Min = 20;
  static final int percentUsersLessThan30min = -5;
  static final int newUsers = 20;
  static final int allUsers = 1534;
  static Map<String,String> activeUsersWithTime = {
    "0_1":"632",
    "1_2":"123",
    "2_3":"0",
    "3_4":"0",
    "4_5":"2",
    "5_6":"5",
    "6_7":"10",
    "7_8":"12",
    "8_9":"15",
    "9_10":"20",
    "10_11":"80",
    "11_12":"97",
    "12_13":"123",
    "13_14":"403",
    "14_15":"837",
    "15_16":"730",
    "16_17":"750",
    "17_18":"804",
    "18_19":"798",
    "19_20":"678",
    "20_21":"934",
    "21_22":"1232",
    "22_23":"1204",
    "23_0":"800"
  };

  static final usersCountStateWise = {
    "Karnataka":542,
    "Delhi":40,
    "West Bengal":396,
    "New york":204,
    "London":352,
  };
  static final usersCountCountryWise = {
    "India":978,
    "US":204,
    "UK":352,
  };

  static Map<String,double> monthlyRequests = {
    "jan":200,
    "feb":230,
    "mar":150,
    "apr":340,
    "may":450,
    "jun":580,
    "jul":870,
    "aug":1230,
    "sep":2340,
    "oct":3450,
    "nov":5670,
    "dec":9890,
  };

  static Map<String,int> ageDistribution={
    "0_17":26,
    "18_35":42,
    "36_59":20,
    "60+":12,
  };
}
