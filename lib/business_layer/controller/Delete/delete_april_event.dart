part of 'delete_april_bloc.dart';

abstract class DeleteAprilEvent extends Equatable {
  const DeleteAprilEvent();

  @override
  List<Object> get props => [];
}

class DeleteAprilData extends DeleteAprilEvent {
  final int aprilId;
  const DeleteAprilData(this.aprilId);
}

