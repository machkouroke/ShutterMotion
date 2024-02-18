import 'bloc/welcome_sign_up_bloc.dart';
import 'models/welcome_sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:shutter_motion/core/app_export.dart';
import 'package:shutter_motion/widgets/custom_outlined_button.dart';

class WelcomeSignUpScreen extends StatelessWidget {
  const WelcomeSignUpScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<WelcomeSignUpBloc>(
        create: (context) => WelcomeSignUpBloc(
            WelcomeSignUpState(welcomeSignUpModelObj: WelcomeSignUpModel()))
          ..add(WelcomeSignUpInitialEvent()),
        child: WelcomeSignUpScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeSignUpBloc, WelcomeSignUpState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                    SizedBox(height: 48.v),
                    Expanded(
                        child: SingleChildScrollView(
                            child: Container(
                                margin: EdgeInsets.only(bottom: 98.v),
                                padding: EdgeInsets.symmetric(horizontal: 24.h),
                                child: Column(children: [
                                  Divider(),
                                  SizedBox(height: 18.v),
                                  Text("lbl_shutter_motion".tr,
                                      style: theme.textTheme.displayMedium),
                                  SizedBox(height: 4.v),
                                  Divider(),
                                  SizedBox(height: 16.v),
                                  Text("msg_bienvenue_sur_le".tr,
                                      style: CustomTextStyles
                                          .bodyLargePrimaryContainer),
                                  SizedBox(height: 37.v),
                                  CustomImageView(
                                      imagePath: ImageConstant.imgVector,
                                      height: 312.adaptSize,
                                      width: 312.adaptSize,
                                      radius: BorderRadius.circular(12.h)),
                                  SizedBox(height: 48.v),
                                  CustomOutlinedButton(text: "lbl_d_marrer".tr)
                                ]))))
                  ]))));
    });
  }
}
