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
  final String fileName;
  final Uint8List bytes;
  const AdminCatalogCreateProductEvent(
      {required this.description,
      required this.title,
      required this.price,
      required this.fileName,
      required this.bytes});
}

class AdminCatalogDeleteProductEvent extends AdminCatalogEvent {
  final ProductId productId;
  const AdminCatalogDeleteProductEvent({required this.productId});
}

class AdminCatalogUpdateProductEvent extends AdminCatalogEvent {
  final Product updatedProduct;
  final Uint8List? updatedImage;
  final String? fileName;
  const AdminCatalogUpdateProductEvent(
      {required this.updatedProduct, this.updatedImage, this.fileName});
}
