import 'package:flutter/material.dart';
import 'package:flutterproject/tabPages/home_tab.dart';
import 'package:flutterproject/tabPages/profile_tab.dart';
import 'package:flutterproject/tabPages/trip_history_tab.dart';
import 'package:flutterproject/widgets/nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;

  onItemClicked(int index){
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Ride-Share'),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [
          HomeTabPage(),
          TripHistoryTabPage(),
          ProfileTabPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: "Trip History",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 14),
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemClicked,
      ),
    );
  }
}

