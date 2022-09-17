import 'dart:io';
import 'dart:math';
import 'package:grpc/grpc.dart';

import 'package:dart_grpc_server/dart_grpc_server.dart';

class Client {
  ClientChannel? channel;
  GroceriesServiceClient? stub;
  var response;
  bool executionInProgress = true;

  Future<void> start() async {
    channel = ClientChannel('localhost',
        port: 50000,
        options: const ChannelOptions(
            credentials:
                ChannelCredentials.insecure())); //dice dove sta il seerver
    stub = GroceriesServiceClient(channel!,
        options: CallOptions(timeout: Duration(seconds: 30)));

    while (executionInProgress) {
      try {
        print('🎉 ---- Welcome to the dart store API ---- 🎉');
        print('     ---- what do you want to do? ----');
        print('👉 1: View all products');
        print('👉 2: Add new product');
        print('👉 3: Edit product');
        print('👉 4: Get product');
        print('👉 5: Delete product \n');
        print('👉 6: View all categories');
        print('👉 7: Add new category');
        print('👉 8: Edit category');
        print('👉 9: Get category');
        print('👉 10: Delete category \n');
        print('👉 11: Get all products of given category');

        var option = int.tryParse(stdin.readLineSync()!);
        if (option == null) {
          print('invalid integer 😓');
        } else {
          switch (option) {
            case 1:
              break;
            case 2:
              break;
            case 3:
              break;
            case 4:
              break;
            case 5:
              break;
            case 6:
              break;
            case 7:
              print('Enter category name');
              var name = stdin.readLineSync()!;
              var category = await _findCategoryByName(name);
              if (category.id != 0) {
                //0 is the default (non corrisp ad alcun ogg)
                print(
                    '🔴 categoty already exists: category: ${category.name} (id: ${category.id})');
              } else {
                //NO CATEGORY WITH THIS NAME
                //POSSO CREARNE UNA NUOVA
                category = Category()
                  ..id = Random(999).nextInt(9999)
                  ..name = name;
                //RPC CALLING THE SERVER METHOD
                response = await stub!.createCategory(category);
                print(
                    '✅ category created: name ${category.name} (id: ${category.id})');
              }
              break;
            case 8:
              break;
            case 9:
              break;
            case 10:
              break;
            case 11:
              break;
            default:
              print('invalid option 😓');
          }
        }
      } catch (e) {
        print(e);
      }

      print('Do you wish to exit the store? (Y/n)');
      var result = stdin.readLineSync() ?? 'y';
      executionInProgress = result.toLowerCase() != 'y'; //finché non dico yes
    } //MAIN LOOP DEL CLIENT

    await channel!.shutdown(); //FERMO IL CLIENT ALLA FINE
  } //fine start client

  Future<Category> _findCategoryByName(String name) async {
    var category = Category()..name = name; //mi serve per chiedere al server
    category =
        await stub!.getCategory(category); //farà chiamare il metodo SUL SERVER
    return category;
  }

  Future<Item> _findItemByName(String name) async {
    var item = Item()..name = name;
    item = await stub!.getItem(item);
    return item;
  }

  int _randomId() => Random(1000).nextInt(9999);
}

void main(List<String> args) {
  var client = Client();
  client.start();
}
