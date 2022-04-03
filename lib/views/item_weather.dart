import 'package:app_weather_2/contains.dart';
import 'package:flutter/material.dart';

Widget itemWeather(String date, String image, double tempMax, double tempMin) {
  return Container(
    alignment: Alignment.center,
    height: 180,
    width: 160,
    decoration: BoxDecoration(
      border:  Border.all(color: Colors.white, width: 2),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(date, style: dateItemStyle),
        Image.network(image, width: 80, height: 80, fit: BoxFit.fill),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
                text: TextSpan(children: [
                  TextSpan(text: '$tempMax', style: tempMaxMinItemStyle),
                  const WidgetSpan(child: Icon(Icons.arrow_drop_up_rounded, color: Colors.white,))
                ])),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: RichText(
                  text: TextSpan(children: [
                    TextSpan(text: '$tempMin', style: tempMaxMinItemStyle),
                    const WidgetSpan(child: Icon(Icons.arrow_drop_down_rounded, color: Colors.white,))
                  ])),
            ),
          ],
        )
      ],
    ),
  );
}
