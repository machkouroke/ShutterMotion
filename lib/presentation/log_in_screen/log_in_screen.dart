import 'bloc/log_in_bloc.dart';
import 'models/log_in_model.dart';
import 'package:flutter/material.dart';
import 'package:shutter_motion/core/app_export.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<LogInBloc>(
      create: (context) => LogInBloc(LogInState(
        logInModelObj: LogInModel(),
      ))
        ..add(LogInInitialEvent()),
      child: LogInScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogInBloc, LogInState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  _buildFourColumn(context),
                  SizedBox(height: 51.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: _buildOneRow(
                      context,
                      text: "lbl_volet_tms85".tr,
                    ),
                  ),
                  SizedBox(height: 20.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: _buildOneRow(
                      context,
                      text: "lbl_volet_tms74".tr,
                    ),
                  ),
                  SizedBox(height: 4.v),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildFourColumn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 66.h,
        vertical: 20.v,
      ),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 27.v),
          CustomImageView(
            imagePath: ImageConstant.imgVector126x126,
            height: 126.adaptSize,
            width: 126.adaptSize,
            radius: BorderRadius.circular(
              12.h,
            ),
          ),
          SizedBox(height: 18.v),
          Text(
            "lbl_votre_volet".tr,
            style: theme.textTheme.headlineSmall,
          ),
          SizedBox(height: 11.v),
          Text(
            "msg_rechechons_maintenant".tr,
            style: theme.textTheme.bodyLarge,
          ),
          SizedBox(height: 5.v),
          Text(
            "msg_shuttermotion_volet".tr,
            style: theme.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildOneRow(
    BuildContext context, {
    required String text,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 11.v,
      ),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgFramePrimarycontainer24x24,
            height: 24.adaptSize,
            width: 24.adaptSize,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.h,
              top: 4.v,
            ),
            child: Text(
              text,
              style: CustomTextStyles.bodySmallPrimaryContainer.copyWith(
                color: theme.colorScheme.primaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
