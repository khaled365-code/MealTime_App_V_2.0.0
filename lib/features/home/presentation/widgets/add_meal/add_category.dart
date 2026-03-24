
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_meal_time_app/core/commons/commons.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/add_meal_cubit/add_meal_cubit.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class AddMealCategoryWidget extends StatelessWidget {
  const AddMealCategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
        title: 'mealCategory'.tr(context),
        childWidget: Container(
          decoration: BoxDecoration(
            color: AppColors.cF0F5FA,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: Theme(
               data: Theme.of(context).copyWith(
               canvasColor: Colors.transparent, // background color for the dropdown items
               buttonTheme: ButtonTheme.of(context).copyWith(
                alignedDropdown: true, //If false (the default), then the dropdown's menu will be wider than its button.
              )),
                  child: DropdownButton(
                    items: AddMealCubit.get(context).categoriesList.map(
                          (e) => DropdownMenuItem(
                          value: e,
                              child: Text(e.tr(context),style: AppTextStyles.regular14(context).copyWith(
                            color: AppColors.cA0A5BA
                        ),)),
                    ).toList(),
                    onChanged: (value)
                    {
                      AddMealCubit.get(context).changeCategoryValue(value: value!);
                    },
                    icon: SvgPicture.asset(ImageConstants.underArrowIcon),
                    value: AddMealCubit.get(context).selectedCategory,
                    isExpanded: true,
                    dropdownColor: AppColors.cF0F5FA,
                    elevation: 0,
                    underline: SizedBox.shrink(),
                    padding: EdgeInsetsDirectional.only(
                        start: 5.w,
                        end: 16.w
                    ),
                    menuMaxHeight: 200.h,


                  ),
                ),

              ),
            ],
          ),
        ));
  }
}
