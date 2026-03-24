


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/commons/commons.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';
import 'health_certificate_dot_container.dart';

class HealthCertificationSection extends StatelessWidget {
  const HealthCertificationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SignupCubit.get(context).healthCertificateImage==null?
    HealthCertificateDotContainer(
      onCameraTap: ()
      {
        imagePick(imageSource: ImageSource.camera).then((value) {
          SignupCubit.get(context).uploadHealthCertificateImage(image: value!);
        },);
        Navigator.pop(context);
      },
      onGalleryTap: ()
      {
        imagePick(imageSource: ImageSource.gallery).then((value) {
          SignupCubit.get(context).uploadHealthCertificateImage(image: value!);
        },);
        Navigator.pop(context);
      },
    ):
    HealthCertificateDotContainer(
      onDeletePhotoPressed: ()
      {
        SignupCubit.get(context).deleteHealthCertificateImage();
      },
      imagePath: SignupCubit.get(context).healthCertificateImage!.path,
    );
  }
}
