import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testaapril/business_layer/DB/Model/aprilModel.dart';

import '../../DB/Provider/AprilIndexProvider.dart';

part 'update_april_event.dart';
part 'update_april_state.dart';

class UpdateAprilBloc extends Bloc<UpdateAprilEvent, UpdateAprilState> {
  UpdateAprilBloc() : super(UpdateAprilInitial()) {
    final AprilIndexProvider aprilIndexProvider = AprilIndexProvider();

    //get specific data from database
    on<GetAprilData>((event, emit) async {
    emit(UpdateAprilLoading());
    final getSpecificAprilData = await aprilIndexProvider.getSpecificData(event.aprilId);
    emit(UpdateAprilLoad(getSpecificAprilData));
    });

    //update specific data from database
    on<UpdateAprilData>((event, emit) async {
      await aprilIndexProvider.updateData(event._aprilModel);
    });
  }
}
