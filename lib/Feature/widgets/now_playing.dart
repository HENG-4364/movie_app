import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:movie_app/Data/list_movies.dart';
import 'package:movie_app/Feature/Views/MovieDetailScreen/movie_detail_screeen.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({super.key});

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  bool isLoading = true;
  String error = '';
  List<dynamic> movies = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    const url = 'https://api.themoviedb.org/3/movie/now_playing';
    const token =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlZTY4OGQ5NjIxZTgwNWVhNmU3ZTMyMWFjZjcwNTRlMyIsIm5iZiI6MTc1MjE2Mjc2OS45MjIsInN1YiI6IjY4NmZlMWQxMjc2MjBhYjMyZmU4MDk2NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.YF2AFZPJc-KFPLtEzwwW_0CY6PHGwh0RTx2hOirTkCQ';

    final headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          movies = jsonData['results'];
          isLoading = false;
        });
      } else {
        setState(() {
          error = 'Error: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        error = 'Exception: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.white),
      );
    }

    if (error.isNotEmpty) {
      return Center(child: Text(error));
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 12,
        childAspectRatio: 2 / 3,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        final posterPath = movie['poster_path'];
        final imageUrl = 'https://image.tmdb.org/t/p/w500$posterPath';
        final title = movie['original_title'];
        final description = movie['overview'];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => MovieDetailScreeen(
                      title: title,
                      description: description,
                      imageUrl: imageUrl,
                    ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Column(
              children: [
                Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
