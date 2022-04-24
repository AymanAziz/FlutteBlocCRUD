part of 'index_april_bloc.dart';

abstract class IndexAprilState extends Equatable {
  const IndexAprilState();
  @override
  List<Object> get props => [];
}

class IndexAprilInitial extends IndexAprilState {}

class IndexAprilLoading extends IndexAprilState {}

class IndexAprilLoad extends IndexAprilState {
  final List<AprilModel> listApril;
  const IndexAprilLoad(this.listApril);
}

class IndexAprilError extends IndexAprilState {}