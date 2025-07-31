import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/screens/profile/bloc/profile_bloc.dart';
import 'package:ecommerce_web/presentation/screens/profile/model/profile_updating_state.dart';
import 'package:ecommerce_web/presentation/screens/profile/widget/edit_profile_form_message.dart';
import 'package:ecommerce_web/presentation/screens/profile/widget/profile_city_input.dart';
import 'package:ecommerce_web/presentation/screens/profile/widget/profile_email_input.dart';
import 'package:ecommerce_web/presentation/screens/profile/widget/profile_house_number_input.dart';
import 'package:ecommerce_web/presentation/screens/profile/widget/profile_last_name_input.dart';
import 'package:ecommerce_web/presentation/screens/profile/widget/profile_name_input.dart';
import 'package:ecommerce_web/presentation/screens/profile/widget/profile_phone_number_input.dart';
import 'package:ecommerce_web/presentation/screens/profile/widget/profile_save_button.dart';
import 'package:ecommerce_web/presentation/screens/profile/widget/profile_street_input.dart';
import 'package:ecommerce_web/presentation/screens/profile/widget/profile_zip_code_input.dart';
import 'package:ecommerce_web/presentation/widget/generic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileView extends StatefulWidget {
  final Function() closeEditViewPressed;
  final ProfileLoadedState state;
  const EditProfileView({
    super.key,
    required this.closeEditViewPressed,
    required this.state,
  });

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final _formKey = GlobalKey<FormState>();
  late final _nameController =
      TextEditingController(text: widget.state.client.name);
  late final _lastNameController =
      TextEditingController(text: widget.state.client.lastName);
  late final _emailController =
      TextEditingController(text: widget.state.client.email);
  late final _phoneNumberController =
      TextEditingController(text: widget.state.client.phone);
  late final _cityController =
      TextEditingController(text: widget.state.client.city);
  late final _zipCodeController =
      TextEditingController(text: widget.state.client.zipCode);
  late final _streetController =
      TextEditingController(text: widget.state.client.street);
  late final _houseNumberController =
      TextEditingController(text: widget.state.client.houseNumber);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Edytuj dane",
            style: AppTypography.large1,
          ),
          const Divider(),
          const SizedBox(
            height: 16,
          ),
          const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Twoje dane",
                style: AppTypography.medium1,
              )),
          Column(
            spacing: 8,
            children: [
              ProfileNameInput(
                controller: _nameController,
              ),
              ProfileLastNameInput(
                controller: _lastNameController,
              ),
              ProfileEmailInput(controller: _emailController),
              ProfilePhoneNumberInput(controller: _phoneNumberController),
              const SizedBox(
                height: 32,
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Dane adresowe",
                    style: AppTypography.medium1,
                  )),
              Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: ProfileCityInput(controller: _cityController)),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: ProfileZipCodeInput(controller: _zipCodeController),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: ProfileStreetInput(controller: _streetController),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: ProfileHouseNumberInput(
                          controller: _houseNumberController)),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: GenericButton(
                        onPressed: widget.closeEditViewPressed,
                        title: "Zamknij",
                        size: const Size.fromHeight(48)),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: ProfileSaveButton(
                      working: widget.state.profileUpdatingState ==
                          ProfileUpdatingState.working,
                      onPressed: () {
                        final isValid =
                            _formKey.currentState?.validate() ?? false;
                        if (isValid) {
                          context.read<ProfileBloc>().add(ProfileUpdateEvent(
                                name: _nameController.text,
                                lastName: _lastNameController.text,
                                phone: _phoneNumberController.text,
                                city: _cityController.text,
                                zipCode: _zipCodeController.text,
                                street: _streetController.text,
                                houseNumber: _houseNumberController.text,
                              ));
                        }
                      },
                    ),
                  ),
                ],
              ),
              Builder(
                builder: (context) {
                  switch (widget.state.profileUpdatingState) {
                    case ProfileUpdatingState.success:
                      return const Row(
                        children: [
                          Expanded(
                            child: EditProfileFormMessage(
                                text: "Sukces!", color: AppColors.green),
                          ),
                        ],
                      );
                    case ProfileUpdatingState.error:
                      return Row(
                        children: [
                          Expanded(
                            child: EditProfileFormMessage(
                                text:
                                    widget.state.profileUpdatingErrorMessage ??
                                        "",
                                color: AppColors.red),
                          ),
                        ],
                      );

                    case ProfileUpdatingState.idle:
                    case ProfileUpdatingState.working:
                      return const SizedBox.shrink();
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
