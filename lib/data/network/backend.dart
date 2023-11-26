import 'dart:io';

import 'package:http/http.dart' as http;

abstract interface class Backend {
  Future<T> get<T>(String url, T Function(String json) decoder);
}

class BackendImpl implements Backend {
  @override
  Future<T> get<T>(
    String url,
    T Function(String json) decoder,
  ) async {
    final result = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/photos'),
    );
    final statusCodeInt = result.statusCode ~/ 100;
    if (statusCodeInt == 2) {
      return decoder(result.body);
    } else {
      throw _errorMap[statusCodeInt]!();
    }
  }
}

final _errorMap = <int, Function>{
  3: () => const HttpException(''),
  4: () => const HttpException(''),
  5: () => const HttpException(''),
};
