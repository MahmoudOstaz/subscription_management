import 'package:flutter/material.dart';
import 'package:subscription_management/core/constants.dart';
import 'package:subscription_management/view/widget/dashboard/chart.dart';
import 'package:subscription_management/view/widget/dashboard/storageInfoCard.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child:  const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Storage Details",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w500)),
          SizedBox(width: defaultPadding),
          Chart(),
          StorageInfoCard(
              title: "Documents Files",
              svgSrc: "assets/icons/Documents.svg",
              amountOfFiles: "1.3GB",
              numOfFiles: 1328),
          StorageInfoCard(
              title: "Media Files",
              svgSrc: "assets/icons/media.svg",
              amountOfFiles: "15.3GB",
              numOfFiles: 1328),
          StorageInfoCard(
              title: "Other Files",
              svgSrc: "assets/icons/folder.svg",
              amountOfFiles: "1.3GB",
              numOfFiles: 1328),
          StorageInfoCard(
              title: "Unknown",
              svgSrc: "assets/icons/unknown.svg",
              amountOfFiles: "1.7GB",
              numOfFiles: 140),
        ],
      ),
    );
  }
}
