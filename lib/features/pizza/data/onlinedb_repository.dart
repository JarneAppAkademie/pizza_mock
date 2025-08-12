import 'package:pizza_mock/features/pizza/data/database_repository.dart';
import 'package:pizza_mock/features/pizza/domain/pizza.dart';

class OnlinedbRepository implements DatabaseRepository{
  @override
  Pizza? byId(String id) {
    // TODO: implement byId
    throw UnimplementedError();
  }

  @override
  Pizza create(Pizza draft) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  void delete(String id) {
    // TODO: implement delete
  }

  @override
  // TODO: implement items
  List<Pizza> get items => throw UnimplementedError();

  @override
  void update(Pizza updated) {
    // TODO: implement update
  }
}