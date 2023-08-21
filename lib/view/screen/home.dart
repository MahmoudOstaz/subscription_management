import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subscription_management/controllers/MenuAppController.dart';
import 'package:subscription_management/core/responsive.dart';
import 'package:subscription_management/view/screen/dashboard.dart';
import 'package:subscription_management/view/widget/menu/sideMenu.dart';

class Home extends StatelessWidget {
    Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: context.read<MenuAppController>().scaffoldKey,
        drawer: SideMenu(),
        body: SafeArea(
            child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (Responsive.isDesktop(context)) Expanded(child: SideMenu()),
        Expanded(flex: 5, child: Dashboard()),
      ],
    )));
  }
}
