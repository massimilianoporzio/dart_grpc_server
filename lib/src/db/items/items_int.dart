import 'package:dart_grpc_server/dart_grpc_server.dart';

abstract class IItemsServices {
  factory IItemsServices() => ItemsServices();

  Item? getItemByName(String name) {}
  Item? getItemById(int id) {}

  Item? createItem(Item item) {}
  Item? editItem(Item item) {}
  Empty? deleteItem(Item item) {}

  List<Item>? getItems() {}
  List<Item>? getItemsByCategory(Category category) {}
}

final itemServices = IItemsServices(); //restituisce la sua implementazione!
