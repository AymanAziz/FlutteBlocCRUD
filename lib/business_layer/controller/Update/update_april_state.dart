part of 'update_april_bloc.dart';

abstract class UpdateAprilState extends Equatable {
  const UpdateAprilState();
  @override
  List<Object> get props => [];
}

class UpdateAprilInitial extends UpdateAprilState {}

class UpdateAprilLoading extends UpdateAprilState {}

class UpdateAprilLoad extends UpdateAprilState {
  final AprilModel aprilModel;
  const UpdateAprilLoad(this.aprilModel);
}

class UpdateAprilError extends UpdateAprilState {
  final String? message;
  const UpdateAprilError(this.message);
}