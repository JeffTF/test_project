part of 'reservation_bloc.dart';

@immutable
abstract class ReservationEvent {}
class ReservationInitialEvent extends ReservationEvent {}

class CreateReservationEvent extends ReservationEvent {
  CreateReservationEvent();
}
