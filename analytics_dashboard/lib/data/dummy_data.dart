// import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DummyData {
  static Map<String,int> getCurrentDate() {
    DateTime now = DateTime.now();
    Map<String,int>m={"year":2025,"month":4,"day":29};
    m = {"year":int.parse(DateFormat('y').format(now)),"month":int.parse(DateFormat('M').format(now)),"day":int.parse(DateFormat('d').format(now))};
    return m;
  }
  // DummyData d = DummyData();
  static Map<String,int>dateMap = DummyData.getCurrentDate();
  // dateMap["day"]!>
  static List<dynamic> new0to20 = [
    DateTime(dateMap["year"]!, dateMap["day"]!>28?dateMap["month"]!:dateMap["month"]!-1, 28),
    DateTime(dateMap["year"]!, dateMap["day"]!>9?dateMap["month"]!:dateMap["month"]!-1, 9),
    DateTime(dateMap["year"]!, dateMap["day"]!>12?dateMap["month"]!:dateMap["month"]!-1, 12),
    DateTime(dateMap["year"]!, dateMap["day"]!>22?dateMap["month"]!:dateMap["month"]!-1, 22),
    DateTime(dateMap["year"]!, dateMap["day"]!>24?dateMap["month"]!:dateMap["month"]!-1, 24),
  ];

  static List<dynamic> new20to100 = [
    DateTime(dateMap["year"]!, dateMap["day"]!>10?dateMap["month"]!:dateMap["month"]!-1, 10),
    DateTime(dateMap["year"]!, dateMap["day"]!>14?dateMap["month"]!:dateMap["month"]!-1, 14),
    DateTime(dateMap["year"]!, dateMap["day"]!>3?dateMap["month"]!:dateMap["month"]!-1, 3),
  ];

  static List<dynamic> new100andMore = [
    DateTime(dateMap["year"]!, dateMap["day"]!>11?dateMap["month"]!:dateMap["month"]!-1, 11),
    DateTime(dateMap["year"]!, dateMap["day"]!>16?dateMap["month"]!:dateMap["month"]!-1, 16),
    DateTime(dateMap["year"]!, dateMap["day"]!>20?dateMap["month"]!:dateMap["month"]!-1, 20),
  ];

  static double percentUsersMoreThan30Min = 20;
  static double percentUsersLessThan30min = -5;
  static double newUsers = 20;
  static double allUsers = 1534;
  // static double percentUsersMoreThan30Min = 0;
  // static double percentUsersLessThan30min = 0;
  // static double newUsers = 0;
  // static double allUsers = 0;
  static Map<String,dynamic> activeUsersWithTime = {
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

  static Map<String,dynamic> usersCountStateWise = {
    "Karnataka":542,
    "Delhi":40,
    "West Bengal":396,
    "New york":204,
    "London":352,
  };
  static Map<String,dynamic> usersCountCountryWise = {
    "India":978,
    "US":204,
    "UK":352,
  };

  static Map<String,dynamic> monthlyRequests = {
    "jan":200,
    "feb":230,
    "mar":150,
    "apr":340,
    "may":450,
    "jun":580,
    "jul":730,
    "aug":803,
    "sep":892,
    "oct":995,
    "nov":989,
    "dec":1132,
  };

  static Map<String,dynamic> ageDistribution={
    "0_17":26,
    "18_35":42,
    "36_59":20,
    "60+":12,
  };
  Future<int> fetchAllData()async{
    var db = FirebaseFirestore.instance;
    var snapshot = await db.collection("LinkifyData").get();
    if(snapshot.docs.length==0){
      return 0;
    }
    var m = snapshot.docs[0];
    // print(m.data());
    // if(m.data()=={}){
    //   return 0;
    // }

    allUsers = m["allUsers"]!=null?m["allUsers"]:allUsers;
    new0to20 = m["new0to20"]!=null?m["new0to20"]:new0to20;
    new20to100 = m["new20to100"]!=null?m["new20to100"]:new20to100;
    new100andMore = m["new100andMore"]!=null?m["new100andMore"]:new100andMore;
    percentUsersMoreThan30Min =  m["percentUsersMoreThan30Min"]!=null?m["percentUsersMoreThan30Min"]:percentUsersMoreThan30Min;
    percentUsersLessThan30min = m["percentUsersLessThan30min"]!=null?m["percentUsersLessThan30min"]:percentUsersLessThan30min;
    newUsers = m["newUsers"]!=null?m["newUsers"]:newUsers;
    allUsers = m["allUsers"]!=null?m["allUsers"]:allUsers;
    activeUsersWithTime = m["activeUsersWithTime"]!=null?m["activeUsersWithTime"]:activeUsersWithTime;
    usersCountStateWise = m["usersCountStateWise"]!=null?m["usersCountStateWise"]:usersCountStateWise;
    usersCountCountryWise = m["usersCountCountryWise"]!=null?m["usersCountCountryWise"]:usersCountCountryWise;
    monthlyRequests = m["monthlyRequests"]!=null?m["monthlyRequests"]:monthlyRequests;
    ageDistribution = m["ageDistribution"]!=null?m["ageDistribution"]:ageDistribution;
    // print("All Users: $allUsers");
    return 0;
  }
  Future<void> refreshData()async{
    var db = FirebaseFirestore.instance;
    await db
    .collection("LinkifyData")
    .doc("Linkify")
    .set({});
    // return;
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
}
