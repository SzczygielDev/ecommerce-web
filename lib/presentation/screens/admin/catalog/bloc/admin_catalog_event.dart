part of 'admin_catalog_bloc.dart';

sealed class AdminCatalogEvent extends Equatable {
  const AdminCatalogEvent();

  @override
  List<Object> get props => [];
}

class AdminCatalogOnLoadEvent extends AdminCatalogEvent {}

class AdminCatalogCreateProductEvent extends AdminCatalogEvent {
  final String title;
  final String description;
  final double price;

  const AdminCatalogCreateProductEvent(
      {required this.description, required this.title, required this.price});
}

class AdminCatalogDeleteProductEvent extends AdminCatalogEvent {
  final ProductId productId;
  const AdminCatalogDeleteProductEvent({required this.productId});
}

class AdminCatalogUpdateProductEvent extends AdminCatalogEvent {
  final Product updatedProduct;
  const AdminCatalogUpdateProductEvent({required this.updatedProduct});
}
