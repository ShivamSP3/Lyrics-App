// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyrics_app/API%20Calls/get_lyrics.dart';
import '../API Calls/get_info.dart';

Widget MovieList(int ind) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: InkWell(
      onTap: () {
        print("The index is " + ind.toString());
        Get.to(ApiLyrics(), arguments: {
          'index': ind.toString(),
          'track_id': musicResponse['body']['track_list'][ind.toInt()]['track']
                  ['track_id']
              .toString(),
        });
      },
      child: Container(
        height: 100,
        width: 400,
        decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.library_music,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 20,
                  width: 170,
                  child: Text(
                    musicResponse['body']['track_list'][ind]['track']
                            ['track_name']
                        .toString(),
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: Container(
                    width: 170,
                    height: 20,
                    child: Text(
                      musicResponse['body']['track_list'][ind]['track']
                              ['album_name']
                          .toString(),
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                width: 100,
                child: Text(
                  musicResponse['body']['track_list'][ind]['track']
                          ['artist_name']
                      .toString(),
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  maxLines: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
