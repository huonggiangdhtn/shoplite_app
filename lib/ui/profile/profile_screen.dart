import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:shoplite/constants/constant.dart';
import 'package:shoplite/constants/size_config.dart';
import 'package:shoplite/ui/profile/edit_profile_screen.dart';

import '../../constants/widget_utils.dart';
import '../../constants/color_data.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProfileScreen();
  }
}

class _ProfileScreen extends State<ProfileScreen> {
  _requestPop() {
    Constant.backToFinish(context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double screenHeight = SizeConfig.safeBlockVertical! * 100;
    double appBarPadding = getAppBarPadding();
    double imgHeight = Constant.getPercentSize(screenHeight, 16);

    return WillPopScope(
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                getDefaultHeader(context, "Profile", () {
                  _requestPop();
                }, (value) {}, isShowSearch: false),
                getSpace(appBarPadding),
                Container(
                    width: imgHeight,
                    height: imgHeight,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                                Constant.assetImagePath + "Profile.png"),
                            fit: BoxFit.cover))),
                // Expanded(
                //   child: Wrap(
                //      spacing: 5,
                //     // clipBehavior: Clip.hardEdge,
                //     children: [
                //       Container(
                //         // clipBehavior: Clip.antiAlias,
                //         margin: EdgeInsets.only(
                //             left: appBarPadding,
                //             right: appBarPadding,
                //             top: appBarPadding,
                //               ),
                //         padding: EdgeInsets.symmetric(
                //             horizontal: appBarPadding,
                //             vertical: appBarPadding),
                //         decoration: ShapeDecoration(
                //             color: cardColor,
                //             shape: SmoothRectangleBorder(
                //                 borderRadius: SmoothBorderRadius(
                //                     cornerRadius: Constant.getPercentSize(
                //                         screenHeight, 2),
                //                     cornerSmoothing: 0.5))),
                //         child: ListView(
                //           shrinkWrap: true,
                //           primary: true,
                //           children: [
                //             getRowWidget(
                //                 "First Name", "Jennie", "Document.svg"),
                //             getSeparateDivider(),
                //             getRowWidget(
                //                 "Last Name", "Winget", "Document.svg"),
                //             getSeparateDivider(),
                //             getRowWidget("Email", "jenniewinget@gmail.com",
                //                 "email.svg"),
                //             getSeparateDivider(),
                //             getRowWidget("Phone Number", "+91 96356 85566",
                //                 "Call_Calling.svg"),
                //             getSeparateDivider(),
                //             getRowWidget("Phone Number", "+91 96356 85566",
                //                 "Call_Calling.svg"),                                getSeparateDivider(),
                //             getRowWidget("Phone Number", "+91 96356 85566",
                //                 "Call_Calling.svg"),
                //           ],
                //         ),
                //       )
                //     ],
                //   ),
                //   flex: 1,
                // ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: appBarPadding,
                      right: appBarPadding,
                      top: appBarPadding,
                    ),
                    child: SingleChildScrollView(
                      child: Container(
                        // margin: EdgeInsets.only(
                        //   left: appBarPadding,
                        //   right: appBarPadding,
                        //   top: appBarPadding,
                        // ),
                        padding: EdgeInsets.symmetric(
                            horizontal: appBarPadding, vertical: appBarPadding),
                        decoration: ShapeDecoration(
                            color: cardColor,
                            shape: SmoothRectangleBorder(
                                borderRadius: SmoothBorderRadius(
                                    cornerRadius: Constant.getPercentSize(
                                        screenHeight, 2),
                                    cornerSmoothing: 0.5))),

                        child: Column(
                          // shrinkWrap: true,
                          // primary: true,
                          children: [
                            getRowWidget(
                                "First Name", "Jennie", "Document.svg"),
                            getSeparateDivider(),
                            getRowWidget("Last Name", "Winget", "Document.svg"),
                            getSeparateDivider(),
                            getRowWidget(
                                "Email", "jenniewinget@gmail.com", "email.svg"),
                            getSeparateDivider(),
                            getRowWidget("Phone Number", "+91 96356 85566",
                                "Call_Calling.svg"),
                            // getSeparateDivider(),
                            // getRowWidget("Phone Number", "+91 96356 85566",
                            //     "Call_Calling.svg"),
                            // getSeparateDivider(),
                            // getRowWidget("Phone Number", "+91 96356 85566",
                            //     "Call_Calling.svg"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  flex: 1,
                ),
                getButton(primaryColor, true, "Edit Profile", Colors.white, () {
                  Constant.sendToScreen(const EditProfileScreen(), context);
                }, FontWeight.w700, EdgeInsets.all(appBarPadding))
              ],
            ),
          ),
        ),
        onWillPop: () async {
          _requestPop();
          return false;
        });
  }

  Widget getSeparateDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getAppBarPadding()),
      child: Divider(
        height: 1,
        color: Colors.grey.shade200,
      ),
    );
  }

  Widget getRowWidget(String title, String desc, String icon) {
    double iconSize = Constant.getHeightPercentSize(3.8);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getSvgImage(icon, iconSize),
        getHorSpace(Constant.getWidthPercentSize(2)),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getCustomText(title, fontBlack, 1, TextAlign.start, FontWeight.w700,
                Constant.getPercentSize(iconSize, 63)),
            getSpace(Constant.getPercentSize(iconSize, 36)),
            getCustomText(desc, greyFont, 1, TextAlign.start, FontWeight.w400,
                Constant.getPercentSize(iconSize, 61)),
          ],
        )
      ],
    );
  }
}
