import 'package:negai_frontend_main/app/shared/validators/validator.dart';

class EmptyValidator implements Validator{
  @override
  String errorMessage = 'Preencha o campo';

  EmptyValidator({this.errorMessage});

  @override
  bool validate(value) {
    if(value == null || value.toString().isEmpty)
      return false;
    return true;
  }
  
}