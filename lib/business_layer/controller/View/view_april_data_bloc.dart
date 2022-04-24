import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../DB/Model/aprilModel.dart';
import '../../DB/Provider/AprilIndexProvider.dart';

part 'view_april_data_event.dart';
part 'view_april_data_state.dart';

class ViewAprilDataBloc extends Bloc<ViewAprilDataEvent, ViewAprilDataState> {
  ViewAprilDataBloc() : super(ViewAprilDataInitial()) {
    final AprilIndexProvider aprilIndexProvider = AprilIndexProvider();

    on<GetAprilData>((event, emit) async {
    emit(ViewAprilLoading());
    final aprilData = await aprilIndexProvider.getSpecificData(event.aprilId);
    emit(ViewAprilLoad(aprilData));
    });
  }
}
