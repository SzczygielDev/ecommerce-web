import 'package:ecommerce_web/presentation/screens/catalog/bloc/catalog_bloc.dart';
import 'package:ecommerce_web/presentation/screens/catalog/view/catalog_main_section.dart';
import 'package:ecommerce_web/presentation/screens/catalog/view/catalog_side_section.dart';
import 'package:ecommerce_web/presentation/screens/catalog/widget/catalog_header.dart';
import 'package:ecommerce_web/presentation/widget/generic_page.dart';

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
    return GenericPage(
      padding: const EdgeInsets.only(
        left: 50,
        right: 50,
        top: 50,
      ),
      child: BlocBuilder<CatalogBloc, CatalogState>(
        builder: (context, state) {
          return const Column(
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
                            padding: EdgeInsets.symmetric(horizontal: 45),
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
          );
        },
      ),
    );
  }
}
