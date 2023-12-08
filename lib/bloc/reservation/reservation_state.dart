part of 'reservation_bloc.dart';

@immutable
abstract class ReservationState {}

class ReservationInitial extends ReservationState {}

class ReservationLoadingState extends ReservationState {}

class ReservationSuccessState extends ReservationState {
  final DateTime reservationDate;
  final TimeOfDay reservationTime;
  ReservationSuccessState(this.reservationDate, this.reservationTime);
}

class ReservationFailState extends ReservationState {
  final String message;
  ReservationFailState({required this.message});
}
