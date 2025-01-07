import 'package:equatable/equatable.dart';

import 'pagination.dart';

typedef Data<T> = T Function(Map<String, dynamic> source);
typedef DataList<T> = T Function(List<dynamic> source);
typedef DataToMap<T> = Map<String, dynamic> Function(T);

class BaseRes<T> extends Equatable {
  const BaseRes({
    this.status,
    this.message,
    this.data,
    this.pagination,
    this.errors,
  });

  final int? status;
  final String? message;
  final T? data;
  final Pagination? pagination;
  final String? errors;

  BaseRes<T> copyWith({
    int? status,
    String? message,
    T? data,
    Pagination? pagination,
    String? errors,
  }) {
    return BaseRes<T>(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
      pagination: pagination ?? this.pagination,
      errors: errors ?? this.errors,
    );
  }

  factory BaseRes.fromMap(
    dynamic map, {
    Data<T>? fromMap,
    DataList<T>? listFromMap,
  }) {
    return BaseRes<T>(
      status: map['status'] != null ? map['status'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? fromMap != null
              ? fromMap(map['data'])
              : listFromMap != null
                  ? listFromMap(map['data'])
                  : null
          : null,
      pagination: map['pagination'] != null
          ? Pagination.fromMap(map['pagination'])
          : null,
      errors: map['errors'] != null ? map['errors'] as String : null,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        status,
        message,
        data,
        errors,
      ];

  Map<String, dynamic> toMap({DataToMap<T>? toMap}) {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data != null
          ? toMap != null
              ? toMap(data as T)
              : null
          : null,
      'pagination': pagination?.toMap(),
      'errors': errors,
    };
  }
}
