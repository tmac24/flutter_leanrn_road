import 'package:flutter/material.dart';

class RadiusImg {
  static Widget get(String imgUrl, double imgW,
      {required double imgH,
      required Color shadowColor,
      required double elevation,
      double radius = 6.0,
      required RoundedRectangleBorder shape}) {
    if (shadowColor == null) {
      shadowColor = Colors.transparent;
    }
    return Card(
      //影音海报
      shape: shape,
      color: shadowColor,
      clipBehavior: Clip.antiAlias,
      elevation: elevation == null ? 0.0 : 5.0,
      child: imgW == null
          ? Image.network(
              imgUrl,
              height: imgH,
              fit: BoxFit.cover,
            )
          : Image.network(
              imgUrl,
              width: imgW,
              height: imgH,
              fit: imgH == null ? BoxFit.contain : BoxFit.cover,
            ),
    );
  }
}
