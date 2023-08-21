import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:subscription_management/core/constants.dart';
import 'package:subscription_management/core/responsive.dart';
import 'package:subscription_management/models/MyFiles.dart';
import 'package:subscription_management/models/RecentFile.dart';
import 'package:subscription_management/view/widget/dashboard/fileInfoCard.dart';
import 'package:subscription_management/view/widget/dashboard/header.dart';
import 'package:subscription_management/view/widget/dashboard/recentFiles.dart';
import 'package:subscription_management/view/widget/dashboard/storageDetails.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
          primary: false,
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Header(),
              const SizedBox(height: defaultPadding),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(
                    flex: 5,
                    child: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("My Files",
                                style: Theme.of(context).textTheme.titleMedium),
                            ElevatedButton.icon(
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: defaultPadding * 1.5,
                                        vertical: defaultPadding /
                                            (Responsive.isMobile(context)
                                                ? 2
                                                : 1))),
                                onPressed: () {},
                                icon: const Icon(Icons.add),
                                label: const Text("Add New"))
                          ]),
                      const SizedBox(height: defaultPadding),
                      Responsive(
                          mobile: FileInfoCardGridView(
                              crossAxisCount: _size.width < 650 ? 2 : 4,
                              childAspectRatio: _size.width < 650 ? 1.3 : 1),
                          tablet: FileInfoCardGridView(),
                          desktop: FileInfoCardGridView(
                            childAspectRatio: _size.width < 1400 ? 1.1 : 1,
                          )),
                      const SizedBox(height: defaultPadding),
                      RecentFiles(),
                      if (Responsive.isMobile(context))
                        const SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) StorageDetails(),
                    ])),
                if (!Responsive.isMobile(context))
                  const SizedBox(width: defaultPadding),
                if (!Responsive.isMobile(context))
                  const Expanded(flex: 2, child: StorageDetails()),
              ])
            ],
          )),
    );
  }
}

DataRow recentFileDataRow(RecentFile fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              fileInfo.icon,
              height: 30,
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fileInfo.title),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.date)),
      DataCell(Text(fileInfo.size)),
    ],
  );
}
