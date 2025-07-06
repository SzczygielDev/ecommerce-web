part of 'onboard_bloc.dart';

sealed class OnboardEvent extends Equatable {
  const OnboardEvent();

  @override
  List<Object> get props => [];
}

class OnboardLoadEvent extends OnboardEvent {}

class OnboardFormSubmitEvent extends OnboardEvent {
  final String name;
  final String lastName;
  final String email;
  final String phone;
  final String city;
  final String zipCode;
  final String street;
  final String houseNumber;

  const OnboardFormSubmitEvent({
    required this.name,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.city,
    required this.zipCode,
    required this.street,
    required this.houseNumber,
  });
}
