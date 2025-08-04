import 'package:bloc/bloc.dart';
import 'package:ecommerce_web/domain/client/client.dart';
import 'package:ecommerce_web/domain/client/client_repository_abstraction.dart';
import 'package:ecommerce_web/domain/order/order.dart';
import 'package:ecommerce_web/domain/order/order_repository_abstraction.dart';
import 'package:ecommerce_web/presentation/screens/profile/model/profile_updating_state.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ClientRepositoryAbstraction clientRepository;
  final Logger logger;
  final OrderRepositoryAbstraction orderRepository;

  ProfileBloc(
      {required this.clientRepository,
      required this.logger,
      required this.orderRepository})
      : super(ProfileLoadingState()) {
    on<ProfileOnLoadEvent>((event, emit) async {
      final client = await clientRepository.getCurrentClient();

      if (client == null) {
        logger.e(
            "Failed to fetch current client while handling ProfileOnLoadEvent");
        emit(const ProfileLoadingErrorState(message: "Błąd ładowania danych"));
        return;
      }

      final orders = await orderRepository.getOrders();

      emit(ProfileLoadedState(client: client, orders: orders));
    });

    on<ProfileUpdateEvent>(
      (event, emit) async {
        emit((state as ProfileLoadedState)
            .copyWith(profileUpdatingState: ProfileUpdatingState.working));

        final updatedClient = await clientRepository.updateClient(
            event.name,
            event.lastName,
            event.phone,
            event.city,
            event.zipCode,
            event.street,
            event.houseNumber);

        if (updatedClient == null) {
          logger.e("Failed to update client");
          emit((state as ProfileLoadedState).copyWith(
              profileUpdatingState: ProfileUpdatingState.error,
              profileUpdatingErrorMessage:
                  "Błąd podczas aktualizacji użytkownika"));
          return;
        }

        emit((state as ProfileLoadedState).copyWith(
            profileUpdatingState: ProfileUpdatingState.success,
            client: updatedClient));
      },
    );

    on<EditProfileFormClosedEvent>(
      (event, emit) {
        emit((state as ProfileLoadedState).copyWith(
          profileUpdatingState: ProfileUpdatingState.idle,
        ));
      },
    );
  }
}
