import 'package:academico_cli/commands/students/subcommands/find_all_command.dart';
import 'package:academico_cli/repositories/student_repository.dart';
import 'package:args/command_runner.dart';

class StudentsCommand extends Command {
  @override
  String get description => 'Students Operation';

  @override
  String get name => 'students';

  StudentsCommand() {
    final studentsRepository = StudentRepository();

    addSubcommand(FindAllCommand(studentsRepository));
  }
}
