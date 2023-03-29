import 'package:equatable/equatable.dart';

abstract class BaseFailure extends Equatable {
  const BaseFailure([List properties = const <dynamic>[]]) : super();
}

class ServerFailure extends BaseFailure {
  final String message;

  const ServerFailure(this.message);

  @override
  List<Object?> get props => [];
}
