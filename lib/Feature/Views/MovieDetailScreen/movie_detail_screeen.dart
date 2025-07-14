import 'package:flutter/material.dart';
import 'package:movie_app/Feature/widgets/custome_tab.dart';
import 'package:movie_app/Feature/widgets/movie_detail_tab.dart';
import 'package:movie_app/constant.dart';

class MovieDetailScreeen extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const MovieDetailScreeen({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(title)),
        backgroundColor: kBackgroundColor,
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 250,
                  width: double.infinity,
                ),
                Positioned(
                  bottom: -90,
                  left: 20,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(imageUrl, width: 95),
                          ),
                          SizedBox(width: 20),
                          Padding(
                            padding: const EdgeInsets.only(top: 70),
                            child: SizedBox(
                              width: 250,
                              child: Text(
                                title,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 90),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_today, color: kInActiveColor, size: 16),
                    SizedBox(width: 10),
                    Text(
                      "2025",
                      style: TextStyle(color: kInActiveColor, fontSize: 12),
                    ),
                    SizedBox(width: 10),
                    Text("|", style: TextStyle(color: kInActiveColor)),
                  ],
                ),
                SizedBox(width: 10),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_outlined,
                      color: kInActiveColor,
                      size: 16,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "148 Minutes",
                      style: TextStyle(color: kInActiveColor, fontSize: 12),
                    ),
                    SizedBox(width: 10),
                    Text("|", style: TextStyle(color: kInActiveColor)),
                  ],
                ),
                SizedBox(width: 10),
                Row(
                  children: [
                    Icon(Icons.category, color: kInActiveColor, size: 16),
                    SizedBox(width: 10),
                    Text(
                      "Action",
                      style: TextStyle(color: kInActiveColor, fontSize: 12),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            MovieDetailTabs(description: description),
          ],
        ),
      ),
    );
  }
}
