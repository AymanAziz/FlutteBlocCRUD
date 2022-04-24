part of 'view_april_data_bloc.dart';

abstract class ViewAprilDataEvent extends Equatable {
  const ViewAprilDataEvent();
  @override
  List<Object> get props => [];
}

class GetAprilData extends ViewAprilDataEvent {
  final int aprilId;
  const GetAprilData(this.aprilId);
}