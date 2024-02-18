import 'bloc/main_menu_bloc.dart';
import 'models/main_menu_model.dart';
import 'package:flutter/material.dart';
import 'package:shutter_motion/core/app_export.dart';
import 'package:shutter_motion/widgets/custom_icon_button.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<MainMenuBloc>(
      create: (context) => MainMenuBloc(MainMenuState(
        mainMenuModelObj: MainMenuModel(),
      ))
        ..add(MainMenuInitialEvent()),
      child: MainMenuScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainMenuBloc, MainMenuState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 18.v),
              child: Column(
                children: [
                  SizedBox(height: 34.v),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 5.v),
                        padding: EdgeInsets.symmetric(horizontal: 23.h),
                        child: Column(
                          children: [
                            Text(
                              "lbl_shutter_motion".tr,
                              style: CustomTextStyles
                                  .headlineLargePrimaryContainer,
                            ),
                            Text(
                              "lbl_volet_tms74".tr,
                              style: CustomTextStyles.bodyLargePrimaryContainer,
                            ),
                            SizedBox(height: 17.v),
                            SizedBox(
                              height: 179.v,
                              width: 160.h,
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      "lbl_ensolleil".tr,
                                      style: CustomTextStyles
                                          .titleMediumPrimaryContainer,
                                    ),
                                  ),
                                  CustomImageView(
                                    imagePath: ImageConstant.imgVector160x160,
                                    height: 160.adaptSize,
                                    width: 160.adaptSize,
                                    radius: BorderRadius.circular(
                                      12.h,
                                    ),
                                    alignment: Alignment.topCenter,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16.v),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 67.h),
                                child: Text(
                                  "msg_pensez_vous_habiller".tr,
                                  style:
                                      CustomTextStyles.bodyMediumErrorContainer,
                                ),
                              ),
                            ),
                            SizedBox(height: 65.v),
                            _buildPlaylist(context),
                            SizedBox(height: 20.v),
                            _buildClientTestimonials(context),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: _buildReviews(context),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildPlaylist(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 2.h),
      padding: EdgeInsets.symmetric(
        horizontal: 67.h,
        vertical: 19.v,
      ),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 7.v),
          Text(
            "lbl_votre_pi_ce".tr,
            style: theme.textTheme.labelLarge,
          ),
          SizedBox(height: 13.v),
          Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "lbl_humidit".tr,
                      style: theme.textTheme.titleSmall,
                    ),
                    SizedBox(height: 14.v),
                    CustomImageView(
                      imagePath: ImageConstant.imgFrameOnprimarycontainer,
                      height: 40.adaptSize,
                      width: 40.adaptSize,
                    ),
                    SizedBox(height: 12.v),
                    Text(
                      "lbl_5".tr,
                      style: theme.textTheme.titleMedium,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 110.v,
                      child: VerticalDivider(
                        width: 1.h,
                        thickness: 1.v,
                        color: appTheme.gray300,
                        endIndent: 2.h,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 9.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "lbl_temp_rature".tr,
                            style: theme.textTheme.titleSmall,
                          ),
                          SizedBox(height: 12.v),
                          CustomImageView(
                            imagePath: ImageConstant.imgFrameSecondarycontainer,
                            height: 40.adaptSize,
                            width: 40.adaptSize,
                            margin: EdgeInsets.only(left: 26.h),
                          ),
                          SizedBox(height: 12.v),
                          Padding(
                            padding: EdgeInsets.only(left: 33.h),
                            child: Text(
                              "lbl_28".tr,
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildClientTestimonials(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 2.h),
      padding: EdgeInsets.symmetric(
        horizontal: 24.h,
        vertical: 20.v,
      ),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.v),
                child: Text(
                  "lbl_air_conditions".tr,
                  style: theme.textTheme.labelLarge,
                ),
              ),
              Container(
                width: 81.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 7.h,
                  vertical: 1.v,
                ),
                decoration: AppDecoration.outlinePrimaryContainer.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder12,
                ),
                child: Text(
                  "lbl_see_more".tr,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          SizedBox(height: 18.v),
          Padding(
            padding: EdgeInsets.only(right: 62.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgFramePrimarycontainer,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  margin: EdgeInsets.only(bottom: 3.v),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: Text(
                    "lbl_real_feel".tr,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
                Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.imgFramePrimarycontainer20x20,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  margin: EdgeInsets.only(bottom: 3.v),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: Text(
                    "lbl_wind".tr,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 1.v),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                left: 27.h,
                right: 31.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgMaskGroup,
                    height: 22.v,
                    width: 109.h,
                    margin: EdgeInsets.only(bottom: 2.v),
                  ),
                  Text(
                    "lbl_0_2_km_h".tr,
                    style: theme.textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 21.v),
          Padding(
            padding: EdgeInsets.only(right: 34.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgFrame20x20,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  margin: EdgeInsets.only(bottom: 29.v),
                ),
                Container(
                  height: 48.v,
                  width: 109.h,
                  margin: EdgeInsets.only(
                    left: 8.h,
                    bottom: 2.v,
                  ),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgMaskGroup,
                        height: 22.v,
                        width: 109.h,
                        alignment: Alignment.bottomCenter,
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgGroup,
                        height: 22.v,
                        width: 109.h,
                        alignment: Alignment.topCenter,
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgGroup46x84,
                        height: 46.v,
                        width: 84.h,
                        alignment: Alignment.centerLeft,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 11.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgFrame1,
                            height: 20.adaptSize,
                            width: 20.adaptSize,
                            margin: EdgeInsets.only(bottom: 3.v),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.h),
                            child: Text(
                              "lbl_uv_index".tr,
                              style: theme.textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.v),
                      Padding(
                        padding: EdgeInsets.only(left: 27.h),
                        child: Text(
                          "lbl_3".tr,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildReviews(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 135.h,
        right: 138.h,
        bottom: 18.v,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomIconButton(
            height: 28.adaptSize,
            width: 28.adaptSize,
            padding: EdgeInsets.all(7.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgFrameWhiteA700,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgFrame2,
            height: 20.adaptSize,
            width: 20.adaptSize,
            margin: EdgeInsets.only(
              left: 54.h,
              top: 4.v,
              bottom: 4.v,
            ),
          ),
        ],
      ),
    );
  }
}
