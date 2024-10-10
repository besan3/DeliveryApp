part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}
class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}
class AuthLogOutState extends HomeState {

  @override
  List<Object> get props => [];


}
class AddOrderSuccess extends HomeState {
  final AddOrderEntity addOrderEntity;
  const AddOrderSuccess({required this.addOrderEntity});
  @override
  List<Object?> get props => [addOrderEntity];

}
class HomeErrorState extends HomeState {
  final String message;

  @override
  List<Object> get props => [message];

  const HomeErrorState({
    required this.message,
  });
}

class ShowOrdersSuccessState extends HomeState {
  final List<OrderDataEntity> orderEntity;
  const ShowOrdersSuccessState({required this.orderEntity});
  @override
  List<Object?> get props => [orderEntity];
}
class ShowStaffOrdersSuccessState extends HomeState {
  final List<OrderDataEntity> orderEntity;
  const ShowStaffOrdersSuccessState({required this.orderEntity});
  @override
  List<Object?> get props => [orderEntity];
}

class DatePickedState extends HomeState {
  final String selectedDate;

const DatePickedState(this.selectedDate);

  @override
  List<Object?> get props => [selectedDate];  // State when a date is picked successfully
}
class StartDatePickedState extends HomeState {
  final String selectedDate;

  const StartDatePickedState(this.selectedDate);

  @override
  List<Object?> get props => [selectedDate];  // State when a date is picked successfully
}
class EndDatePickedState extends HomeState {
  final String selectedDate;

  const EndDatePickedState(this.selectedDate);

  @override
  List<Object?> get props => [selectedDate];  // State when a date is picked successfully
}