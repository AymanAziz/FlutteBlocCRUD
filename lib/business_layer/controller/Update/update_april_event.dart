part of 'update_april_bloc.dart';

abstract class UpdateAprilEvent extends Equatable {
  const UpdateAprilEvent();
@override
List<Object> get props => [];
}

class GetAprilData extends UpdateAprilEvent {
}

class UpdateAprilData extends UpdateAprilEvent {
  //add data
  final int aprilId;
  const UpdateAprilData(this.aprilId);
}