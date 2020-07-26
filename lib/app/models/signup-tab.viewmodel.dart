import 'package:aquila_frontend_main/app/models/viewmodel.dart';

class SignupTabViewModel implements ViewModel {
  Function onTapBack;
  Function onTapForward;
  String titulo;

  SignupTabViewModel({this.onTapBack, this.onTapForward, this.titulo});

  SignupTabViewModel.fromJson(Map<String, dynamic> json) {
    onTapBack = json['onTapBack'];
    onTapForward = json['onTapForward'];
    titulo = json['titulo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['onTapBack'] = this.onTapBack;
    data['onTapForward'] = this.onTapForward;
    data['titulo'] = this.titulo;
    return data;
  }
}