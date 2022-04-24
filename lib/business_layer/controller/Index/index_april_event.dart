part of 'index_april_bloc.dart';

abstract class IndexAprilEvent extends Equatable {
  const IndexAprilEvent();
  @override
  List<Object> get props => [];
}
class GetAprilList extends IndexAprilEvent {}