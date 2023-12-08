part of 'bottom_nav_bloc.dart';

@immutable
abstract class BottomNavEvent {}

class HomeEvent extends BottomNavEvent{}

class PointEvent extends BottomNavEvent{}

class ReserveEvent extends BottomNavEvent{}

class MenuEvent extends BottomNavEvent{}

class ProfileEvent extends BottomNavEvent{}

