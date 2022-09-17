import 'package:dart_grpc_server/dart_grpc_server.dart';

class HelperMethods {
  Category getCategoryFromMap(Map category) {
    var _idTag = 1;
    var _nameTag = 2; //COME IN PROTO FILE
    var _iconTag = 3;
    //legate alla struttura mappa nei dati
    int _id = category['id']; //prendo 'id' dalla mappa in input
    String _name = category['name'];
    String _icon = category['icon'];
    return Category.fromJson('''{
      "$_idTag": $_id,
      "$_nameTag":"$_name",
      "$_iconTag":"$_icon"
      }''');
  }

  Item getItemFromMap(Map item) {
    var _idTag = 1;
    var _nameTag = 2;
    var _categoryIdTag = 3;

    int _id = item['id'];
    String _name = item['name'];
    int _categoryId = item['categoryId'];

    return Item.fromJson('''{
      "$_idTag" : $_id,
      "$_nameTag": "$_name",
      "$_categoryIdTag":$_categoryId
    }''');
  }
}

final helper = HelperMethods();
