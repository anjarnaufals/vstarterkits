import 'dart:convert';

import 'package:equatable/equatable.dart';

class Pagination extends Equatable {
  final int? currentPage;
  final int? totalPages;
  final int? size;
  final int? total;

  const Pagination({
    this.currentPage,
    this.totalPages,
    this.size,
    this.total,
  });

  factory Pagination.fromMap(Map<String, dynamic> data) => Pagination(
        currentPage: data['currentPage'] as int?,
        totalPages: data['totalPages'] as int?,
        size: data['size'] as int?,
        total: data['total'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'currentPage': currentPage,
        'totalPages': totalPages,
        'size': size,
        'total': total,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Pagination].
  factory Pagination.fromJson(String data) {
    return Pagination.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Pagination] to a JSON string.
  String toJson() => json.encode(toMap());

  Pagination copyWith({
    int? currentPage,
    int? totalPages,
    int? size,
    int? total,
  }) {
    return Pagination(
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      size: size ?? this.size,
      total: total ?? this.total,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [currentPage, totalPages, size, total];
}
