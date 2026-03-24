import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import 'package:new_meal_time_app/core/utils/app_colors.dart';
import '../../../../core/commons/commons.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/services/internet_connection_service.dart';
import '../../../../core/utils/services/local_notifications_service.dart';
import '../../../../core/widgets/space_widget.dart';
import '../../../profile/presentation/views/custom_drawer_screen.dart';
import '../cubits/get_system_meals_cubit/system_meals_cubit.dart';
import '../cubits/home_lists_cubit/home_lists_cubit.dart';
import '../widgets/home/all_categories_row.dart';
import '../widgets/home/all_meals_row.dart';
import '../widgets/home/carousel_slider_widget.dart';
import '../widgets/home/categories_list_view.dart';
import '../widgets/home/home_app_bar.dart';
import '../widgets/home/home_meal_container.dart';
import '../widgets/home/home_no_meals_yet_widget.dart';
import '../widgets/home/sliver_list_loading_meals.dart';
import '../widgets/home/welcome_text_widget.dart';

class HomeScreen extends StatefulWidget { // تعريف الشاشة كـ Stateful عشان تدعم تغييرات الحالة
  const HomeScreen({super.key}); // كونستراكتور

  @override
  State<HomeScreen> createState() => _HomeScreenState(); // إنشاء الحالة المرتبطة بالشاشة
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() { // دالة بتتنفذ أول ما يتم إنشاء الشاشة
    super.initState();
    // الكود المعلق هنا كان بيضيف مستمع للإشعارات لو مكنش فيه مستمع بالفعل
  }

