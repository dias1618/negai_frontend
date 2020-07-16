import 'package:aquila_frontend_main/app/shared/validators/validator.dart';

class FieldValidator{

  var value;
  List<Validator> validators;

  FieldValidator({this.value, this.validators});

  String validate(){
    String errorMessage = '';
    validators.forEach((validator) { 
      if(!validator.validate(value))
        errorMessage += '${validator.errorMessage}, ';
    });
    if(errorMessage.isEmpty)
      return null;

    return errorMessage.substring(0, errorMessage.length-2);
  }
}