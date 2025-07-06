import 'package:bloc/bloc.dart';
import 'package:ecommerce_web/domain/auth/authentication_service_abstraction.dart';
import 'package:ecommerce_web/domain/auth/user_info.dart';
import 'package:ecommerce_web/domain/client/client.dart';
import 'package:ecommerce_web/domain/client/client_repository_abstraction.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationServiceAbstraction _authenticationService;
  final ClientRepositoryAbstraction _clientRepository;

  AuthenticationBloc(this._authenticationService, this._clientRepository)
      : super(UnauthenticatedState()) {
    on<SignInEvent>((event, emit) async {
      await _authenticationService.signIn();
    });
    on<LogOutRequestEvent>((event, emit) async {
      await _authenticationService.logout();
    });

    on<UserDataAcquiredEvent>((event, emit) async {
      final client = await _clientRepository.getCurrentClient();

      emit(AuthenticatedState(user: event.user, client: client));
    });

    on<UserLoggedOutEvent>((event, emit) async {
      emit(UnauthenticatedState());
    });

    _authenticationService.onAuthStateChanged.listen(
      (userInfo) {
        if (userInfo == null) {
          add(UserLoggedOutEvent());
        } else {
          add(UserDataAcquiredEvent(userInfo));
        }
      },
    );
  }

  @override
  Future<void> close() async {
    await _authenticationService.dispose();
    return super.close();
  }
}
