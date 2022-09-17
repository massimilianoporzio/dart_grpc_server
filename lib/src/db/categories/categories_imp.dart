import 'package:dart_grpc_server/dart_grpc_server.dart';

class CategoriesServices implements ICategoriesServices {
  @override
  Category? createCategory(Category category) {
    categories.add({
      'id': category.id,
      'name': category.name,
      'icon': category.icon
    }); //add to data
    return category;
  }

  @override
  Empty? deleteCategory(Category category) {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }

  @override
  Category? editCategory(Category category) {
    // TODO: implement editCategory
    throw UnimplementedError();
  }

  @override
  List<Category>? getCategories() {
    return categories.map((category) {
      return helper.getCategoryFromMap(category);
    }).toList();
  }

  @override
  Category? getCategoryById(int id) {
    var cat = Category(); //deafult values (id 0 name e icon '')
    var result = categories.where((element) => element['id'] == id).toList();
    if (result.isNotEmpty) {
      cat = helper.getCategoryFromMap(result.first);
    }
    return cat;
  }

  @override
  Category? getCategoryByName(String name) {
    var cat = Category(); //deafult values (id 0 name e icon '')
    var result =
        categories.where((element) => element['name'] == name).toList();
    if (result.isNotEmpty) {
      cat = helper.getCategoryFromMap(result.first);
    }
    return cat;
  }

  @override
  Category? getCategoryByIcon(String icon) {
    var cat = Category();
    var result =
        categories.where((element) => element['icon'] == icon).toList();
    if (result.isNotEmpty) {
      cat = helper.getCategoryFromMap(result.first);
    }
    return cat;
  }
}
