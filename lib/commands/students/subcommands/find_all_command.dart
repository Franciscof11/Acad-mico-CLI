import 'dart:io';

import 'package:academico_cli/repositories/student_repository.dart';
import 'package:args/command_runner.dart';

class FindAllCommand extends Command {
  final StudentRepository repository;

  FindAllCommand(this.repository);

  @override
  String get description => 'Find All Students';

  @override
  String get name => 'findAll';

  @override
  Future<void> run() async {
    print('');
    print('Aguarde, buscando alunos...');
    print('');

    final students = await repository.findAll();

    print('Apresentar também os cursos? (S ou N)');

    var showCurses = stdin.readLineSync();

    print('----------------------------');
    print('Alunos:');

    for (var student in students) {
      print('----------------------------');
      print('Nome: ${student.name}');
      print('Idade: ${student.age}');
      print(
          'Endereço: ${student.address.city.name} , ${student.address.street}');

      if (showCurses?.toLowerCase() == 's') {
        print('Cursos: ${student.nameCourses}');
      }
    }
  }
}
