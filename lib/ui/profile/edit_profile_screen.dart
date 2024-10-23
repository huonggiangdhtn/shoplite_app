// ignore: file_names
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:shopping/constants/constant.dart';
import 'package:shopping/constants/size_config.dart';
import 'package:shopping/ui/home/home_screen.dart';

import '../../constants/widget_utils.dart';
import '../../constants/color_data.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _EditProfileScreen();
  }
}

class _EditProfileScreen extends State<EditProfileScreen> {
  _requestPop() {
    Constant.backToFinish(context);
  }

  TextEditingController fNameCont = TextEditingController(text: "Jennie");
  TextEditingController lNameCont = TextEditingController(text: "Winget");
  TextEditingController emailCont = TextEditingController(text: "jenniewinget@gmail.com");
  TextEditingController conCont = TextEditingController(text: "+9196356 85566");

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
                // Expanded(child:   Column(
                //   children: [
                //     getDefaultHeader(context, "Profile", () {
                //       _requestPop();
                //     }, (value) {}, isShowSearch: false),
                //     getSpace(appBarPadding),
                //     Container(
                //         width: imgHeight,
                //         height: imgHeight,
                //         decoration: BoxDecoration(
                //             shape: BoxShape.circle,
                //             image: DecorationImage(
                //                 image: AssetImage(
                //                     Constant.assetImagePath + "Profile.png"),
                //                 fit: BoxFit.cover))),
                //     // Expanded(
                //     //   child: Wrap(
                //     //      spacing: 5,
                //     //     // clipBehavior: Clip.hardEdge,
                //     //     children: [
                //     //       Container(
                //     //         // clipBehavior: Clip.antiAlias,
                //     //         margin: EdgeInsets.only(
                //     //             left: appBarPadding,
                //     //             right: appBarPadding,
                //     //             top: appBarPadding,
                //     //               ),
                //     //         padding: EdgeInsets.symmetric(
                //     //             horizontal: appBarPadding,
                //     //             vertical: appBarPadding),
                //     //         decoration: ShapeDecoration(
                //     //             color: cardColor,
                //     //             shape: SmoothRectangleBorder(
                //     //                 borderRadius: SmoothBorderRadius(
                //     //                     cornerRadius: Constant.getPercentSize(
                //     //                         screenHeight, 2),
                //     //                     cornerSmoothing: 0.5))),
                //     //         child: ListView(
                //     //           shrinkWrap: true,
                //     //           primary: true,
                //     //           children: [
                //     //             getRowWidget(
                //     //                 "First Name", "Jennie", "Document.svg"),
                //     //             getSeparateDivider(),
                //     //             getRowWidget(
                //     //                 "Last Name", "Winget", "Document.svg"),
                //     //             getSeparateDivider(),
                //     //             getRowWidget("Email", "jenniewinget@gmail.com",
                //     //                 "email.svg"),
                //     //             getSeparateDivider(),
                //     //             getRowWidget("Phone Number", "+91 96356 85566",
                //     //                 "Call_Calling.svg"),
                //     //             getSeparateDivider(),
                //     //             getRowWidget("Phone Number", "+91 96356 85566",
                //     //                 "Call_Calling.svg"),                                getSeparateDivider(),
                //     //             getRowWidget("Phone Number", "+91 96356 85566",
                //     //                 "Call_Calling.svg"),
                //     //           ],
                //     //         ),
                //     //       )
                //     //     ],
                //     //   ),
                //     //   flex: 1,
                //     // ),
                //     Expanded(
                //         child: SingleChildScrollView(
                //           child: Container(
                //                   margin: EdgeInsets.only(
                //                     left: appBarPadding,
                //                     right: appBarPadding,
                //                     top: appBarPadding,
                //                   ),
                //                   padding: EdgeInsets.symmetric(
                //                       horizontal: appBarPadding, vertical: appBarPadding),
                //                   decoration: ShapeDecoration(
                //                       color: cardColor,
                //                       shape: SmoothRectangleBorder(
                //                           borderRadius: SmoothBorderRadius(
                //                               cornerRadius:
                //                               Constant.getPercentSize(screenHeight, 2),
                //                               cornerSmoothing: 0.5))),
                //
                //                   child: Column(
                //                     // shrinkWrap: true,
                //                     // primary: true,
                //                     children: [
                //                       getRowWidget("First Name", "Jennie", "Document.svg"),
                //                       getSeparateDivider(),
                //                       getRowWidget("Last Name", "Winget", "Document.svg"),
                //                       getSeparateDivider(),
                //                       getRowWidget(
                //                           "Email", "jenniewinget@gmail.com", "email.svg"),
                //                       getSeparateDivider(),
                //                       getRowWidget("Phone Number", "+91 96356 85566",
                //                           "Call_Calling.svg"),
                //                       // getSeparateDivider(),
                //                       // getRowWidget("Phone Number", "+91 96356 85566",
                //                       //     "Call_Calling.svg"), getSeparateDivider(),
                //                       // getRowWidget("Phone Number", "+91 96356 85566",
                //                       //     "Call_Calling.svg"),
                //                     ],
                //                   ),
                //                 ),
                //         )
                //     )
                //
                //   ],
                // ),flex: 1,),
                getDefaultHeader(context, "Edit Profile", () {
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
                        padding: EdgeInsets.symmetric(
                            horizontal: appBarPadding,
                            vertical: appBarPadding),
                        decoration: ShapeDecoration(
                            color: cardColor,
                            shape: SmoothRectangleBorder(
                                borderRadius: SmoothBorderRadius(
                                    cornerRadius: Constant.getPercentSize(
                                        screenHeight, 2),
                                    cornerSmoothing: 0.5))),
                        child: Column(
                          children: [
                            getDefaultTextFiledWithoutIconWidget(
                                context, "First Name", fNameCont,
                                withPrefix: true, imgName: "Document.svg"),
                            getDefaultTextFiledWithoutIconWidget(
                                context, "Last Name", lNameCont,
                                withPrefix: true, imgName: "Document.svg"),
                            getDefaultTextFiledWithoutIconWidget(
                                context, "Email", emailCont,
                                withPrefix: true, imgName: "email.svg"),
                            getDefaultTextFiledWithoutIconWidget(
                                context, "Phone No", conCont,
                                withPrefix: true, imgName: "Call_Calling.svg"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  flex: 1,
                ),
                getButton(primaryColor, true, "Save", Colors.white,
                    () {
                  Constant.sendToScreen(HomeScreen(), context);
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

  Widget getDefaultTextFiledWithoutIconWidget(BuildContext context, String s,
      TextEditingController textEditingController,
      {bool withPrefix = false, String imgName = ""}) {
    double height = getEditHeight();

    double radius = Constant.getPercentSize(height, 20);
    double fontSize = Constant.getPercentSize(height, 30);
    FocusNode myFocusNode = FocusNode();
    bool isAutoFocus = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          height: height,
          margin: EdgeInsets.symmetric(
              vertical: Constant.getHeightPercentSize(1.2)),
          padding: EdgeInsets.symmetric(
              horizontal: Constant.getWidthPercentSize(2.5)),
          alignment: Alignment.centerLeft,
          decoration: ShapeDecoration(
            color: Colors.transparent,
            shape: SmoothRectangleBorder(
              side: BorderSide(
                  color: isAutoFocus ? primaryColor : Colors.grey.shade400,
                  width: 1),
              borderRadius: SmoothBorderRadius(
                cornerRadius: radius,
                cornerSmoothing: 0.8,
              ),
            ),
          ),
          child: Focus(
            onFocusChange: (hasFocus) {
              if (hasFocus) {
                setState(() {
                  isAutoFocus = true;
                  myFocusNode.canRequestFocus = true;
                });
              } else {
                setState(() {
                  isAutoFocus = false;
                  myFocusNode.canRequestFocus = false;
                });
              }
            },
            child: TextField(
              maxLines: 1,
              controller: textEditingController,
              autofocus: false,
              focusNode: myFocusNode,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                  fontFamily: Constant.fontsFamily,
                  color: fontBlack,
                  fontWeight: FontWeight.w500,
                  fontSize: fontSize),
              decoration: InputDecoration(
                  prefixIcon: (withPrefix)
                      ? Padding(
                          padding: EdgeInsets.only(
                              right: Constant.getWidthPercentSize(2.5)),
                          child: getSvgImage(
                              imgName, Constant.getPercentSize(height, 40)),
                        )
                      : const SizedBox(
                          width: 0,
                          height: 0,
                        ),
                  border: InputBorder.none,
                  isDense: true,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: s,
                  prefixIconConstraints:
                      const BoxConstraints(minHeight: 0, minWidth: 0),
                  hintStyle: TextStyle(
                      fontFamily: Constant.fontsFamily,
                      color: greyFont,
                      fontWeight: FontWeight.w400,
                      fontSize: fontSize)),
            ),
          ),
        );
      },
    );
  }
}
