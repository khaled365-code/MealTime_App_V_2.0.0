import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../core/commons/commons.dart';
import '../../../../core/database/api/api_keys.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/services/internet_connection_service.dart';
import '../../../../core/widgets/space_widget.dart';
import '../cubits/get_specific_chef_meals_cubit/get_specific_chef_meals_cubit.dart';
import '../widgets/specific_chef_meals/grid_shimmer_chef_meal.dart';
import '../widgets/specific_chef_meals/grid_specific_chef_meal_item.dart';
import '../widgets/specific_chef_meals/specific_chef_meals_bar.dart';

class SpecificChefMealsScreen extends StatelessWidget {
  const SpecificChefMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async
            {
              if(await InternetConnectionCheckingService.checkInternetConnection()==true)
              {

                await GetSpecificChefMealsCubit.get(context).getChefMealsFromApiFun(CacheHelper().getData(key: ApiKeys.id));
                buildScaffoldMessenger(
                    context: context,
                    msg: 'chefMealsFetchedSuccessfully'.tr(context),
                    iconWidget: SvgPicture.asset(ImageConstants.checkCircleIcon),
                    snackBarBehavior: SnackBarBehavior.floating);

              }
              else
              {
                GetSpecificChefMealsCubit.get(context).getCachedChefMealsFun();
                buildScaffoldMessenger(
                    context: context,
                    msg: 'youAreOffline'.tr(context),
                    iconWidget: Icon(Icons.wifi_off,color: AppColors.white,),
                    snackBarBehavior: SnackBarBehavior.floating);
              }
            },
            edgeOffset: 1,
            color: AppColors.primaryColor,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 24.w, end: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SpaceWidget(height: 32,),
                       const  SpecificChefMealsAppBar(),
                        const SpaceWidget(height: 24,),
                        BlocBuilder<GetSpecificChefMealsCubit,GetSpecificChefMealsState>(
                          builder: (context, state) {
                            return Center(
                              child:  Text('found'.tr(context)+ ' ${isArabic()==false?
                              GetSpecificChefMealsCubit
                                  .get(context)
                                  .chefMeals
                                  ?.length ?? GetSpecificChefMealsCubit.get(context).cachedChefMeals?.length??0:
                              translateNumbersToArabic(GetSpecificChefMealsCubit
                                  .get(context)
                                  .chefMeals
                                  ?.length ?? GetSpecificChefMealsCubit.get(context).cachedChefMeals?.length??0)} '+ 'meals'.tr(context),
                                  style: AppTextStyles.bold28(context).copyWith(
                                      color: AppColors.c32343E
                                  )),
                            );
                          },
                        ),
                        SpaceWidget(height: 70,),


                      ],
                    ),
                  ),
                ),
                BlocBuilder<GetSpecificChefMealsCubit, GetSpecificChefMealsState>(
                  builder: (context, state) {
                    if (state is GetSpecificChefMealsLoadingState)
                    {
                      return  SliverToBoxAdapter(
                        child: GridView.custom(
                          padding:  EdgeInsets.symmetric(horizontal: 24.w),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          childrenDelegate: SliverChildBuilderDelegate(
                                (context, index) => const GridShimmerChefMealItem(),
                            childCount: 10,
                          ),
                          gridDelegate: SliverWovenGridDelegate.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 70,
                            crossAxisSpacing: 30,
                            pattern: [
                              const WovenGridTile(.55),
                              const WovenGridTile(
                                  5 / 7,
                                  alignment: AlignmentDirectional.bottomCenter
                              ),
                            ],

                          ),
                        ),
                      );

                    }
                    else if
                    (
                    state is GetSpecificChefMealsSuccessState &&
                    GetSpecificChefMealsCubit.get(context).chefMeals!=null)
                    {

                      return  SliverToBoxAdapter(
                        child: GridView.custom(
                          padding:  EdgeInsets.symmetric(horizontal: 24.w),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          childrenDelegate: SliverChildBuilderDelegate(
                            (context, index) => GridSpecificChefMealsItem(
                              meal: GetSpecificChefMealsCubit.get(context).chefMeals![index],
                            ),
                            childCount: GetSpecificChefMealsCubit.get(context).chefMeals!.length,
                          ),
                          gridDelegate: SliverWovenGridDelegate.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 70,
                            crossAxisSpacing: 30,
                            pattern: [
                              const   WovenGridTile(.55),
                              const  WovenGridTile(
                                5/7,
                                alignment: AlignmentDirectional.bottomCenter
                              ),
                            ],

                          ),
                        ),
                      );

                    }
                    else if (state is GetSpecificChefMealsSuccessState &&
                        GetSpecificChefMealsCubit.get(context).chefMeals==null
                    )
                      {
                        return const SliverToBoxAdapter(
                          child: SizedBox.shrink(),
                        );
                      }
                    else if (state is GetCachedChefMealsSuccessState)
                    {
                      return SliverToBoxAdapter(
                        child: GridView.custom(
                          padding:  EdgeInsets.symmetric(horizontal: 24.w),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          childrenDelegate: SliverChildBuilderDelegate(
                                (context, index) => GridSpecificChefMealsItem(
                              meal: GetSpecificChefMealsCubit.get(context).cachedChefMeals![index],
                            ),
                            childCount: GetSpecificChefMealsCubit.get(context).cachedChefMeals!.length,
                          ),
                          gridDelegate: SliverWovenGridDelegate.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 70,
                            crossAxisSpacing: 30,
                            pattern: [
                              const WovenGridTile(.55),
                              const WovenGridTile(
                                  5 / 7,
                                  alignment: AlignmentDirectional.bottomCenter
                              ),
                            ],

                          ),
                        ),
                      );
                    }
                    else if (state is GetCachedChefMealsFailureState)
                    {
                      return const SliverToBoxAdapter(
                        child: SizedBox.shrink(),
                      );
                    }
                    else
                      {
                        return  SliverToBoxAdapter(
                          child: GridView.custom(
                            padding:  EdgeInsets.symmetric(horizontal: 24.w),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            childrenDelegate: SliverChildBuilderDelegate(
                                  (context, index) => const GridShimmerChefMealItem(),
                              childCount: 10,
                            ),
                            gridDelegate: SliverWovenGridDelegate.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 70,
                              crossAxisSpacing: 30,
                              pattern: [
                                WovenGridTile(.55),
                                WovenGridTile(
                                    5/7,
                                    alignment: AlignmentDirectional.bottomCenter
                                ),
                              ],

                            ),
                          ),
                        );
                      }
                  },),
                const SliverToBoxAdapter(child: SpaceWidget(height: 40,)),


              ],
            ),
          )),
    );
  }
}

