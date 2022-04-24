part of 'add_april_bloc.dart';

abstract class AddAprilEvent extends Equatable {
  const AddAprilEvent();
  @override
  List<Object> get props => [];
}

class GetUserData extends AddAprilEvent {
}

class InsertAprilData extends AddAprilEvent {
  //add data
  final AprilModel aprilModel;
  const InsertAprilData(this.aprilModel);
}