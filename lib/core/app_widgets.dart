// import 'package:rooms/core/index.dart';
// import 'package:rooms/features/home/presentation/manager/home_bloc.dart';
import 'package:delivery/core/extentions/add_seperator_extention.dart';
import 'package:delivery/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'app_sizes.dart';
import 'app_texts.dart';

class BuildTextField extends StatelessWidget {
  final String? labelText;
  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;
  final bool isSecure;
  final bool isLabel;
  Widget? prefix;
  Widget? suffix;

  BuildTextField({super.key,
     this.labelText,
    required this.controller,
    required this.hintText,
    required this.inputType,
    required this.isSecure,
    required this.isLabel,
    this.prefix,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         isLabel? Text(
            labelText!,
            style: TextStyle(
              fontFamily:AppTexts.fontFamily,
              fontSize: AppSizes.fontSize16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimaryColor,
            ),
          ):const SizedBox(),
          CustomAppTextField(
            controller: controller,
            isSecure: isSecure,
            hintText: hintText,
            textInputType: inputType,
            prefix: prefix,
            suffix: suffix,
            validator: (value) =>
                value!.isEmpty ? 'هذا الحقل مطلوب' : null,
          ),
        ].addSeparator(separator: SizedBox(height: AppSizes.padding12.h)));
  }
}


class CustomAppTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isSecure;
  bool? hasPrefix = false;
  final Widget? prefix;
  final Widget? suffix;
  final String hintText;
  final TextInputType textInputType;
  String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: isSecure,
      validator: validator,
      onChanged: (value) {
        value = controller.text;
      },
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily:AppTexts.fontFamily,
            fontSize: AppSizes.fontSize14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.hintColor,
          ),
          suffixIcon: suffix,
          suffixIconColor: AppColors.shadeColor,
          prefixIcon: hasPrefix == true
              ? Padding(
                  padding: EdgeInsets.all(AppSizes.padding12.h.w),
                  child: prefix)
              : null,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radius15.r),
              borderSide:
                  const BorderSide(color: AppColors.shadeColor, width: 1.5)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radius15.r),
              borderSide:
                  const BorderSide(color: AppColors.shadeColor, width: 1.5)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radius15.r),
              borderSide:
                  const BorderSide(color: AppColors.shadeColor, width: 1.5))
      ),
    );
  }

  CustomAppTextField({super.key,
    required this.controller,
    required this.isSecure,
    this.prefix,
    this.suffix,
    this.hasPrefix,
    this.validator,
    required this.hintText,
    required this.textInputType,
  });
}

class CustomAppButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? widget;
  final String? text;
  bool? isText = true;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
            minimumSize: MaterialStateProperty.all(
                Size(double.infinity.w, AppSizes.height65.h)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.radius15.r)))),
        child: isText == true
            ? Text(
                text!,
                style: TextStyle(
                  fontFamily:AppTexts.fontFamily,
                  fontSize: AppSizes.fontSize16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.backgroundColor,
                ),
              )
            : widget);
  }

  CustomAppButton({super.key,
    this.onPressed,
    this.isText = true,
    this.widget,
    this.text,
  });
}
class UserTypeButton extends StatelessWidget {
  final String userType;

  const UserTypeButton({super.key, required this.userType});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final isSelected = state is UserTypeSelected && state.userType == userType;

        return Container(
          height: AppSizes.height65.h,
          width: AppSizes.height65*2.w,
          margin: EdgeInsets.symmetric(vertical:AppSizes.padding8.w),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: !isSelected ? Colors.white : AppColors.primaryColor,
              elevation: isSelected ? 10 : 2,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),side: const BorderSide(
                color: AppColors.primaryColor
              )
              ),
            ),
            onPressed: () {
              if (!isSelected) {
                context.read<AuthBloc>().add(ToggleUserTypeEvent(userType: userType));

              }
            },
            child: Text(
              ' $userType',
              style: TextStyle(
                  fontFamily:AppTexts.fontFamily,
                  fontSize: AppSizes.fontSize24.sp,
                  fontWeight: FontWeight.w700,
                  color: isSelected?AppColors.backgroundColor: AppColors.subTitleColor

              ),
            ),
          ),
        );
      },
    );
  }
}