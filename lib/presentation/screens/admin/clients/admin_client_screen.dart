import 'package:ecommerce_web/presentation/screens/admin/clients/bloc/admin_client_bloc.dart';
import 'package:ecommerce_web/presentation/screens/admin/clients/widget/client_table_header.dart';
import 'package:ecommerce_web/presentation/screens/admin/clients/widget/client_table_item.dart';
import 'package:ecommerce_web/presentation/screens/admin/widget/default_admin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminClientScreen extends StatefulWidget {
  static const route = "/admin/clients";
  const AdminClientScreen({super.key});

  @override
  State<AdminClientScreen> createState() => _AdminClientScreenState();
}

class _AdminClientScreenState extends State<AdminClientScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminClientBloc, AdminClientState>(
      builder: (context, state) {
        return DefaultAdminScreen(
          children: [
            Builder(
              builder: (context) {
                switch (state.loadingState) {
                  case AdminClientLoadingState.working:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case AdminClientLoadingState.success:
                    return Table(
                      columnWidths: const <int, TableColumnWidth>{
                        5: FlexColumnWidth(3),
                      },
                      children: [
                        ClientTableHeader(),
                        ...state.clients
                            .map((client) => ClientTableItem(client))
                      ],
                    );

                  case AdminClientLoadingState.error:
                    return const Center(
                      child: Text("Error while loading clients"),
                    );
                }
              },
            )
          ],
        );
      },
    );
  }
}
