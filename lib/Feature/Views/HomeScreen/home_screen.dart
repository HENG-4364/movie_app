import 'package:flutter/material.dart';
import 'package:movie_app/Data/list_movies.dart';
import 'package:movie_app/Feature/widgets/custome_tab.dart';
import 'package:movie_app/constant.dart';
import 'package:dynamic_tabbar/dynamic_tabbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "What do you want to watch?",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search....",
                    filled: true,
                    fillColor: kFieldColor,
                    hintStyle: TextStyle(color: Colors.grey),
                    suffixIcon: Icon(Icons.search),
                    suffixIconColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:
                        ListMovies.map(
                          (movie) => Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(movie['thumbnail']),
                            ),
                          ),
                        ).toList(),
                  ),
                ),
                SizedBox(height: 20),
                MovieTabs()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
