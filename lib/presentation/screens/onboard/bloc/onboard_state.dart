part of 'onboard_bloc.dart';

sealed class OnboardState extends Equatable {
  const OnboardState();

  @override
  List<Object> get props => [];
}

final class OnboardLoadingState extends OnboardState {}

enum OnboardFormSubmittingState { idle, loading, error }

final class OnboardLoadedState extends OnboardState {
  final String email;
  final OnboardFormSubmittingState formSubmittingState;

  const OnboardLoadedState(
      {required this.email,
      this.formSubmittingState = OnboardFormSubmittingState.idle});

  OnboardLoadedState copyWith({
    String? email,
    OnboardFormSubmittingState? formSubmittingState,
  }) {
    return OnboardLoadedState(
      email: email ?? this.email,
      formSubmittingState: formSubmittingState ?? this.formSubmittingState,
    );
  }

  @override
  List<Object> get props => [email, formSubmittingState];
}

final class OnboardErrorState extends OnboardState {}
