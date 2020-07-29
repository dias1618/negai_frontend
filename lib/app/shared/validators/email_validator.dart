import 'package:aquila_frontend_main/app/shared/validators/validator.dart';

class EmailValidator implements Validator{
  @override
  String errorMessage = 'Email inválido';

  EmailValidator({this.errorMessage});

  @override
  bool validate(value) {
    return RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?").hasMatch(value);
  }
  
}