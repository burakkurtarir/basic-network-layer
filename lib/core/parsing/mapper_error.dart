import 'package:network_layer_2/core/network/model/network_error.dart';

class MapperError<T> {
  final NetworkError networkError;
  final T? errorModel;

  String get message => networkError.message;

  const MapperError({required this.networkError, this.errorModel});
}
