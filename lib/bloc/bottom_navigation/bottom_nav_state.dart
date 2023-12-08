part of 'bottom_nav_bloc.dart';

@immutable
abstract class BottomNavState {}

class BottomNavInitial extends BottomNavState {}

class HomeState extends BottomNavState {}

class PointState extends BottomNavState {}

class ReserveState extends BottomNavState {}

class MenuState extends BottomNavState {}

class ProfileState extends BottomNavState {}