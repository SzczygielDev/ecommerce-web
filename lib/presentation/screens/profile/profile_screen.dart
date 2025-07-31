import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/screens/profile/bloc/profile_bloc.dart';
import 'package:ecommerce_web/presentation/screens/profile/view/edit_profile_view.dart';
import 'package:ecommerce_web/presentation/screens/profile/view/profile_details_view.dart';
import 'package:ecommerce_web/presentation/widget/generic_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  static const route = "/profile";

  final bool showEditFormOnLoad;

  const ProfileScreen({super.key, required this.showEditFormOnLoad});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _showEditForm = false;

  @override
  void initState() {
    if (widget.showEditFormOnLoad) {
      setState(() {
        _showEditForm = true;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GenericPage(
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          switch (state) {
            case ProfileLoadingState():
              return const Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(child: Center(child: CircularProgressIndicator()))
                ],
              );
            case ProfileLoadingErrorState():
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: Center(
                          child: Text(
                    state.message,
                    style: AppTypography.large1,
                  )))
                ],
              );
            case ProfileLoadedState():
              final client = state.client;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: FractionallySizedBox(
                  widthFactor: 0.6,
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _showEditForm
                            ? EditProfileView(
                                state: state,
                                closeEditViewPressed: () {
                                  setState(() {
                                    _showEditForm = false;
                                  });
                                  context
                                      .read<ProfileBloc>()
                                      .add(EditProfileFormClosedEvent());
                                },
                              )
                            : ProfileDetailsView(
                                client: client,
                                editProfilePressed: () {
                                  setState(() {
                                    _showEditForm = true;
                                  });
                                },
                              ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          "Zamówienia",
                          style: AppTypography.large1,
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
