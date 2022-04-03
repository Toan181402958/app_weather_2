import 'package:app_weather_2/contains.dart';
import 'package:flutter/material.dart';

Widget weatherInformation(
    String temp, String day, String tempMax, String tempMin, String image) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '$temp°',
          style: tempStyle,
        ),
        Text(
          day,
          style: dayStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(text: '$tempMax°', style: tempMaxMinStyle),
              const WidgetSpan(
                  child: Icon(
                Icons.arrow_drop_up_rounded,
                color: Colors.white,
              ))
            ])),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Image.network(image,
                  width: 120, height: 120, fit: BoxFit.fill),
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(text: '$tempMin°', style: tempMaxMinStyle),
              const WidgetSpan(
                  child: Icon(
                Icons.arrow_drop_down_rounded,
                color: Colors.white,
              ))
            ])),
          ],
        )
      ],
    ),
  );
}
