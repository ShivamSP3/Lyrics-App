import 'package:flutter/cupertino.dart';

Widget title(String name ){
  return Padding(
         padding: const EdgeInsetsDirectional.only(start: 10),
         child: Text(name, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
        );
}
Widget content(String name ){
  return Padding(
             padding: const EdgeInsetsDirectional.only(start: 10),
             child: Text(name,
              style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
             );
}