import '../settings_screen/widgets/eighteen_item_widget.dart';
import '../settings_screen/widgets/fifteen_item_widget.dart';
import 'bloc/settings_bloc.dart';
import 'models/eighteen_item_model.dart';
import 'models/fifteen_item_model.dart';
import 'models/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:shutter_motion/core/app_export.dart';
import 'package:shutter_motion/widgets/custom_elevated_button.dart';
import 'package:shutter_motion/widgets/custom_icon_button.dart';
import 'package:shutter_motion/widgets/custom_text_form_field.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (context) => SettingsBloc(SettingsState(
        settingsModelObj: SettingsModel(),
      ))
        ..add(SettingsInitialEvent()),
      child: SettingsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 24.h,
            vertical: 12.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.v),
              Text(
                "lbl_param_tre".tr,
                style: CustomTextStyles.headlineLargePrimaryContainer,
              ),
              SizedBox(height: 25.v),
              Text(
                "lbl_units".tr,
                style: CustomTextStyles.titleMediumPrimaryContainer_1,
              ),
              SizedBox(height: 5.v),
              _buildTemperatureSection(context),
              Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 91.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgFrame24x24,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        margin: EdgeInsets.symmetric(vertical: 2.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 62.h),
                        child: CustomIconButton(
                          height: 28.adaptSize,
                          width: 28.adaptSize,
                          padding: EdgeInsets.all(7.h),
                          decoration: IconButtonStyleHelper.outlinePrimaryTL6,
                          child: CustomImageView(
                            imagePath: ImageConstant.imgFrameWhiteA70028x28,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTemperatureSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 14.v,
      ),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4.v),
          Text(
            "lbl_temperature".tr,
            style: theme.textTheme.labelLarge,
          ),
          SizedBox(height: 13.v),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: BlocSelector<SettingsBloc, SettingsState, SettingsModel?>(
              selector: (state) => state.settingsModelObj,
              builder: (context, settingsModelObj) {
                return Wrap(
                  runSpacing: 5.v,
                  spacing: 5.h,
                  children: List<Widget>.generate(
                    settingsModelObj?.eighteenItemList.length ?? 0,
                    (index) {
                      EighteenItemModel model =
                          settingsModelObj?.eighteenItemList[index] ??
                              EighteenItemModel();

                      return EighteenItemWidget(
                        model,
                        onSelectedChipView: (value) {
                          context.read<SettingsBloc>().add(UpdateChipViewEvent(
                              index: index, isSelected: value));
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 30.v),
          Text(
            "lbl_wind_speed".tr,
            style: theme.textTheme.labelLarge,
          ),
          SizedBox(height: 14.v),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: BlocSelector<SettingsBloc, SettingsState, SettingsModel?>(
              selector: (state) => state.settingsModelObj,
              builder: (context, settingsModelObj) {
                return Wrap(
                  runSpacing: 5.v,
                  spacing: 5.h,
                  children: List<Widget>.generate(
                    settingsModelObj?.fifteenItemList.length ?? 0,
                    (index) {
                      FifteenItemModel model =
                          settingsModelObj?.fifteenItemList[index] ??
                              FifteenItemModel();

                      return FifteenItemWidget(
                        model,
                        onSelectedChipView: (value) {
                          context.read<SettingsBloc>().add(UpdateChipView1Event(
                              index: index, isSelected: value));
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 22.v),
          Text(
            "msg_temp_rature_seuil2".tr,
            style: theme.textTheme.labelLarge,
          ),
          SizedBox(height: 10.v),
          BlocSelector<SettingsBloc, SettingsState, TextEditingController?>(
            selector: (state) => state.enteryourtemperatureController,
            builder: (context, enteryourtemperatureController) {
              return CustomTextFormField(
                controller: enteryourtemperatureController,
                hintText: "msg_saissisez_votre".tr,
                textInputAction: TextInputAction.done,
              );
            },
          ),
          SizedBox(height: 11.v),
          CustomElevatedButton(
            text: "msg_valider_les_modifications".tr,
            margin: EdgeInsets.symmetric(horizontal: 4.h),
          ),
        ],
      ),
    );
  }
}
