


import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../cubits/home_lists_cubit/home_lists_cubit.dart';
import 'carousel_container_item.dart';


class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding( // إضافة Padding حول العنصر
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: 15.w), // تحديد المسافة حول العنصر بشكل أفقي
      child: CarouselSlider( // استخدام عنصر CarouselSlider لعرض الشرائح
        options: CarouselOptions( // إعدادات الـ Carousel
          autoPlay: true, // تفعيل التشغيل التلقائي للشرائح
          scrollDirection: Axis.horizontal, // تحديد اتجاه التمرير ليكون أفقي
          aspectRatio: 327 / 295, // تحديد نسبة العرض إلى الارتفاع للـ Carousel
          enableInfiniteScroll: true, // تفعيل التمرير اللانهائي للشرائح
          clipBehavior: Clip.none, // عدم قص العناصر
          viewportFraction: 1, // عرض العنصر بالكامل في الـ Carousel
          initialPage: 0, // تحديد الصفحة الأولية التي يتم عرضها
          autoPlayInterval: Duration(seconds: 3), // تحديد فترة التبديل التلقائي بين الشرائح
          autoPlayCurve: Curves.easeIn, // تحديد منحنى الانتقال بين الشرائح
        ),
        items: [1, 2].map((i) { // إنشاء العناصر التي سيتم عرضها في الـ Carousel
          return Builder(
            builder: (BuildContext context) {
              return CarouselContainerItem( // عرض عنصر Carousel لكل شريحة
                index: i,
                carouselSliderModel:  HomeListsCubit.get(context).carouselSliderList[i - 1], // الحصول على البيانات الخاصة بكل شريحة من الـ cubit
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
