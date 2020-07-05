import 'package:hiso/core/coordinator/coordinator.dart';

class CoordinatorProvider {
  CoordinatorProvider._();

  static final CoordinatorProvider instance = CoordinatorProvider._();
  final Map<Type, Coordinator> _navigatorKeys = {};

  void add<T extends Coordinator>(
    T coordinator,
  ) {
    _navigatorKeys[T] = coordinator;
  }

  T remove<T extends Coordinator>() {
    return _navigatorKeys.remove(T);
  }

  T get<T extends Coordinator>() {
    return _navigatorKeys[T];
  }
}
