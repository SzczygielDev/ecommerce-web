part of 'catalog_bloc.dart';

@immutable
sealed class CatalogEvent {}

class CatalogOnLoadEvent extends CatalogEvent {}
