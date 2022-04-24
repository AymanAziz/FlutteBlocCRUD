part of 'update_april_bloc.dart';

abstract class UpdateAprilEvent extends Equatable {
  const UpdateAprilEvent();
@override
List<Object> get props => [];
}

class GetAprilData extends UpdateAprilEvent {
  final int aprilId;
  const GetAprilData(this.aprilId);
}

class UpdateAprilData extends UpdateAprilEvent {
  //add data
  final AprilModel _aprilModel;
  const UpdateAprilData(this._aprilModel);
}