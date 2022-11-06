import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../Widget/movie_list.dart';
import '../Models/music_model.dart';

var mapResponse;
var musicResponse;

class ApiCall extends StatefulWidget {
  const ApiCall({super.key});

  @override
  State<ApiCall> createState() => _ApiCallState();
}

class _ApiCallState extends State<ApiCall> {
    bool connected = true;
    late StreamSubscription _streamSubscription;
Connectivity _connectivity = Connectivity();
void checkRTConnectivity() async{
      _streamSubscription  =  _connectivity.onConnectivityChanged.listen((event) {
     if(event == ConnectivityResult.mobile){
           connected = true;
         }else if(event == ConnectivityResult.wifi){
             connected = true;
         }
         else{
             connected = false;
         }
         setState(() {
           
         });
  });   
}
@override dispose(){
  _streamSubscription.cancel();
  super.dispose();
}
  Future<List<MusicL>?> getMusic() async {
    var uri = Uri.parse(
        'https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=dfdc504fd961a28c26910ec9d3673f25');
    http.Response response;
    response = await http.get(uri);
    if (response.statusCode == 200) {
      setState(() {
        //  stringResponse = response.body;
        mapResponse = jsonDecode(response.body);
        musicResponse = mapResponse['message'];
      });
    }
  }

  List<MusicL>? tracks;
  var isLoaded = false;
  void initState() {
  
    // TODO: implement initState
   checkRTConnectivity();
    getData();
    super.initState();

  }

  getData() async {
    tracks = await getMusic();
    if (tracks != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: musicResponse!= null && musicResponse.length > 0 ? Center(
        child: connected ?Center(
          child: ListView.builder(
            itemCount: musicResponse['body']['track_list'].length,
            itemBuilder: (context, index) {
              return MovieList(index);
            },
          ),
        ) : Text("Not Connected With Internet")
      ) : Center(child:CircularProgressIndicator())
      );
  }
}
