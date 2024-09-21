class BMultiValueFilter {
  final String field;
  final List<String> values;

  BMultiValueFilter(this.field, this.values);

  Map<String, dynamic> toJson() {
    return {
      'field': field,
      'values': values,
    };
  }
}