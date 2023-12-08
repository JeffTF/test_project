import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavInitial()) {
    on<BottomNavEvent>((event, emit) {
      if (event is HomeEvent){
        emit(HomeState());
      }
      if (event is PointEvent){
        emit(PointState());
      }
      if (event is ReserveEvent){
        emit(ReserveState());
      }
      if (event is MenuEvent){
        emit(MenuState());
      }
      if (event is ProfileEvent){
        emit(ProfileState());
      }
    });
  }
}
