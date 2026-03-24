



import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_meal_time_app/core/commons/commons.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';

import '../../../../../core/widgets/custom_outline_text_field.dart';
import '../../../../../core/widgets/name_and_text_field_widget.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NameAndTextFieldWidget(
      title: 'phone'.tr(context),
      childWidget: Padding(
        padding: EdgeInsetsDirectional.only(end: 24.w),
        child: CustomOutlineTextField(
          inputFormatters:
          [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(11),
          ],
          validator: (value) {
            if (value!.isEmpty) {
              return 'mustEnterPhoneNumber'.tr(context);
            }
            if(value.length < 10)
            {
              return 'phoneLength10'.tr(context);
            }
            else
            {
              return null;
            }
          },
          controller: SignupCubit.get(context).phoneController,
          hintText: 'example: +201013328223',
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }
}
