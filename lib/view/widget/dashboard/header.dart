import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subscription_management/controllers/MenuAppController.dart';
import 'package:subscription_management/core/responsive.dart';
import 'package:subscription_management/view/widget/dashboard/profileCard.dart';
import 'package:subscription_management/view/widget/dashboard/searchTextField.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (!Responsive.isDesktop(context))
        IconButton(
            icon: Icon(Icons.menu_rounded),
            onPressed: () {
              context.read<MenuAppController>().controlMenu();
            }),
      if (!Responsive.isMobile(context))
        Text("Dashboard", style: Theme.of(context).textTheme.titleLarge),
      if (!Responsive.isMobile(context))
        Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
      const Expanded(child: SearchTextField()),
      const ProfileCard()
    ]);
  }
}
