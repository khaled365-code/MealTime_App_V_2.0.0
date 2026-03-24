part of 'get_chef_data_cubit.dart';

@immutable
sealed class GetChefDataState {}

final class GetChefDataInitial extends GetChefDataState {}


final class GetChefDataLoadingState extends GetChefDataState {}
final class GetChefDataErrorState extends GetChefDataState {
  final ErrorModel errorModel;

  GetChefDataErrorState({required this.errorModel});
}
final class GetChefDataSuccessState extends GetChefDataState
{
  final ChefInfoModel chefInfoModel;
  GetChefDataSuccessState({required this.chefInfoModel});
}