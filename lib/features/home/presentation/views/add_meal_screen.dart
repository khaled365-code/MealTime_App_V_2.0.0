import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/commons/commons.dart';
import '../../../../core/commons/global_models/local_notifications_model.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/services/internet_connection_service.dart';
import '../../../../core/utils/services/local_notifications_service.dart';
import '../../../../core/widgets/no_internet_connection_dialog.dart';
import '../../../../core/widgets/shared_button.dart';
import '../../../../core/widgets/shared_loading_indicator.dart';
import '../../../../core/widgets/space_widget.dart';
import '../../../profile/presentation/cubits/notifications_cubit/notifications_cubit.dart';
import '../cubits/add_meal_cubit/add_meal_cubit.dart';
import '../widgets/add_meal/add_category.dart';
import '../widgets/add_meal/add_description.dart';
import '../widgets/add_meal/add_name.dart';
import '../widgets/add_meal/add_price.dart';
import '../widgets/add_meal/number_radio_button.dart';
import '../widgets/add_meal/quantity_radio_button.dart';
import '../widgets/add_meal_photo_widget.dart';

class AddMealScreen extends StatelessWidget {
  const AddMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddMealCubit, AddMealState>( // الاستماع للتغييرات في الحالة (State)
      listener: (context, state) {
        handleListenerFunctions(state, context); // معالجة الاستجابة بناءً على الحالة
      },
      child: Scaffold(
        backgroundColor: AppColors.white, // تحديد لون الخلفية للشاشة
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining( // لابقاء المحتوي مالئ الشاشه لو مكنتش الشاشه طويله
                hasScrollBody: false,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 24.w, end: 24.w), // إضافة مسافات حول المحتوى
                  child: BlocBuilder<AddMealCubit, AddMealState>( // بناء واجهة المستخدم بناءً على الحالة
                    builder: (context, state) {
                      return Form( // تحديد النموذج (Form) لإدخال البيانات
                        key: AddMealCubit.get(context).addMealFormKey, // مفتاح للنموذج
                        autovalidateMode: AddMealCubit.get(context).addMealValidateMode, // تحديد متى يتم التحقق من المدخلات تلقائيًا
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // ترتيب العناصر في العمود
                          children: [
                            SpaceWidget(height: 32,),
                            GestureDetector( // عنصر للكشف عن الإيماءات مثل النقر
                              onTap: () {
                                Navigator.pop(context); // العودة للشاشة السابقة
                              },
                              child: Container( // عنصر دائري يحتوي على زر العودة
                                width: 45.w,
                                height: 45.h,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.cECF0F4
                                ),
                                child: isArabic() == false ? // التحقق من اللغة
                                Center(
                                  child: SvgPicture.asset(
                                      width: 8,
                                      ImageConstants.arrowBackIcon,
                                      colorFilter: ColorFilter.mode(AppColors.c181C2E, BlendMode.srcIn)
                                  ),
                                ) :
                                Center(
                                  child: Transform.rotate(
                                    angle: 3.14159, // لتدوير الأيقونة في حالة اللغة العربية
                                    child: SvgPicture.asset(
                                        width: 8,
                                        ImageConstants.arrowBackIcon,
                                        colorFilter: ColorFilter.mode(AppColors.c181C2E, BlendMode.srcIn)
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SpaceWidget(height: 24,),
                            AddMealPhotoWidget( // لإضافة صورة للوجبة
                              onDeletePhotoPressed: () {
                                AddMealCubit.get(context).deleteMealPhoto(); // حذف الصورة
                              },
                              imagePath: AddMealCubit.get(context).mealImage?.path, // مسار الصورة
                              onCameraTap: () {
                                imagePick(imageSource: ImageSource.camera).then(
                                      (value) => AddMealCubit.get(context).addMealPhoto(image: value!), // التقاط صورة من الكاميرا
                                );
                                Navigator.pop(context);
                              },
                              onGalleryTap: () {
                                imagePick(imageSource: ImageSource.gallery).then(
                                      (value) => AddMealCubit.get(context).addMealPhoto(image: value!), // اختيار صورة من المعرض
                                );
                                Navigator.pop(context);
                              },
                            ),
                            SpaceWidget(height: AddMealCubit.get(context).mealImage == null ? 24 : 5,),
                            AddMealNameTextField(), // حقل إدخال اسم الوجبة
                            SpaceWidget(height: 24,),
                            AddMealPriceTextField(), // حقل إدخال سعر الوجبة
                            SpaceWidget(height: 24,),
                            AddMealDiscTextField(), // حقل إدخال وصف الوجبة
                            SpaceWidget(height: 24,),
                            AddMealCategoryWidget(), // اختيار فئة الوجبة
                            SpaceWidget(height: 24,),
                            Row(
                              children: [
                                NumberRadioButton(), // خيار لعدد الوجبات
                                Spacer(),
                                QuantityRadioButton() // خيار الكمية
                              ],
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 121.h, // إضافة مساحة فارغة
                              ),
                            ),
                            state is AddMealLoadingState ?
                            Center(
                              child: SharedLoadingIndicator(), // مؤشر تحميل أثناء الإضافة
                            ) :
                            SharedButton(
                              btnText: 'addMeal'.tr(context), // زر إضافة الوجبة
                              btnTextStyle: AppTextStyles.bold16(context).copyWith(
                                  color: AppColors.white
                              ),
                              onPressed: () {
                                handleAddMealPress(context); // تنفيذ إضافة الوجبة
                              },
                            ),
                            SpaceWidget(height: 32,)
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleAddMealPress(BuildContext context) async {
    if (await InternetConnectionCheckingService.checkInternetConnection() == true) { // التحقق من الاتصال بالإنترنت
      if (AddMealCubit.get(context).addMealFormKey.currentState!.validate()) { // التحقق من صحة البيانات المدخلة
        AddMealCubit.get(context).addMealFormKey.currentState!.save(); // حفظ البيانات المدخلة
        if (AddMealCubit.get(context).mealImage == null) { // التحقق إذا كانت الصورة موجودة
          showToast(
              context: context,
              msg: 'youProvideImageMeal'.tr(context), // رسالة توضح أنه يجب توفير صورة
              toastStates: ToastStates.error,
              gravity: ToastGravity.CENTER
          );
        } else {
          AddMealCubit.get(context).addMealFun( // إضافة الوجبة
            name: AddMealCubit.get(context).mealNameController.text,
            description: AddMealCubit.get(context).mealDescriptionController.text,
            price: double.parse(AddMealCubit.get(context).mealPriceController.text),
            category: AddMealCubit.get(context).selectedCategory,
            howToSell: getHowToSellValue(numberValue: AddMealCubit.get(context).numberRadioIsSelected, quantityValue: AddMealCubit.get(context).quantityRadioIsSelected),
          );
        }
      } else {
        AddMealCubit.get(context).activateAutoValidateMode(); // تفعيل التحقق التلقائي في حال عدم صحة المدخلات
      }
    } else {
      showDialog(context: context, builder: (context) => NoInternetConnectionDialog(),); // إظهار نافذة عدم الاتصال بالإنترنت
    }
  }

  void handleListenerFunctions(AddMealState state, BuildContext context) async {
    if (state is AddMealSuccessState) { // في حالة نجاح إضافة الوجبة
      LocalNotificationsModel localNotification = LocalNotificationsModel(
        DateTime.now().toString(), // وقت الإشعار
        id: 40, // رقم الإشعار
        image: ImageConstants.newMealAlarmImage, // صورة الإشعار
        payload: AddMealCubit.get(context).mealImage?.path, // مسار الصورة إذا كانت موجودة
        title: '${AddMealCubit.get(context).mealNameController.text + ' ' + 'mealAddedSuccessfully'.tr(context)}', // عنوان الإشعار مع اسم الوجبة
        body: 'ThankSubmitting'.tr(context) + ' ${AddMealCubit.get(context).mealNameController.text} ' + 'mealPending'.tr(context), // نص الإشعار
      );
      LocalNotificationsService.showBasicNotification(localNotificationsModel: localNotification); // عرض الإشعار
      await NotificationsCubit.get(context).saveLocalNotificationsFun(localNotification: localNotification); // حفظ الإشعار
      AddMealCubit.get(context).mealImage = null; // حذف الصورة
      AddMealCubit.get(context).mealNameController.clear(); // مسح اسم الوجبة
      AddMealCubit.get(context).mealDescriptionController.clear(); // مسح الوصف
      AddMealCubit.get(context).mealPriceController.clear(); // مسح السعر
    }
    if (state is AddMealFailureState) { // في حالة فشل إضافة الوجبة
      if (state.errorModel.error != null) {
        buildScaffoldMessenger(
            context: context,
            msg: state.errorModel.error!.toString().substring(1, state.errorModel.error!.toString().length - 1), // عرض رسالة الخطأ
            iconWidget: Icon(Icons.error_outline, color: AppColors.white, size: 25.sp,)
        );
      } else {
        buildScaffoldMessenger(
            context: context,
            msg: state.errorModel.errorMessage!, // عرض رسالة الخطأ
            iconWidget: Icon(Icons.error_outline, color: AppColors.white, size: 25.sp,)
        );
      }
    }
  }

  getHowToSellValue({required bool numberValue, required bool quantityValue}) {
    if (numberValue == true) {
      return 'number'; // طريقة بيع حسب العدد
    } else if (quantityValue == true) {
      return 'quantity'; // طريقة بيع حسب الكمية
    }
  }
}
