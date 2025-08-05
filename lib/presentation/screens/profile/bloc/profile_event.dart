part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileOnLoadEvent extends ProfileEvent {}

class ProfileUpdateEvent extends ProfileEvent {
  final String name;
  final String lastName;

  final String phone;
  final String city;
  final String zipCode;
  final String street;
  final String houseNumber;

  const ProfileUpdateEvent({
    required this.name,
    required this.lastName,
    required this.phone,
    required this.city,
    required this.zipCode,
    required this.street,
    required this.houseNumber,
  });
}

class EditProfileFormClosedEvent extends ProfileEvent {}

class ActivatePremiumAccountEvent extends ProfileEvent {}

class DeactivatePremiumAccountEvent extends ProfileEvent {}
