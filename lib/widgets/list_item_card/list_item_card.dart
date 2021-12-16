import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:formletics/common/themes/app_colors.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';

class ListItemCard extends StatelessWidget {
  final double aspectRatio;
  final Icon topLeftIcon;
  final Icon topRightIcon;
  final String title;
  final String subtitle;
  final EdgeInsets padding;
  final VoidCallback onTap;
  final String photoUrl;

  const ListItemCard({
    @required this.title,
    @required this.aspectRatio,
    @required this.photoUrl,
    this.subtitle = '',
    this.topLeftIcon,
    this.topRightIcon,
    this.padding = const EdgeInsets.only(left: 5, right: 5),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: onTap,
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: GFImageOverlay(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.20), BlendMode.darken),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            image: CachedNetworkImageProvider(photoUrl),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        // ignore: sized_box_for_whitespace
                        child: topLeftIcon ??
                            Container(
                              width: 0.1,
                              height: 0.1,
                            ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        // ignore: sized_box_for_whitespace
                        child: topRightIcon ??
                            Container(
                              width: 0.1,
                              height: 0.1,
                            ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        //ln(context, 'sample_gym'),
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (subtitle != '')
                        Text(
                          //ln(context, 'sport_halls'),
                          subtitle,
                          style: TextStyle(
                            color: AppColors.subtitleColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
