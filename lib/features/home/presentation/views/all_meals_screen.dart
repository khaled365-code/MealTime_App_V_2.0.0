import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../core/commons/commons.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/services/internet_connection_service.dart';
import '../../../../core/widgets/space_widget.dart';
import '../cubits/get_system_meals_cubit/system_meals_cubit.dart';
import '../widgets/available_meals/all_available_meals_row.dart';
import '../widgets/available_meals/all_meal_app_bar.dart';
import '../widgets/available_meals/available_meals_loading_widget.dart';
import '../widgets/available_meals/grid_meal_item.dart';
import '../widgets/available_meals/no_meals_yet_widget.dart';



class AllMealsScreen extends StatelessWidget { // تعريف الشاشة كـ Stateless لأنها مش بتعتمد على تغييرات الحالة
  const AllMealsScreen({super.key}); // كونستراكتور

  @override
  Widget build(BuildContext context) { // دالة بناء واجهة المستخدم
    return Scaffold( // تقسيم الشاشة لعناصر مختلفة
      backgroundColor: AppColors.white, // خلفية الشاشة لونها أبيض
      body: SafeArea( // لتجنب التداخل مع الأجزاء العلوية أو السفلية للشاشة
          child: RefreshIndicator( // عنصر لتحديث المحتوى عند السحب لأسفل
            onRefresh: () async { // الدالة التي يتم تنفيذها عند التحديث
              if(await InternetConnectionCheckingService.checkInternetConnection()==true) { // التحقق من وجود اتصال بالإنترنت
                await SystemMealsCubit.get(context).getAllMealsFromApiFun(); //استدعاء الدالة لجلب البيانات مPI
                buildScaffoldMessenger( // عرض رسالة نجاح
                  context: context,
                  msg: 'mealsFetchedSuccessfully'.tr(context),
                  iconWidget: SvgPicture.asset(ImageConstants.checkCircleIcon),
                );
              }
              else { // في حالة عدم وجود اتصال بالإنترنت
                buildScaffoldMessenger( // عرض رسالة انقطاع الاتصال
                    context: context,
                    msg: 'youAreOffline'.tr(context),
                    iconWidget: Icon(Icons.wifi_off,color: AppColors.white,)
                );
              }
            },
            color: AppColors.primaryColor, // لون مؤشر التحديث
            edgeOffset: 1, // المسافة بين أعلى الشاشة ومؤشر التحديث
            child: CustomScrollView( // عنصر للتمرير داخل الشاشة
              slivers: [ // عناصر قابلة للتمرير
                SliverToBoxAdapter( // عرض عناصر ثابتة
                  child: Column( // ترتيب العناصر عموديًا
                    crossAxisAlignment: CrossAxisAlignment.start, // محاذاة العناصر من اليسار
                    children: [
                      SpaceWidget(height: 32,), // مسافة فارغة
                      AllMealsAppBar(), // شريط التطبيق (App Bar) الخاص بالشاشة
                      SpaceWidget(height: 24,), // مسافة فارغة
                    ],
                  ),
                ),
                BlocBuilder<SystemMealsCubit, SystemMealsState>( // مراقبة حالة الكيوبت الخاص بالوجبات
                    builder: (context, state) {
                      if (state is GetAllMealsLoadingState) { // إذا كانت الحالة تحميل
                        return AllAvailableMealsLoadingWidget(); // عرض عنصر تحميل
                      }
                      else if (state is GetAllMealsSuccessState
                          && SystemMealsCubit.get(context).allMealsModel?.meals != null) { // إذا كانت الحالة نجاح وتم جلب الوجبات
                        return SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AllAvailableMealsText(), // عرض نص يشير إلى جميع الوجبات المتاحة
                              SpaceWidget(height: 24,), // مسافة فارغة
                              GridView.builder( // عرض الوجبات في شبكة
                                shrinkWrap: true, // بيمنع الشبكة من التوسع
                                physics: NeverScrollableScrollPhysics(), // منع التمرير في الشبكة
                                padding: EdgeInsetsDirectional.only(start: 24.w, end: 24.w), // تنسيق المسافات الداخلية
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( // تحديد عدد الأعمدة في الشبكة
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 21,
                                    crossAxisSpacing: 21,
                                    childAspectRatio: 153/172
                                ),
                                itemCount: SystemMealsCubit.get(context)
                                    .allMealsModel!
                                    .meals!
                                    .length, // تحديد عدد العناصر في الشبكة
                                itemBuilder: (context, index) {
                                  return GestureDetector( // عنصر تفاعلي عند الضغط عليه
                                    onTap: () {
                                      // الانتقال إلى شاشة تفاصيل الوجبة
                                    },
                                    child: GridMealItem( // عرض تفاصيل كل وجبة
                                      index: index,
                                      mealsList: SystemMealsCubit.get(context).allMealsModel!.meals!,
                                      meal: SystemMealsCubit.get(context)
                                          .allMealsModel!
                                          .meals![index],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      }
                      else if (state is GetCachedMealsSuccessState
                          && SystemMealsCubit.get(context).cachedSystemMeals != null) { // إذا كانت البيانات من الكاش
                        return SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AllAvailableMealsText(),
                              SpaceWidget(height: 24,), // مسافة فارغة
                              GridView.builder( // عرض الوجبات في شبكة
                                shrinkWrap: true, // بيمنع الشبكة من التوسع
                                physics: const NeverScrollableScrollPhysics(), // منع التمرير في الشبكة
                                padding: EdgeInsetsDirectional.only(start: 24.w, end: 24.w), // تنسيق المسافات الداخلية
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( // تحديد عدد الأعمدة في الشبكة
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 21,
                                    crossAxisSpacing: 21,
                                    childAspectRatio: 153/172
                                ),
                                itemCount: SystemMealsCubit
                                    .get(context)
                                    .cachedSystemMeals!
                                    .length, // تحديد عدد العناصر في الشبكة
                                itemBuilder: (context, index) {
                                  return GestureDetector( // عنصر تفاعلي عند الضغط عليه
                                    onTap: () {
                                      // الانتقال إلى شاشة تفاصيل الوجبة
                                    },
                                    child: GridMealItem( // عرض تفاصيل كل وجبة من الكاش
                                      index: index,
                                      mealsList: SystemMealsCubit
                                          .get(context)
                                          .cachedSystemMeals!,
                                      meal: SystemMealsCubit
                                          .get(context)
                                          .cachedSystemMeals![index],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      }
                      else if (state is GetCachedMealsFailureState) { // إذا فشل الحصول على بيانات الكاش
                        return SliverFillRemaining(
                            hasScrollBody: false,
                            child: NoMealsYetWidget()); // عرض عنصر "لا توجد وجبات بعد"
                      }
                      else if (state is GetAllMealsSuccessState &&
                          SystemMealsCubit.get(context).allMealsModel?.meals == null) { // إذا كانت الحالة نجاح ولكن ما فيش بيانات
                        return SliverFillRemaining(
                            hasScrollBody: false,
                            child: NoMealsYetWidget()); // عرض عنصر "لا توجد وجبات بعد"
                      }
                      else {
                        return AllAvailableMealsLoadingWidget(); // عرض عنصر تحميل
                      }
                    }),
                SliverToBoxAdapter(child: SpaceWidget(height: 80,)), // إضافة مسافة فارغة في نهاية القائمة
              ],
            ),
          )),
      floatingActionButton: _buildFloatingButton(context), // زر إضافة وجبة جديدة
    );
  }

  _buildFloatingButton(BuildContext context) { // دالة لإنشاء زر إضافة وجبة جديدة
    return FloatingActionButton(
        backgroundColor: AppColors.c121223, // لون الزر
        elevation: 0, // بدون ظل
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.r), // جعل الزر دائري
        ),
        onPressed: () { // عند الضغط على الزر
          navigate(context: context, route: Routes.addMealScreen); // الانتقال إلى شاشة إضافة وجبة جديدة
        },
        child: Center(child: Icon( // أيقونة الزر
          Icons.add, color: AppColors.white, size: 30.sp,))
    );
  }
}