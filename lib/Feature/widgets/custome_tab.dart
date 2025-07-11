import 'package:flutter/material.dart';
import 'package:movie_app/Data/list_movies.dart';
import 'package:movie_app/Feature/Views/MovieDetailScreen/movie_detail_screeen.dart';

class MovieTabs extends StatefulWidget {
  const MovieTabs({super.key});

  @override
  State<MovieTabs> createState() => _MovieTabsState(); // Match class name here
}

class _MovieTabsState extends State<MovieTabs> {
  final List<String> categories = [
    'Now playing',
    'Upcoming',
    'Top rated',
    'Popular',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 48,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  margin: const EdgeInsets.only(right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        categories[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 6),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        height: 3,
                        width: isSelected ? 70 : 0,
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _buildTabContent(),
        ),
      ],
    );
  }

  Widget _buildTabContent() {
    switch (categories[selectedIndex]) {
      case 'Upcoming':
        return const Text('Showing Upcoming movies...');
      case 'Top rated':
        return const Text('Showing Top Rated movies...');
      case 'Popular':
        return const Text('Showing Popular movies...');
      default:
        return Column(
          children: [
            GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 12,
                childAspectRatio: 2 / 3, // Common poster ratio (width:height = 2:3)
              ),
              itemCount: ListMovies.length,
              itemBuilder: (context, index) {
                final movie = ListMovies[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => MovieDetailScreeen(
                        ),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      movie['thumbnail'],
                      fit: BoxFit.cover, // Ensure consistent fill
                    ),
                  ),
                );
              },
            ),

          ],
        );
    }
  }
}