  @override
  Widget build(BuildContext context) { // دالة مسئولة عن بناء واجهة المستخدم
    return Scaffold( // تقسيم الشاشة لعناصر مختلفة
      backgroundColor: AppColors.white, // خلفية الشاشة لونها أبيض
      body: SafeArea( // لتجنب التداخل مع الأجزاء العلوية أو السفلية للشاشة
          child: RefreshIndicator( // عنصر لتحديث المحتوى عند السحب لأسفل
            onRefresh: () async { // الدالة اللي بتتنفذ عند التحديث
              if (await InternetConnectionCheckingService.checkInternetConnection() == true) { // التحقق من وجود اتصال بالإنترنت
                await SystemMealsCubit.get(context).getAllMealsFromApiFun(); // استدعاء الدالة لجلب البيانات من الـ API
                buildScaffoldMessenger( // عرض رسالة نجاح
                    context: context,
                    msg: 'mealsFetchedSuccessfully'.tr(context),
                    iconWidget: SvgPicture.asset(ImageConstants.checkCircleIcon),
                    snackBarBehavior: SnackBarBehavior.floating);
              } else { // في حالة عدم وجود اتصال
                buildScaffoldMessenger( // عرض رسالة انقطاع الاتصال
                    context: context,
                    msg: 'youAreOffline'.tr(context),
                    iconWidget: Icon(
                      Icons.wifi_off,
                      color: AppColors.white,
                    ),
                    snackBarBehavior: SnackBarBehavior.floating);
              }
            },
            edgeOffset: 1, // المسافة بين أعلى الشاشة ومؤشر التحديث
            color: AppColors.primaryColor, // لون مؤشر التحديث
            child: CustomScrollView( // عنصر للتمرير داخل الشاشة
              slivers: [ // عناصر قابلة للتمرير
                SliverToBoxAdapter( // عنصر لعرض محتويات غير قابلة للتمرير بشكل طبيعي
                  child: Column( // ترتيب العناصر عموديًا
                    crossAxisAlignment: CrossAxisAlignment.start, // محاذاة العناصر من اليسار
                    children: [
                      SpaceWidget(height: 32), // مسافة فارغة
                      HomeAppBar(), // شريط التطبيق (App Bar) الخاص بالشاشة
                      SpaceWidget(height: 24), // مسافة فارغة
                      WelcomeTextWidget(), // عنصر النص الترحيبي
                      SpaceWidget(height: 16), // مسافة فارغة
                      CarouselSliderWidget(), // شريط عرض الصور المتحركة///////////////////
                      SpaceWidget(height: 32), // مسافة فارغة
                      AllCategoriesRow(), // صف يعرض كل الأقسام
                      SpaceWidget(height: 20), // مسافة فارغة
                      BlocBuilder<HomeListsCubit, HomeListsState>( // مراقبة حالة الكيوبت
                          builder: (context, state) {
                            return CategoriesListView(); // عرض قائمة الأقسام
                          }),
                      SpaceWidget(height: 32), // مسافة فارغة
                      AllMealsRowWidget(), // صف يعرض جميع الوجبات
                      SpaceWidget(height: 20), // مسافة فارغة
                    ],
                  ),
                ),
                BlocBuilder<SystemMealsCubit, SystemMealsState>( // مراقبة حالة الكيوبت الخاص بالوجبات
                    builder: (context, state) {
                      if (state is GetAllMealsLoadingState) { // لو الحالة هي تحميل
                        return SliverListLoadingMeals(); // عرض عنصر تحميل
                      }
                      if (state is GetAllMealsSuccessState && // لو الحالة نجاح وتم جلب الوجبات
                          SystemMealsCubit.get(context).allMealsModel?.meals != null) {
                        return SliverList( // عرض قائمة قابلة للتمرير
                          delegate: SliverChildBuilderDelegate( // بناء العناصر بشكل ديناميكي
                                (context, index) => GestureDetector( // عنصر تفاعلي
                              onTap: () { // عند الضغط على العنصر
                                // الانتقال إلى شاشة تفاصيل الوجبة (الكود معلق هنا)
                              },
                              child: Padding( // إضافة مسافات داخلية للعناصر
                                padding: EdgeInsetsDirectional.only(
                                    start: 24.w, end: 24.w, bottom: 28.h),
                                child: HomeMealContainer( // عنصر يعرض تفاصيل الوجبة
                                  meal: SystemMealsCubit.get(context)
                                      .allMealsModel!
                                      .meals![index],
                                ),
                              ),
                            ),
                            childCount: SystemMealsCubit.get(context) // عدد العناصر يساوي طول قائمة الوجبات
                                .allMealsModel!
                                .meals!
                                .length,
                          ),
                        );
                      } else if (state is GetCachedMealsSuccessState && // لو البيانات من الكاش
                          SystemMealsCubit.get(context).cachedSystemMeals != null) {
                        return SliverList( // عرض قائمة الوجبات من الكاش
                          delegate: SliverChildBuilderDelegate(
                                (context, index) => GestureDetector(
                              onTap: () {
                                // الانتقال إلى شاشة تفاصيل الوجبة
                              },
                              child: Padding(
                                padding: EdgeInsetsDirectional.only(
                                    start: 24.w, end: 24.w, bottom: 28.h),
                                child: HomeMealContainer( // عنصر يعرض تفاصيل الوجبة من الكاش
                                  meal: SystemMealsCubit.get(context)
                                      .cachedSystemMeals![index],
                                ),
                              ),
                            ),
                            childCount: SystemMealsCubit.get(context)
                                .cachedSystemMeals!
                                .length,
                          ),
                        );
                      } else if (state is GetCachedMealsFailureState) { // لو فشل الحصول على بيانات الكاش
                        return SliverToBoxAdapter(child: HomeNoMealsYetWidget()); // عرض عنصر "لا توجد وجبات بعد"
                      } else if (state is GetAllMealsSuccessState &&
                          SystemMealsCubit.get(context).allMealsModel?.meals ==
                              null) { // لو الحالة نجاح ولكن ما فيش بيانات
                        return SliverToBoxAdapter(child: HomeNoMealsYetWidget());
                      } else { // الحالة الافتراضية
                        return SliverListLoadingMeals(); // عرض عنصر تحميل
                      }
                    }),
                SliverToBoxAdapter( // إضافة مسافة فارغة في نهاية القائمة
                    child: SpaceWidget(
                      height: 32,
                    ))
              ],
            ),
          )),
    );
  }
}

