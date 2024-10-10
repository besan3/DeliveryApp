part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}
class AddOrderEvent extends HomeEvent{
  final String date;
  final String description_one;
  final String staff_names;
  const AddOrderEvent({required this.date, required this.description_one,required this.staff_names});
  @override
  List<Object?> get props => [date, description_one, staff_names];

}
class ShowOrdersEvent extends HomeEvent {
  final String start_at;
  final String end_at;
  const ShowOrdersEvent({required this.start_at, required this.end_at});

  @override
  List<Object?> get props => [start_at, end_at];
}
class ShowStaffOrdersEvent extends HomeEvent {
  final String start_at;
  final String end_at;
  const ShowStaffOrdersEvent({required this.start_at, required this.end_at});

  @override
  List<Object?> get props => [start_at, end_at];
}

class DatePickedEvent extends HomeEvent {
  final DateTime pickedDate;

  const DatePickedEvent(this.pickedDate);

  @override
  List<Object?> get props => [pickedDate];
}

class StartDatePickedEvent extends HomeEvent {
  final DateTime pickedDate;

  const StartDatePickedEvent(this.pickedDate);

  @override
  List<Object?> get props => [pickedDate];
}


class EndDatePickedEvent extends HomeEvent {
  final DateTime pickedDate;

  const EndDatePickedEvent(this.pickedDate);

  @override
  List<Object?> get props => [pickedDate];
}

class LogOutEvent extends HomeEvent {


  @override
  List<Object?> get props => [];
}
class StaffLogOutEvent extends HomeEvent {


  @override
  List<Object?> get props => [];
}