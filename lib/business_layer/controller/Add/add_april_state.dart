part of 'add_april_bloc.dart';

abstract class AddAprilState extends Equatable {
  const AddAprilState();

  @override
  List<Object?> get props => [];
}

class AddAprilInitial extends AddAprilState {}

class AddAprilLoading extends AddAprilState {}

class AddAprilLoaded extends AddAprilState {}
