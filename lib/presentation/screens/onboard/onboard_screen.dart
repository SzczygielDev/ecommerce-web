import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/config/app_typography.dart';
import 'package:ecommerce_web/presentation/screens/onboard/bloc/onboard_bloc.dart';
import 'package:ecommerce_web/presentation/screens/onboard/widget/onboard_city_input.dart';
import 'package:ecommerce_web/presentation/screens/onboard/widget/onboard_email_input.dart';
import 'package:ecommerce_web/presentation/screens/onboard/widget/onboard_house_number_input.dart';
import 'package:ecommerce_web/presentation/screens/onboard/widget/onboard_last_name_input.dart';
import 'package:ecommerce_web/presentation/screens/onboard/widget/onboard_name_input.dart';
import 'package:ecommerce_web/presentation/screens/onboard/widget/onboard_phone_number_input.dart';
import 'package:ecommerce_web/presentation/screens/onboard/widget/onboard_street_input.dart';
import 'package:ecommerce_web/presentation/widget/generic_button.dart';
import 'package:ecommerce_web/presentation/widget/generic_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/onboard_zip_code_input.dart';

class OnBoardScreen extends StatefulWidget {
  static const route = "/on-board";

  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _cityController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _streetController = TextEditingController();
  final _houseNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardBloc, OnboardState>(
      listener: (context, state) {
        if (state is OnboardLoadedState) {
          setState(() {
            _emailController.text = state.email;
          });
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: GenericPage(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: IntrinsicHeight(
                child: FractionallySizedBox(
                  widthFactor: 0.6,
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: FractionallySizedBox(
                        widthFactor: 0.8,
                        child: Builder(
                          builder: (context) {
                            switch (state) {
                              case OnboardLoadingState():
                                return const Center(
                                    child: CircularProgressIndicator());
                              case OnboardLoadedState():
                                return Column(
                                  spacing: 8,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Uzupełnij dane",
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
                                    OnboardNameInput(
                                      controller: _nameController,
                                    ),
                                    OnboardLastNameInput(
                                      controller: _lastNameController,
                                    ),
                                    OnboardEmailInput(
                                        controller: _emailController),
                                    OnboardPhoneNumberInput(
                                        controller: _phoneNumberController),
                                    SizedBox(
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
                                            child: OnboardCityInput(
                                                controller: _cityController)),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          child: OnboardZipCodeInput(
                                              controller: _zipCodeController),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: OnboardStreetInput(
                                              controller: _streetController),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                            child: OnboardHouseNumberInput(
                                                controller:
                                                    _houseNumberController)),
                                      ],
                                    ),
                                    const Spacer(),
                                    GenericButton(
                                        onPressed: () {
                                          final isValid = _formKey.currentState
                                                  ?.validate() ??
                                              false;
                                          if (isValid) {
                                            context
                                                .read<OnboardBloc>()
                                                .add(OnboardFormSubmitEvent(
                                                  name: _nameController.text,
                                                  lastName:
                                                      _lastNameController.text,
                                                  email: _emailController.text,
                                                  phone: _phoneNumberController
                                                      .text,
                                                  city: _cityController.text,
                                                  zipCode:
                                                      _zipCodeController.text,
                                                  street:
                                                      _streetController.text,
                                                  houseNumber:
                                                      _houseNumberController
                                                          .text,
                                                ));
                                          }
                                        },
                                        title: "Zapisz",
                                        size: const Size.fromHeight(48))
                                  ],
                                );
                              case OnboardErrorState():
                                return const Center(
                                    child: Text("Błąd ładowania danych"));
                            }
                          },
                        )),
                  ),
                ),
              ),
            ),
          )),
        );
      },
    );
  }
}
