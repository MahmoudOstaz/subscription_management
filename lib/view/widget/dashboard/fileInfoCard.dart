import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:subscription_management/core/constants.dart';
import 'package:subscription_management/models/MyFiles.dart';
import 'package:subscription_management/view/widget/dashboard/progressLine.dart';

class FileInfoCard extends StatelessWidget {
  const FileInfoCard({super.key, required this.info});

  final CloudStorageInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              padding: EdgeInsets.all(defaultPadding * 0.75),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: info.color.withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: SvgPicture.asset(info.svgSrc, color: info.color),
            ),
            Icon(Icons.more_vert, color: Colors.white54)
          ]),
          Text(info.title, maxLines: 1, overflow: TextOverflow.ellipsis),
          ProgressLine(color: info.color, percentage: info.percentage),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            Text(
              "${info.numOfFiels} Files",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.white70),
            ),
            Text(
              info.totalStorage,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.white70),
            )
          ])
        ],
      ),
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({super.key,  this.crossAxisCount=4,  this.childAspectRatio=1});

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: demoMyFiels.length,
        gridDelegate:
         SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding,
            childAspectRatio: childAspectRatio,
         ),
        itemBuilder: (context, index) =>
            FileInfoCard(info: demoMyFiels[index]));
  }
}

