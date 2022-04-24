import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../DB/Model/aprilModel.dart';
import '../../DB/Provider/AprilIndexProvider.dart';
import '../../DB/Repository/aprilD.dart';

part 'index_april_event.dart';
part 'index_april_state.dart';

class IndexAprilBloc extends Bloc<IndexAprilEvent, IndexAprilState> {
  IndexAprilBloc() : super(IndexAprilInitial()) {

    final AprilIndexProvider aprilIndexProvider = AprilIndexProvider();

    on<GetAprilList>((event, emit) async {

      emit(IndexAprilLoading());
      final listApril = await aprilIndexProvider.getAllAprilDataProvider();
      emit(IndexAprilLoad(listApril));
    });
  }
}
