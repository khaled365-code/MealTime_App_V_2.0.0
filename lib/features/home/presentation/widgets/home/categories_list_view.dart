


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../cubits/home_lists_cubit/home_lists_cubit.dart';
import 'category_item.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      child: ListView.builder(
        padding: EdgeInsetsDirectional.only(start: 15.w),
        scrollDirection: Axis.horizontal,
        itemCount:  HomeListsCubit.get(context).allCategoriesList.length,
        itemBuilder:(context, index) => GestureDetector(
          onTap: ()
          {
            HomeListsCubit.get(context).changeCurrentSelectedCategoryPosition(index: index);
          },
          child: Padding(
            padding: EdgeInsetsDirectional.only(end: index!= HomeListsCubit.get(context).allCategoriesList.length-1? 7.w:0),
            child: CategoryItem(
                isItemSelected: index== HomeListsCubit.get(context).currentSelectedCategoryIndex,
                allCategoriesModel:  HomeListsCubit.get(context).allCategoriesList[index]),
          ),
        ),
      ),
    );
  }
}
