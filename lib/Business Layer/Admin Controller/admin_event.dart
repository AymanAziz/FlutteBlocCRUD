part of 'admin_bloc.dart';

abstract class AdminEvent extends Equatable {
  const AdminEvent();
  @override
  List<Object> get props => [];
}
//get list of admin data
class GetAdminList extends AdminEvent {}

//add data
class InsertAdminData extends AdminEvent {
  final AdminModel adminModel;
  const InsertAdminData(this.adminModel);
}
//delete admin data
class DeleteAdminData extends AdminEvent {
  final int adminId;
  const DeleteAdminData(this.adminId);
}

//get specific admin data
class GetAdminData extends AdminEvent {
  final int adminId;
  const GetAdminData(this.adminId);
}

//udata admin data
class UpdateAdminData extends AdminEvent {
  final AdminModel adminModel;
  const UpdateAdminData(this.adminModel);
}