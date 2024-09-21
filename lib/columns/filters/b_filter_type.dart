abstract class BFilterType {
  final String field;
  final bool Function(dynamic value) filter;

  BFilterType({
    required this.field,
    required this.filter,
  });
}
