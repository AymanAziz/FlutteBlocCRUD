import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testaapril/Data%20Layer/Model/User%20Model.dart';
import '../../Data Layer/Provider/User Provider.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {

    final UserProvider userProvider = UserProvider();

    //get all user list
    on<GetUserList>((event, emit) async {
      emit(UserLoading());
      final listUser = await userProvider.getAllUserlDataProvider();
      emit(IndexUserLoad(listUser));
    });

    //insert user
    on<InsertUserData>((event, emit) async {
       await userProvider.saveUserData(event.userModel);
    });

    //delete
    on<DeleteUserData>((event, emit) async{
      await  userProvider.deleteUserData(event.userId);
    });

    //get specific user
    on<GetUserData>((event, emit) async{
      emit(UserLoading());
      final updateUser = await  userProvider.getSpecificUserDataProvider(event.userId);
      emit(UpdateUserLoad(updateUser));
    });

    //delete
    on<UpdateUserData>((event, emit) async{
      await  userProvider.updateUserDataProvider(event.userModel);
    });
  }
}
