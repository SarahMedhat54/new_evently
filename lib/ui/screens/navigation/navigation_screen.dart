import 'package:evently_c17/ui/screens/navigation/tabs/favorite/favorite_tab.dart';
import 'package:evently_c17/ui/screens/navigation/tabs/home/home_tab.dart';
import 'package:evently_c17/ui/screens/navigation/tabs/profile/profile_tab.dart';
import 'package:evently_c17/ui/utils/app_colors.dart';
import 'package:evently_c17/ui/utils/app_routes.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  var selectedIndex = 0;
  List<Widget> tabs = [HomeTab(), FavoriteTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: buildFAB(),
        body: tabs[selectedIndex],
        bottomNavigationBar: buildBottomNavigation(),
      ),
    );
  }

  FloatingActionButton buildFAB() {
    return FloatingActionButton(
        onPressed: () {
          Navigator.push(context, AppRoutes.addEvent);
        },
        shape: CircleBorder(),
        backgroundColor: AppColors.blue,
        child: Icon(Icons.add, color: AppColors.white,),
      );
  }

  buildBottomNavigation() => Theme(
    data: ThemeData(canvasColor: AppColors.white),
    child: BottomNavigationBar(
      selectedItemColor: AppColors.blue,
      unselectedItemColor: AppColors.grey2,
      currentIndex: selectedIndex,
      onTap: (newIndex) {
        selectedIndex = newIndex;
        setState(() {});
      },
      items: [
        buildNavBarItem(Icons.home, "Home"),
        buildNavBarItem(Icons.favorite_border, "Favorite"),
        buildNavBarItem(Icons.person, "Profile"),
      ],
    ),
  );

  BottomNavigationBarItem buildNavBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
