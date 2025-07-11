import 'package:flutter/material.dart';
import 'package:movie_app/constant.dart';

class WishListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> watchList = [
    {
      'title': 'Spiderman',
      'thumbnail': 'assets/movies/movie-1.png',
      'rating': 9.5,
      'genre': 'Action',
      'year': 2019,
      'duration': '139 minutes',
    },
    {
      'title': 'Spider-Man: No Way Home',
      'thumbnail': 'assets/movies/movie-2.png',
      'rating': 8.5,
      'genre': 'Action',
      'year': 2021,
      'duration': '139 minutes',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text("Watch list"),
        backgroundColor: kBackgroundColor,
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: watchList.length,
        separatorBuilder: (_, __) => const SizedBox(height: 20),
        itemBuilder: (context, index) {
          final movie = watchList[index];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  movie['thumbnail'],
                  width: 90,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie['title'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.star_border, color: Colors.amber, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          movie['rating'].toString(),
                          style: const TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.local_movies_outlined, color: Colors.grey, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          movie['genre'],
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, color: Colors.grey, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          movie['year'].toString(),
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.access_time, color: Colors.grey, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          movie['duration'],
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
