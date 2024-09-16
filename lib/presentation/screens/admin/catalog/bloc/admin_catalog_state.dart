part of 'admin_catalog_bloc.dart';

class AdminCatalogState extends Equatable {
  final List<Product> products;

  const AdminCatalogState({this.products = const []});

  AdminCatalogState copyWith({List<Product>? products}) {
    return AdminCatalogState(products: products ?? this.products);
  }

  @override
  List<Object?> get props => [products];
}
