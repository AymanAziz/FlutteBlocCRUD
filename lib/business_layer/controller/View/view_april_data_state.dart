part of 'view_april_data_bloc.dart';

abstract class ViewAprilDataState extends Equatable {
  const ViewAprilDataState();
  @override
  List<Object> get props => [];
}

class ViewAprilDataInitial extends ViewAprilDataState {}

class ViewAprilLoading extends ViewAprilDataState {}

class ViewAprilLoad extends ViewAprilDataState {
  final AprilModel aprilModel;
  const ViewAprilLoad(this.aprilModel);
}