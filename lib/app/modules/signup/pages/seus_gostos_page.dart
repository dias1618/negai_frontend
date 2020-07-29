import 'package:aquila_frontend_main/app/modules/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SeusGostosPage extends StatefulWidget {
  @override
  _SeusGostosPageState createState() => _SeusGostosPageState();
}

class _SeusGostosPageState extends State<SeusGostosPage> {

  SignupController signupController = Modular.get<SignupController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Visibility(
        visible: signupController.categorias.length > 0,
        child: GridView.count(
          crossAxisCount: 3,
          children: List.generate(signupController.categorias.length, (index) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      signupController.categorias.elementAt(index).checked = !signupController.categorias[index].checked;  
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: signupController.categorias[index].checked ?
                        Theme.of(context).accentColor :
                        Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 2.0,),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 4.0,
                        ),
                      ]
                    ),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(
                              signupController.categorias[index].checked ?
                              Icons.check_box :
                              Icons.check_box_outline_blank
                            ),
                          )
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  signupController.categorias[index].nome, 
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 12
                                  ),
                                ),
                              )
                            ],
                          )
                        )
                        
                      ],
                    ),
                  ),
                ),
              )
            );
          }),
        ),
      )
    );
  }
}