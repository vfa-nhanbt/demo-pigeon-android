// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class BaseResult<T> extends Equatable {
  final String? error;
  final T success;

  const BaseResult({
    this.error,
    required this.success,
  });

  BaseResult<T> copyWith({
    String? error,
    T? success,
  }) {
    return BaseResult<T>(
      error: error ?? this.error,
      success: success ?? this.success,
    );
  }

  factory BaseResult.fromMap(Map<String, dynamic> map, BaseObject baseObject) {
    return BaseResult<T>(
      error: map['error'] != null ? map['error'] as String : null,
      success: map['success'] != null ? baseObject.fromMap(map) : null,
    );
  }

  factory BaseResult.fromJson(String source, BaseObject baseObject) =>
      BaseResult.fromMap(
        json.decode(source) as Map<String, dynamic>,
        baseObject,
      );

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        error ?? "",
        success ?? Object(),
      ];
}

abstract class BaseObject<T> extends Equatable {
  T fromJson(String source);
  T fromMap(Map<String, dynamic> map);
}
