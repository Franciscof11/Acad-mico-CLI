import 'dart:convert';

import 'package:academico_cli/model/course.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  Future<Course> findByName(String name) async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/products?name=$name'));

    if (response.statusCode != 200) {
      throw Exception('Erro');
    }

    final decodeData = jsonDecode(response.body);

    if (decodeData.isEmpyt) {
      throw Exception('Produto não encontrado');
    }

    return Course.fromMap(decodeData[0]);
  }
}
