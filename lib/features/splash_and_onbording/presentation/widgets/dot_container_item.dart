


import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotContainerItem extends StatelessWidget {
  const DotContainerItem({super.key, required this.isActive});


  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      width: 10.w,
      decoration: BoxDecoration(
          color: isActive==true? Color(0xffFF7622):Color(0xffFFE1CE),
          shape: BoxShape.circle),
    );
  }
}
