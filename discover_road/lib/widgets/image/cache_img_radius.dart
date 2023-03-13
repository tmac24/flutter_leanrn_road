//import 'package:doubanapp/widgets/image/cached_network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

typedef OnTab = void Function();

class CacheImgRadius extends StatelessWidget {
  final String imgUrl;
  final double radius;
  final OnTab onTab;
  CacheImgRadius(
      {Key? key,
      required this.imgUrl,
      required this.radius,
      required this.onTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: CachedNetworkImage(imageUrl: imgUrl),
      ),
      onTap: () {
        onTab();
      },
    );
  }
}

Widget gmAvatar(
  String url, {
  double width = 30,
  double? height,
  BoxFit? fit,
  BorderRadius? borderRadius,
}) {
  var placeholder = Image.asset("imgs/avatar-default.png", //头像占位图
      width: width,
      height: height);
  return ClipRRect(
    borderRadius: borderRadius ?? BorderRadius.circular(2),
    child: CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => placeholder,
      errorWidget: (context, url, error) => placeholder,
    ),
  );
}
