import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/student.dart';

class StudentRepository {
  Future<List<Student>> findAll() async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/students'));

    if (response.statusCode != 200) {
      throw Exception('Erro');
    }

    final dataDecode = jsonDecode(response.body);

    return dataDecode
        .map<Student>((student) => Student.fromMap(student))
        .toList();
  }

  Future<Student> findById(int id) async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/students?id=$id'));

    if (response.statusCode != 200) {
      throw Exception('Erro');
    }

    if (response.body.isEmpty) {
      throw Exception('Estudante não encontrado!');
    }

    return Student.fromJson(response.body);
  }

  Future<void> insert(Student student) async {
    final response = await http.post(
      Uri.parse('http://localhost:8080/students'),
      body: student.toJson(),
      headers: {'content-type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Erro');
    }
  }

  Future<void> update(Student student) async {
    final response = await http.put(
      Uri.parse('http://localhost:8080/students/${student.id}'),
      body: student.toJson(),
      headers: {'content-type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  Future<void> deleteById(int id) async {
    final response = await http.delete(
      Uri.parse('http://localhost:8080/students/$id'),
    );

    if (response.statusCode != 200) {
      throw Exception();
    }
  }
}
