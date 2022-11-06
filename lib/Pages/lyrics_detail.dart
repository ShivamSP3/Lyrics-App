// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../API Calls/get_lyrics.dart';
import '../Widget/td.dart';
import 'home_page.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
      bool connected = true ;
Connectivity _connectivity = Connectivity();
 void checkRTConnectivity() async{
  _connectivity.onConnectivityChanged.listen((event) {
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
void initState(){
  checkRTConnectivity();
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Track Details"),centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
           Get.to(HomePage());
        },),
      ),
      body:   connected ?  SingleChildScrollView(
        child: detailResponse!=null && detailResponse.length>0  ? Center(
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                    SizedBox(height: 10,),
                    title("Name"),
                    content(detailResponse['body']['track']['track_name'].toString()),
                    SizedBox(height: 10,),
                    title("Artist"),
                    content(detailResponse['body']['track']['artist_name'].toString()),
                    SizedBox(height: 10,),
                    title("Album Name"),
                    content(detailResponse['body']['track']['album_name'].toString()),
                    SizedBox(height: 10,),
                    title("Explicit"),
                    content(detailResponse['body']['track']['explicit'].toString()),
                    SizedBox(height: 10,),
                    title("Rating"),
                    content(detailResponse['body']['track']['track_rating'].toString()),
                    SizedBox(height: 10,),
                    title("Lyrics"),
                    content(lyricResponse['body']['lyrics']['lyrics_body'].toString()),
            ],
          ) 
        ): Center(child: CircularProgressIndicator())
      ) : Center(child: Text("Not Connected With Internet")) 
    );
  }
}