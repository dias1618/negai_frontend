import 'cadastro_midia_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cadastro_midia_page.dart';

class CadastroMidiaModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => CadastroMidiaController()),];

  @override
  List<Router> get routers => [Router(Modular.initialRoute, child: (_, args) => CadastroMidiaPage()),];

  static Inject get to => Inject<CadastroMidiaModule>.of();

}
  