import 'package:bloc/bloc.dart';
import 'package:ecommerce_web/domain/auth/authentication_service_abstraction.dart';
import 'package:ecommerce_web/domain/client/client_repository_abstraction.dart';
import 'package:equatable/equatable.dart';

part 'onboard_event.dart';
part 'onboard_state.dart';

class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  final AuthenticationServiceAbstraction _authenticationService;
  final ClientRepositoryAbstraction _clientRepository;

  OnboardBloc(this._clientRepository, this._authenticationService)
      : super(OnboardLoadingState()) {
    on<OnboardLoadEvent>((event, emit) async {
      final user = await _authenticationService.getCurrentUser();

      if (user == null) {
        emit(OnboardErrorState());
        return;
      }

      emit(OnboardLoadedState(email: user.email));
    });

    on<OnboardFormSubmitEvent>((event, emit) async {
      emit((state as OnboardLoadedState)
          .copyWith(formSubmittingState: OnboardFormSubmittingState.loading));
      final success = await _clientRepository.createClient(
          event.name,
          event.lastName,
          event.email,
          event.phone,
          event.city,
          event.zipCode,
          event.street,
          event.houseNumber);

      if (!success) {
        emit((state as OnboardLoadedState)
            .copyWith(formSubmittingState: OnboardFormSubmittingState.error));
        return;
      }

      final client = await _clientRepository.getCurrentClient();

      if (client == null) {
        emit((state as OnboardLoadedState)
            .copyWith(formSubmittingState: OnboardFormSubmittingState.error));
        return;
      }

      await _authenticationService.refreshUserData();
    });
  }
}
