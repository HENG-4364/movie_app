import 'package:flutter/material.dart';
import 'package:movie_app/Feature/Views/HomeScreen/home_screen.dart';
import 'package:movie_app/Feature/Views/SearchScreen/search_screen.dart';
import 'package:movie_app/Feature/Views/WatchList/watch_list_screen.dart';
import 'package:movie_app/constant.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var listScreen = [HomeScreen(),SearchScreen(), WishListScreen()];
    return Scaffold(
      body: listScreen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: kBackgroundColor,
        selectedItemColor: kActiveColor,
        unselectedItemColor: kInActiveColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Watch List",
          ),
        ],
      ),
    );
  }
}
