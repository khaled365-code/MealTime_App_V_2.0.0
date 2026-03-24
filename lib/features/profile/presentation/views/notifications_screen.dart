import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:new_meal_time_app/core/localization/app_localization.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/space_widget.dart';
import '../cubits/notifications_cubit/notifications_cubit.dart';
import '../widgets/notifications/notification_item.dart';
import '../widgets/notifications/notifications_app_bar.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      SpaceWidget(height: 32,),
                      NotificationsAppBar(),
                      SpaceWidget(height: 24,),
                      BlocBuilder<NotificationsCubit, NotificationsState>(
                        builder: (context, state)
                        {
                          if(state is GetLocalNotificationsSuccessState)
                            {
                              return ListView.separated(
                                padding: EdgeInsetsDirectional.zero,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: NotificationsCubit.get(context).localNotificationsList.length,
                                separatorBuilder: (context, index) =>
                                    Divider(
                                      height: 32.h,
                                      thickness: 4,
                                      color: AppColors.cF0F4F9,
                                    ),
                                itemBuilder: (context, index) =>
                                    Slidable(
                                      endActionPane:  ActionPane(
                                        motion: ScrollMotion(),
                                        children: [
                                          SlidableAction(
                                            onPressed: (_)
                                            {
                                              NotificationsCubit.get(context).deleteSpecificNotification(
                                                   localNotificationId: NotificationsCubit.get(context).localNotificationsList[index].id, index: index);
                                            },
                                            backgroundColor: AppColors.primaryColor,
                                            icon: Icons.delete,
                                            label: 'delete'.tr(context),
                                            foregroundColor: AppColors.white,


                                          ),
                                        ],
                                      ),
                                      child: NotificationItem(
                                        notificationModel: NotificationsCubit.get(context).localNotificationsList[index],
                                      ),
                                    ),);
                            }
                          else
                            {
                              return SizedBox.shrink();
                            }
                        },
                      ),
                      SpaceWidget(height: 32,)

                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
