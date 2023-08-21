import 'package:flutter/material.dart';
import 'package:subscription_management/core/constants.dart';
import 'package:subscription_management/core/responsive.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      margin: const EdgeInsets.only(left: defaultPadding),
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.white10)),
      child: Row(children: [
        Image.asset("assets/images/profile_pic.png", height: 38),
        if (!Responsive.isMobile(context))
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            child: Text("Angelina Jolie".toUpperCase()),
          ),
        const Icon(Icons.keyboard_arrow_down_outlined)
      ]),
    );
  }
}
