import 'package:bloc/bloc.dart';
import 'package:ecommerce_web/domain/client/client.dart';
import 'package:ecommerce_web/domain/client/client_repository_abstraction.dart';
import 'package:equatable/equatable.dart';

part 'admin_client_event.dart';
part 'admin_client_state.dart';

class AdminClientBloc extends Bloc<AdminClientEvent, AdminClientState> {
  final ClientRepositoryAbstraction clientRepository;
  AdminClientBloc({required this.clientRepository})
      : super(const AdminClientState()) {
    on<AdminClientOnLoadEvent>((event, emit) async {
      final clients = await clientRepository.getAll();

      emit(state.copyWith(
          clients: clients, loadingState: AdminClientLoadingState.success));
    });
  }
}
