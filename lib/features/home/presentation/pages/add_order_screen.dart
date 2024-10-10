import 'package:delivery/core/app_sizes.dart';
import 'package:delivery/core/app_widgets.dart';
import 'package:delivery/core/extentions/add_seperator_extention.dart';
import 'package:delivery/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../core/app_colors.dart';
import '../../../../core/app_texts.dart'; // alias 'intl'

class AddOrderScreen extends StatelessWidget {
  AddOrderScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = context.read<HomeBloc>();
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeErrorState) {
          Fluttertoast.showToast(msg: state.message, textColor: Colors.white);
        }
        if (state is AddOrderSuccess) {
          homeBloc.dateController.clear();
          homeBloc.discreptionController.clear();
          homeBloc.staffsController.clear();
          Fluttertoast.showToast(
              msg: 'تمت اضافة طلبك بنجاح', textColor: Colors.white);
        }
      },
      builder: (context, state) => Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('اضافة طلب'),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(AppSizes.padding20.h.w),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2101),
                          );

                          if (pickedDate != null) {
                            // Convert DateTime to the desired string format
                            String formattedDate = intl.DateFormat('yyyy-MM-dd')
                                .format(pickedDate);
                            // Update the date controller
                            homeBloc.dateController.text = formattedDate;
                            // Dispatch the DatePickedEvent with the DateTime object
                            homeBloc.add(DatePickedEvent(pickedDate));
                          }
                        },
                        child: AbsorbPointer(
                          child: BuildTextField(
                            labelText: 'التاريخ',
                            controller: homeBloc.dateController,
                            hintText: 'yyyy-MM-dd',
                            inputType: TextInputType.datetime,
                            isSecure: false,
                            isLabel: true,
                          ),
                        ),
                      ),
                      BuildTextField(
                        labelText: 'الوصف',
                        controller: homeBloc.discreptionController,
                        hintText: '......',
                        inputType: TextInputType.text,
                        isSecure: false,
                        isLabel: true,
                      ),
                      BuildTextField(
                        labelText: 'اسماء الموظفين',
                        controller: homeBloc.staffsController,
                        hintText: '...,...',
                        inputType: TextInputType.text,
                        isSecure: false,
                        isLabel: true,
                      ),
                      CustomAppButton(
                        isText: false,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            homeBloc.add(
                              AddOrderEvent(
                                date: homeBloc.dateController.text.trim(),
                                // Use the date from the date picker
                                description_one:
                                    homeBloc.discreptionController.text,
                                staff_names: homeBloc.staffsController.text,
                              ),
                            );
                          }
                        },
                        widget: state is HomeLoadingState
                            ? const Center(child: CircularProgressIndicator())
                            : Text(
                                'اضافة الطلب',
                                style: TextStyle(
                                  fontFamily:AppTexts.fontFamily,
                                  fontSize: AppSizes.fontSize16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.backgroundColor,
                                ),
                              ),
                      ),
                    ].addSeparator(
                        separator: SizedBox(height: AppSizes.padding20.h)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
