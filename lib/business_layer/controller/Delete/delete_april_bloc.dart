import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../DB/Provider/AprilIndexProvider.dart';

part 'delete_april_event.dart';
part 'delete_april_state.dart';

class DeleteAprilBloc extends Bloc<DeleteAprilEvent, DeleteAprilState> {
  DeleteAprilBloc() : super(DeleteAprilInitial()) {

    final AprilIndexProvider aprilIndexProvider = AprilIndexProvider();

    on<DeleteAprilData>((event, emit) async{
      await  aprilIndexProvider.deleteData(event.aprilId);
    });
  }
}
