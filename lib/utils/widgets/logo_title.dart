import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:follo_patient_app/utils/color_utils.dart';
import 'package:follo_patient_app/utils/image_constants_utils.dart';
import 'package:follo_patient_app/utils/math_utils.dart';
import 'package:follo_patient_app/utils/text_utils.dart';

class LogoTitle extends StatelessWidget {
  const LogoTitle({
    Key key,
    @required this.imagePath,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);

  final String imagePath;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: imagePath != null && imagePath.isNotEmpty
                  ? CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: imagePath,
                      placeholder: (context, url) => CupertinoActivityIndicator(),
                      errorWidget: (context, url, error) => new Icon(Icons.error),
                    )
                  : Image.asset(ImageConstants.doctor, fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: getSize(8)),
          Text(
            title,
            style: TextUtils.semiBoldPoppinsStyle.copyWith(
              fontSize: getFontSize(11),
              color: ColorUtils.primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
