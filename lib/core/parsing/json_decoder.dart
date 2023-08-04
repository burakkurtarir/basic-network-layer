class JSONDecoder {
  R? decode<R, T>(
      dynamic data, T Function(Map<String, dynamic> json) fromJson) {
    try {
      if (data is List) {
        return data.map((e) => fromJson(e)).cast<T>().toList() as R;
      } else if (data is Map<String, dynamic>) {
        return fromJson(data) as R;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
