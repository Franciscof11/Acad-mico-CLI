import 'package:academico_cli/repositories/student_repository.dart';

void main() async {
  final studentRep = StudentRepository();

  final students = await studentRep.findById(1);

  print(students.name);
}
