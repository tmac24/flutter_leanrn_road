import 'package:flutter/material.dart';

///个人中心
class PersonCenterPage extends StatelessWidget {
  const PersonCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: false,
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                // flexibleSpace: elevation,
              )
            ],
          ),
        ),
      ),
    );
  }
}
