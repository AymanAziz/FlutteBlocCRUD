import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_april_event.dart';
part 'update_april_state.dart';

class UpdateAprilBloc extends Bloc<UpdateAprilEvent, UpdateAprilState> {
  UpdateAprilBloc() : super(UpdateAprilInitial()) {
    on<UpdateAprilEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
