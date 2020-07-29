import 'package:aquila_frontend_main/app/modules/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppBarSignup extends StatefulWidget implements PreferredSizeWidget {
  final double height = 60;

  @override
  _AppBarSignupState createState() => _AppBarSignupState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _AppBarSignupState extends State<AppBarSignup> {

  SignupController signupController = Modular.get<SignupController>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Align(
        alignment: Alignment.center,
        child: Observer(
          builder: (_) => Visibility(
            visible: signupController.listTabViewModel != null && signupController.listTabViewModel.length > 0,
            child: Text(
              (signupController.listTabViewModel != null ? 
              signupController.listTabViewModel[signupController.tabController.index].titulo : 
              ""), 
              textAlign: TextAlign.center,
            )
          ),
        )
      ),
      leading: GestureDetector(
        onTap: (){
          setState(() {
            signupController.listTabViewModel[signupController.tabController.index].onTapBack();  
          });
        },
        child: Icon(Icons.arrow_back)
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.all(10), 
          child: GestureDetector(
            child: Icon(Icons.arrow_forward), 
            onTap: (){
              setState(() {
                signupController.listTabViewModel[signupController.tabController.index].onTapForward();  
              });
            },
          )
        )
      ],
    );
  }
}