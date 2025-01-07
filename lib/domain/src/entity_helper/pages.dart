import '../../domain.dart';

class Pages<T> {
  const Pages({
    this.data,
    this.pagination,
  });
  final T? data;
  final Pagination? pagination;
}
