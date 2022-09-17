import 'dart:io';

import 'package:dart_grpc_server/dart_grpc_server.dart';
import 'package:grpc/grpc.dart';

class GroceriesService extends GroceriesServiceBase {
  @override
  Future<Category> createCategory(ServiceCall call, Category category) async {
    return categoriesServices.createCategory(category)!;
  }

  @override
  Future<Item> createItem(ServiceCall call, Item request) {
    // TODO: implement createItem
    throw UnimplementedError();
  }

  @override
  Future<Category> deleteCategory(ServiceCall call, Category request) {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }

  @override
  Future<Item> deleteItem(ServiceCall call, Item request) {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }

  @override
  Future<Category> editCategory(ServiceCall call, Category request) {
    // TODO: implement editCategory
    throw UnimplementedError();
  }

  @override
  Future<Item> editItem(ServiceCall call, Item request) {
    // TODO: implement editItem
    throw UnimplementedError();
  }

  @override
  Future<Categories> getAllCategories(ServiceCall call, Empty request) {
    // TODO: implement getAllCategories
    throw UnimplementedError();
  }

  @override
  Future<Items> getAllItems(ServiceCall call, Empty request) {
    // TODO: implement getAllItems
    throw UnimplementedError();
  }

  @override
  Future<AllItemsOfCategory> getAllItemsByCategory(
      ServiceCall call, Category request) {
    // TODO: implement getAllItemsByCategory
    throw UnimplementedError();
  }

  @override
  Future<Category> getCategory(ServiceCall call, Category request) {
    // TODO: implement getCategory
    throw UnimplementedError();
  }

  @override
  Future<Item> getItem(ServiceCall call, Item request) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  //ALTRI SERVIZI EVENTUALI... (altre classi)

}

Future<void> main() async {
  //CREO IL SERVER
  final server = Server(
      [
        GroceriesService(),
      ], // list of services the server exposes
      const <
          Interceptor>[], //list of Interceptors (excuted BEFORE the rpc methods) login auth...etc
      CodecRegistry(codecs: const [
        GzipCodec(),
        IdentityCodec()
      ]) //per comprimere serializzando
      );

  await server.serve(port: 50000); //METTO IN ASCOLTO
  print('✅ Server listening on port ${server.port}...');
}
