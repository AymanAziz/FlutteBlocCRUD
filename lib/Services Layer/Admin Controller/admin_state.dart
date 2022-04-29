part of 'admin_bloc.dart';

abstract class AdminState extends Equatable {
  const AdminState();
  @override
  List<Object> get props => [];
}

class AdminInitial extends AdminState {}

class AdminLoading extends AdminState {}

//update admin load
class UpdateAdminLoad extends AdminState {
  final AdminModel adminModel;
  const UpdateAdminLoad(this.adminModel);
}

//display list admin Index
class IndexAdminLoad extends AdminState {
  final List<AdminModel> adminModel;
  const IndexAdminLoad(this.adminModel);
}

class AdminError extends AdminState {
  final String? message;
  const AdminError(this.message);
}