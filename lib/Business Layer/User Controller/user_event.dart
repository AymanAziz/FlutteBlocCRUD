part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
  @override
  List<Object> get props => [];
}
//get list of user data
class GetUserList extends UserEvent {}

//add data
class InsertUserData extends UserEvent {
  final UserModel userModel;
  const InsertUserData(this.userModel);
}
//delete user data
class DeleteUserData extends UserEvent {
  final int userId;
  const DeleteUserData(this.userId);
}

//get specific user data
class GetUserData extends UserEvent {
  final int userId;
  const GetUserData(this.userId);
}

//udata user data
class UpdateUserData extends UserEvent {
  final UserModel userModel;
  const UpdateUserData(this.userModel);
}