import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'reservation_event.dart';
part 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {

  TimeOfDay reservationTime = const TimeOfDay(hour: 00, minute: 00);
  DateTime reservationDate = DateTime(0);
  int reservationGuest = 1;
  setReservationTime(TimeOfDay time) => reservationTime = time;
  TimeOfDay get getReservationTime => reservationTime;

  setReservationDate(DateTime date) => reservationDate = date;
  DateTime get getReservationDate => reservationDate;

  setReservationGuest(int guest) => reservationGuest = guest;
  int get getReservationGuest => reservationGuest;

  ReservationBloc() : super(ReservationInitial()) {
    on<ReservationEvent>((event, emit) {
      if (event is ReservationInitialEvent){
        reservationDate = DateTime(0);
        reservationTime = const TimeOfDay(hour: 00, minute: 00);
        reservationGuest = 1 ;
      }
      if (event is CreateReservationEvent){
        emit(ReservationLoadingState());
      }
    });
  }
}
