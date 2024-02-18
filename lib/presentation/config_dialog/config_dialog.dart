import 'bloc/config_bloc.dart';
import 'models/config_model.dart';
import 'package:flutter/material.dart';
import 'package:shutter_motion/core/app_export.dart';
import 'package:shutter_motion/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class ConfigDialog extends StatelessWidget {
  const ConfigDialog({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<ConfigBloc>(
      create: (context) => ConfigBloc(ConfigState(
        configModelObj: ConfigModel(),
      ))
        ..add(ConfigInitialEvent()),
      child: ConfigDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
          left: 20.h,
          right: 20.h,
          bottom: 73.v,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20.h,
          vertical: 16.v,
        ),
        decoration: AppDecoration.fillGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgVector184x179,
              height: 184.v,
              width: 179.h,
            ),
            SizedBox(height: 18.v),
            Text(
              "lbl_choisissez_une".tr,
              style: theme.textTheme.headlineLarge,
            ),
            Text(
              "msg_temp_rature_seuil".tr,
              style: theme.textTheme.headlineLarge,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 23.h,
                vertical: 12.v,
              ),
              decoration: AppDecoration.outlineGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder12,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgFrame,
                    height: 40.adaptSize,
                    width: 40.adaptSize,
                    margin: EdgeInsets.only(
                      top: 12.v,
                      bottom: 14.v,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 6.h,
                        top: 1.v,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "msg_la_temp_rature_seuil".tr,
                            style: theme.textTheme.bodySmall,
                          ),
                          Text(
                            "msg_temp_rature_qui".tr,
                            style: theme.textTheme.bodySmall,
                          ),
                          Text(
                            "msg_conditionner_le".tr,
                            style: theme.textTheme.bodySmall,
                          ),
                          Text(
                            "lbl_de_notre_volet".tr,
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 41.v),
            CustomOutlinedButton(
              height: 37.v,
              text: "msg_saissisez_votre".tr,
              buttonStyle: CustomButtonStyles.outlineBlueGray,
              buttonTextStyle: CustomTextStyles.bodyMediumOnPrimary,
            ),
            SizedBox(height: 44.v),
          ],
        ),
      ),
    );
  }
}
