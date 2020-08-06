import 'package:negai_frontend_main/app/modules/signup/components/app_bar_signup.dart';
import 'package:negai_frontend_main/app/modules/signup/pages/dados_basicos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'signup_controller.dart';

class SignupPage extends StatefulWidget {
  final String title;
  const SignupPage({Key key, this.title = "Cadastre-se"}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends ModularState<SignupPage, SignupController> with SingleTickerProviderStateMixin {
  final signupController = Modular.get<SignupController>();
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      signupController.init();
    });
    signupController.tabController = TabController(vsync: this, length: 1);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBarSignup(),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: signupController.tabController,
        children: [
          DadosBasicosPage(),
        ]
      )
    );
  }
}
