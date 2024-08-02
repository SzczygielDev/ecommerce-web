import 'package:ecommerce_web/presentation/config/app_colors.dart';
import 'package:ecommerce_web/presentation/screens/admin/catalog/widget/catalog_product_table_header.dart';
import 'package:ecommerce_web/presentation/screens/admin/catalog/widget/catalog_product_table_item.dart';
import 'package:ecommerce_web/presentation/screens/admin/widget/default_admin_screen.dart';
import 'package:flutter/material.dart';

class AdminCatalogScreen extends StatefulWidget {
  const AdminCatalogScreen({super.key});

  @override
  State<AdminCatalogScreen> createState() => _AdminCatalogScreenState();
}

class _AdminCatalogScreenState extends State<AdminCatalogScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultAdminScreen(
      children: [
        const Text(
          "Katalog produktów",
          style: TextStyle(fontSize: 32),
        ),
        const SizedBox(
          height: 16,
        ),
        FractionallySizedBox(
          widthFactor: 0.2,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: TabBar(
              padding: EdgeInsets.zero,
              labelPadding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.tab,
              controller: _tabController,
              tabs: const [
                Tab(
                    child: Text(
                  "Lista produktów",
                  style: TextStyle(fontSize: 18),
                )),
                Tab(child: Text("Kategorie", style: TextStyle(fontSize: 18))),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: FractionallySizedBox(
            widthFactor: 0.4,
            child: Divider(
              thickness: 1,
              color: Colors.black,
            ),
          ),
        ),
        FractionallySizedBox(
          widthFactor: 0.2,
          child: TextFormField(
            decoration: const InputDecoration(
                hintText: "Wyszukaj",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.main, width: 1.0),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.darkGrey, width: 1.0),
                )),
          ),
        ),
        const SizedBox(height: 40),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const <int, TableColumnWidth>{
            0: IntrinsicColumnWidth(),
            1: FixedColumnWidth(160),
            2: IntrinsicColumnWidth(),
            4: IntrinsicColumnWidth(),
            5: IntrinsicColumnWidth(),
          },
          children: [
            CatalogProductTableHeader(),
            ...List.generate(
              30,
              (index) => CatalogProductTableItem(dark: index.isOdd),
            )
          ],
        ),
      ],
    );
  }
}
