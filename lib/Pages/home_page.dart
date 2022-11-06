import 'package:flutter/material.dart';
import 'package:lyrics_app/API%20Calls/get_info.dart';
import 'package:lyrics_app/Widget/movie_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
          title: Text("Lyrics App"),centerTitle: true,
          leading: null,
         ),
         body : ApiCall()  
             
    );
  }
}