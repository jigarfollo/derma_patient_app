import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../protobuf_packets/follo.pb.dart';
import '../../utils/color_utils.dart';
import '../../utils/image_constants_utils.dart';
import '../../utils/math_utils.dart';
import '../../utils/profile_details_widget.dart';
import '../../utils/text_utils.dart';

class DoctorProfileScreen extends StatelessWidget {
  static const String route = "DoctorProfileScreen";
  const DoctorProfileScreen({Key key, @required this.caregiverInfo}) : super(key: key);

  /// Kept as dynamic because Type refers between [DrInfo] and [DoctorInfoResponse]
  final dynamic caregiverInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.backgroundGreyColor,
      body: Column(children: [
        Stack(
          children: [
            Container(
              height: screenHeight(context) * 0.36,
              decoration: BoxDecoration(
                color: ColorUtils.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(getSize(30.0)),
                  bottomRight: Radius.circular(getSize(30.0)),
                ),
              ),
            ),
            Image.asset(
              ImageConstants.backgroundMaskLarge,
              height: screenHeight(context) * 0.36,
              width: screenWidth(context),
              fit: BoxFit.cover,
            ),
            Container(
              height: screenHeight(context) * 0.36,
              padding: EdgeInsets.symmetric(horizontal: getSize(16)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          left: 0,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.white,
                              size: getSize(22),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        SizedBox(
                          width: getSize(104),
                          height: getSize(104),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: caregiverInfo.profilePicture.url != null && caregiverInfo.profilePicture.url.isNotEmpty
                                ? CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: caregiverInfo.profilePicture.url,
                                    placeholder: (context, url) => CupertinoActivityIndicator(),
                                    errorWidget: (context, url, error) => new Icon(Icons.error),
                                  )
                                : Image.asset(ImageConstants.doctor, fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: getSize(12)),
                  Text(
                    caregiverInfo.name,
                    textAlign: TextAlign.left,
                    style: TextUtils.semiBoldPoppinsStyle.copyWith(
                      color: ColorUtils.secondaryColor,
                      fontSize: getFontSize(15.0),
                    ),
                  ),
                  Text(
                    caregiverInfo.qualifications.isEmpty ? '-' : caregiverInfo.qualifications,
                    textAlign: TextAlign.left,
                    style: TextUtils.regularPoppinsStyle.copyWith(
                      color: ColorUtils.titleTextColorWhite,
                      fontSize: getFontSize(11.0),
                    ),
                  ),
                  SizedBox(height: getSize(5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ImageConstants.dial, color: ColorUtils.secondaryColor, width: 15),
                      Text(
                        caregiverInfo.mobileNumber,
                        textAlign: TextAlign.left,
                        style: TextUtils.regularPoppinsStyle.copyWith(
                          color: ColorUtils.titleTextColorWhite,
                          fontSize: getFontSize(11.0),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: getSize(16),
              vertical: getSize(12),
            ),
            children: [
              ProfileDetailWidget(
                title: 'About ${caregiverInfo.name}',
                description: caregiverInfo.about.isEmpty ? '-' : caregiverInfo.about,
              ),
              ProfileDetailWidget(
                title: 'Licence Number',
                description: caregiverInfo.licenseNumber.toString().isEmpty ? '-' : caregiverInfo.licenseNumber,
              ),
              ProfileDetailWidget(
                title: 'Specialities',
                multiLineText: [
                  if (caregiverInfo.specialities.isNotEmpty)
                    for (var speciality in caregiverInfo.specialities) '- ${speciality.name}'
                  else
                    '-'
                ],
              ),
              ProfileDetailWidget(
                title: 'Experience',
                description: '${caregiverInfo.experience.toString().isEmpty ? '0' : caregiverInfo.experience} years',
              ),
              ProfileDetailWidget(
                title: 'Email',
                description: caregiverInfo.email.isEmpty ? '-' : caregiverInfo.email,
              ),
              ProfileDetailWidget(
                title: 'Address',
                description: caregiverInfo.address.isEmpty ? '-' : caregiverInfo.address,
              ),
              ProfileDetailWidget(
                title: 'Languages',
                multiLineText: [
                  if (caregiverInfo.languages.isNotEmpty)
                    for (var language in caregiverInfo.languages) '- ${language.name}'
                  else
                    '-'
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
