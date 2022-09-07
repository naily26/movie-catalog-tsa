import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movie_catalog_app/service/http_service.dart';
import '../service/http_service.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late int moviesCount;
  late List movies;
  late HttpService service;

  Future initialize() async {
    movies = [];
    movies = (await service.getPopularMovies())!;
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    service.getPopularMovies().then((value) => {
      setState(() {
        result = value;
      })
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
      ),
      body: Container(
        child: Text(result),
      ),
    );
  }
}