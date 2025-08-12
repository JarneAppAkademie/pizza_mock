import 'package:pizza_mock/features/pizza/domain/pizza.dart';

abstract class DatabaseRepository {
  List<Pizza> get items;

  Pizza? byId(String id);

  //CREATE
  Pizza create(Pizza draft);

  //UPDATE
  void update(Pizza updated);

  //DELETE
  void delete(String id);

}
