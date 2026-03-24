


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpaceWidget extends StatelessWidget {
  const SpaceWidget({super.key, this.height, this.width});

  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.w,
      height: height?.h,
    );
  }
}
