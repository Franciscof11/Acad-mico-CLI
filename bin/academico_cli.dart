import 'package:academico_cli/commands/students/students_command.dart';
import 'package:args/command_runner.dart';

void main(List<String> arguments) {
  CommandRunner('Acadêmico CLI', 'Acadêmico CLI')
    ..addCommand(StudentsCommand())
    ..run(arguments);
}
