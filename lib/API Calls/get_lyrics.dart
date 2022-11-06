// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http ;
import 'package:lyrics_app/Models/detail_model.dart';
import 'package:lyrics_app/Models/lyrics_model.dart';

import '../Pages/lyrics_detail.dart';
var mapResponse;
var lyricResponse;
var detailResponse;

class ApiLyrics extends StatefulWidget {
  const ApiLyrics({super.key});

  @override
  State<ApiLyrics> createState() => _ApiLyricsState();
}
//var index = Get.arguments['index'];
//var indx = musicResponse['body']['track_list'][index.toString()]['track']['track_id'].toString();
//dynamic  tId = Get.arguments['track_id'];

class _ApiLyricsState extends State<ApiLyrics> {
    Future<List<MusicLyr>?> getLyric() async{
        var lurl = Uri.parse('https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=${Get.arguments['track_id']}&apikey=dfdc504fd961a28c26910ec9d3673f25');
        var uri = Uri.parse(lurl.toString());
        http.Response response;
        response = await http.get(uri);
        if(response.statusCode ==200){
          setState(() {
            //  stringResponse = response.body;
              mapResponse = jsonDecode(response.body);
              lyricResponse = mapResponse['message'];
          });
        }
  }
  Future<List<MusicDt>?> getDetail() async{
        var lurl = Uri.parse('https://api.musixmatch.com/ws/1.1/track.get?track_id=${Get.arguments['track_id']}&apikey=dfdc504fd961a28c26910ec9d3673f25');
        var uri = Uri.parse(lurl.toString());
        http.Response response;
        response = await http.get(uri);
        if(response.statusCode ==200){
          setState(() {
            //  stringResponse = response.body;
              mapResponse = jsonDecode(response.body);
              detailResponse = mapResponse['message'];
          });
        }
  }
  List  <MusicLyr> ? lyrics;
  List <MusicDt>? details;
  var isLoaded = false;
   void initState() {
    // TODO: implement initState
    //checkRTConnectivity();
    getData();
    super.initState();
  }

  getData()async{
      lyrics = await getLyric();
      details = await getDetail();
      if(lyrics != null){
        setState(() {
          isLoaded = true;
        });
      }}
  @override
  Widget build(BuildContext context) {
    return  DetailsPage()
    ;
  }
}