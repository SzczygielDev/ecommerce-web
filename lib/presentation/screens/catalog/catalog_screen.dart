import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/screens/catalog/bloc/catalog_bloc.dart';
import 'package:ecommerce_web/presentation/screens/catalog/view/catalog_main_section.dart';
import 'package:ecommerce_web/presentation/screens/catalog/view/catalog_side_section.dart';
import 'package:ecommerce_web/presentation/screens/catalog/widget/catalog_header.dart';
import 'package:ecommerce_web/presentation/widget/global_appbar.dart';
import 'package:ecommerce_web/presentation/widget/global_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogBloc, CatalogState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: GlobalAppBar(
              context: context,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Container(
                      color: AppColors.lightGrey,
                      child: const Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 30),
                              child: Column(
                                children: [
                                  CatalogHeader(),
                                  Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Column(
                                      children: [
                                        IntrinsicHeight(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              CatalogSideSection(),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 45),
                                                child: VerticalDivider(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              CatalogMainSection()
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                  const GlobalFooter()
                ],
              ),
            ));
      },
    );
  }
}
