// ignore: file_names
import 'dart:convert';
import 'package:country_state_city_picker/model/select_status_model.dart'
    as status;
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shoplite/constants/enum.dart';
import 'package:shoplite/constants/pref_data.dart';
import 'package:shoplite/constants/size_config.dart';
import 'package:shoplite/constants/color_data.dart';
import 'package:shoplite/ui/login/verify_screen.dart';

import '../../constants/constant.dart';
import '../../constants/widget_utils.dart';
import '../../providers/auth_provider.dart';
import '../home/home_screen.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabbar = 0;
  TextEditingController emailRegPhoneController = TextEditingController();
  TextEditingController emailSignInController = TextEditingController();
  TextEditingController passSignInController = TextEditingController();
  ValueNotifier<bool> isShowPass = ValueNotifier(false);
  bool chkVal = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    var loginState = ref.watch(loginProvider);
    // ref.listen<LoginStatus>(loginProvider, (previous, next) {
    //   if (next == LoginStatus.success) {
    //     // Chuyển hướng sang trang chính sau khi đăng nhập thành công
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(builder: (context) => HomeScreen()),
    //     );
    //   }
    // });
    ref.listen<LoginStatus>(loginProvider, (previous, next) {
      if (next == LoginStatus.success) {
        // Sử dụng addPostFrameCallback để đảm bảo navigation chỉ xảy ra sau khi frame hiện tại kết thúc
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        });
      }
    });
    SizeConfig().init(context);
    double screenHeight = SizeConfig.safeBlockVertical! * 100;
    double screenWidth = SizeConfig.safeBlockHorizontal! * 100;
    double appbarPadding = getAppBarPadding();
    double height = getEditHeight();
    double radius = Constant.getPercentSize(height, 20);
    double fontSize = Constant.getPercentSize(height, 30);
    double privacySize = Constant.getPercentSize(getEditHeight(), 25);

    TextStyle style = TextStyle(
        color: fontBlack,
        fontSize: fontSize,
        fontFamily: Constant.fontsFamily,
        fontWeight: FontWeight.w500);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: getBackgroundWidget(Stack(
        children: [
          Column(
            children: [
              TabBar(
                onTap: (value) {
                  _selectedTabbar = value;
                  setState(() {});
                },
                tabs: [
                  Tab(
                      child: Text(
                    "Sign in",
                    style: TextStyle(
                      decoration: (_selectedTabbar == 0)
                          ? TextDecoration.underline
                          : TextDecoration.none,
                      decorationColor: primaryColor.withOpacity(0.4),
                      decorationThickness: 6,
                      decorationStyle: TextDecorationStyle.solid,
                    ),
                  )),
                  Tab(
                      child: Text(
                    "Register",
                    style: TextStyle(
                      decoration: (_selectedTabbar == 1)
                          ? TextDecoration.underline
                          : TextDecoration.none,
                      decorationColor: primaryColor.withOpacity(0.4),
                      decorationThickness: 6,
                      decorationStyle: TextDecorationStyle.solid,
                    ),
                  ))
                ],
                unselectedLabelColor: Colors.grey,
                labelColor: fontBlack,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 0,
                indicatorPadding: EdgeInsets.zero,
                // indicatorSize: TabBarIndicatorSize.label,
                labelPadding: EdgeInsets.zero,
                indicatorColor: primaryColor,
                indicator: const UnderlineTabIndicator(
                  insets: EdgeInsets.all(0),
                ),
                padding: EdgeInsets.zero,
                labelStyle: TextStyle(
                    color: fontBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: Constant.getPercentSize(screenHeight, 3)),
                controller: _tabController,
                isScrollable: false,
              ),
              (_selectedTabbar == 0)
                  ? createLoginWidget(
                      screenWidth, screenHeight, context, appbarPadding)
                  : createRegisterWidget(screenWidth, screenHeight,
                      appbarPadding, privacySize, context),
              loginState == LoginStatus.loading
                  ? CircularProgressIndicator()
                  : loginState == LoginStatus.error
                      ? Text(
                          'Lỗi xãy ra!',
                          style: TextStyle(color: Colors.red),
                        )
                      : Container(),
            ],
          ),
        ],
      )),
    );
  }

  Container createLoginWidget(double screenWidth, double screenHeight,
      BuildContext context, double appbarPadding) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: Constant.getPercentSize(screenWidth, 4)),
      child: Column(
        children: [
          getSpace(Constant.getPercentSize(screenHeight, 3)),
          getLoginTextField(emailSignInController, "Email", "email.svg"),
          ValueListenableBuilder(
            builder: (context, value, child) {
              return getPassTextField(passSignInController, "Password",
                  "Lock.svg", isShowPass.value, () {
                isShowPass.value = !isShowPass.value;
              });
            },
            valueListenable: isShowPass,
          ),
          Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  Constant.sendToScreen(const ForgotPasswordScreen(), context);
                },
                child: getCustomText(
                    "Forgot Password?",
                    fontBlack,
                    1,
                    TextAlign.end,
                    FontWeight.bold,
                    Constant.getPercentSize(screenHeight, 2.3)),
              )),
          getSpace(appbarPadding / 2),
          getButton(primaryColor, true, "Sign In", Colors.white, () {
            // PrefData.setLogIn(true);
            final email = emailSignInController.text;
            final password = passSignInController.text;

            // Gọi hàm login
            ref.read(loginProvider.notifier).login(email, password);
            // Constant.sendToScreen(HomeScreen(), context);
          }, FontWeight.w500, EdgeInsets.symmetric(vertical: appbarPadding)),
          getCustomText("Or sign in with", Colors.grey, 1, TextAlign.center,
              FontWeight.w400, Constant.getPercentSize(screenHeight, 2.2)),
          Row(
            children: [
              Expanded(
                child: getButtonContainer(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        getSvgImage("google.svg", getEdtIconSize()),
                        getHorSpace(Constant.getPercentSize(screenWidth, 1.7)),
                        getCustomText("Google", fontBlack, 1, TextAlign.center,
                            FontWeight.bold, getEdtTextSize())
                      ],
                    ),
                    EdgeInsets.only(
                        left: 0,
                        top: appbarPadding,
                        bottom: appbarPadding,
                        right: appbarPadding / 2),
                    backgroundColor),
                flex: 1,
              ),
              Expanded(
                child: getButtonContainer(
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        getSvgImage("facebook.svg", getEdtIconSize()),
                        getHorSpace(Constant.getPercentSize(screenWidth, 1.7)),
                        getCustomText("Facebook", fontBlack, 1,
                            TextAlign.center, FontWeight.bold, getEdtTextSize())
                      ],
                    ),
                    EdgeInsets.only(
                        left: appbarPadding / 2,
                        top: appbarPadding,
                        bottom: appbarPadding,
                        right: 0),
                    backgroundColor),
                flex: 1,
              ),
            ],
          )
        ],
      ),
    );
  }

  Container createRegisterWidget(double screenWidth, double screenHeight,
      double appbarPadding, double privacySize, BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: Constant.getPercentSize(screenWidth, 4)),
      child: Column(
        children: [
          getSpace(Constant.getPercentSize(screenHeight, 3)),
          getLoginTextField(emailSignInController, "Email", "email.svg"),
          getLoginTextField(
              emailRegPhoneController, "Phone Number", "Call_Calling.svg"),
          ValueListenableBuilder(
            builder: (context, value, child) {
              return getPassTextField(passSignInController, "Password",
                  "Lock.svg", isShowPass.value, () {
                isShowPass.value = !isShowPass.value;
              });
            },
            valueListenable: isShowPass,
          ),
          getSpace(appbarPadding / 2),
          Row(
            children: [
              SizedBox(
                height: getEdtIconSize(),
                width: getEdtIconSize(),
                child: Checkbox(
                  onChanged: (value) {
                    setState(() {
                      chkVal = value!;
                    });
                  },
                  value: chkVal,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  side: BorderSide(width: 0.5, color: greyFont),
                  activeColor: primaryColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
              ),
              getHorSpace(Constant.getPercentSize(screenWidth, 1.5)),
              getCustomText("I accepted", fontBlack, 1, TextAlign.start,
                  FontWeight.w400, privacySize),
              getHorSpace(Constant.getPercentSize(screenWidth, 1.5)),
              Expanded(
                flex: 1,
                child: getCustomText("Terms & Privacy Policy", primaryColor, 1,
                    TextAlign.start, FontWeight.w400, privacySize),
              )
            ],
          ),
          getSpace(appbarPadding / 2),
          getButton(primaryColor, true, "Register", Colors.white, () {
            Constant.sendToScreen(const VerifyScreen(), context);
          }, FontWeight.w500, EdgeInsets.symmetric(vertical: appbarPadding)),
        ],
      ),
    );
  }
}
