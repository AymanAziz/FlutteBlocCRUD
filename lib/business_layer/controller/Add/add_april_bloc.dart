import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testaapril/business_layer/DB/Model/aprilModel.dart';

import '../../DB/Provider/AprilIndexProvider.dart';

part 'add_april_event.dart';
part 'add_april_state.dart';

class AddAprilBloc extends Bloc<AddAprilEvent, AddAprilState> {
  AddAprilBloc() : super(AddAprilInitial()) {
    final AprilIndexProvider aprilIndexProvider = AprilIndexProvider();

    on<InsertAprilData>((event, emit) async {
     await aprilIndexProvider.saveData(event.aprilModel);
    });
  }
}
