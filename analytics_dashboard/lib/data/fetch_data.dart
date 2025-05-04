// import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:paracels/models/room.dart';

//In a true app, this would be in a repository to access to backend in all initState with fetch commands

class FetchData {
  static fetchAllData()async{
    var db = FirebaseFirestore.instance;
    // List<dynamic> topThreeGenres = getTopThreeGenres(topGenre);
    await db.collection("LinkifyData").get().then(
      (querySnapshot) {
        print("Successfully completed");
        // print(querySnapshot.docs[0]["new0to20"]);
        new0to20 = querySnapshot.docs[0]["new0to20"];
        new20to100 = querySnapshot.docs[0]["new20to100"];
        new100andMore = querySnapshot.docs[0]["new100andMore"];
        percentUsersMoreThan30Min = querySnapshot.docs[0]["percentUsersMoreThan30Min"];
        percentUsersLessThan30min = querySnapshot.docs[0]["percentUsersLessThan30min"];
        newUsers = querySnapshot.docs[0]["newUsers"];
        allUsers = querySnapshot.docs[0]["allUsers"];
        activeUsersWithTime = querySnapshot.docs[0]["activeUsersWithTime"];
        usersCountStateWise = querySnapshot.docs[0]["usersCountStateWise"];
        usersCountCountryWise = querySnapshot.docs[0]["usersCountCountryWise"];
        monthlyRequests = querySnapshot.docs[0]["monthlyRequests"];
        ageDistribution = querySnapshot.docs[0]["ageDistribution"];
      },
      onError: (e) => print("Error completing: $e"),
    );

  }

  // static Map<String,int> getCurrentDate() {
  //   DateTime now = DateTime.now();
  //   Map<String,int>m={"year":2025,"month":4,"day":29};
  //   m = {"year":int.parse(DateFormat('y').format(now)),"month":int.parse(DateFormat('M').format(now)),"day":int.parse(DateFormat('d').format(now))};
  //   return m;
  // }
  // DummyData d = DummyData();
  // static Map<String,int>dateMap = FetchData.getCurrentDate();
  // dateMap["day"]!>
  static List<DateTime> new0to20=[];

  static List<DateTime> new20to100=[];

  static List<DateTime> new100andMore=[];

  static int percentUsersMoreThan30Min = 0;
  static int percentUsersLessThan30min = 0;
  static int newUsers = 0;
  static int allUsers = 0;
  static Map<String,String> activeUsersWithTime = {};

  static Map<String,int> usersCountStateWise = {};
  static Map<String,int> usersCountCountryWise = {};

  static Map<String,double> monthlyRequests={};

  static Map<String,int> ageDistribution = {};
}
