import 'package:flutter/material.dart';

class EnterComponent extends StatefulWidget {

  final GlobalKey<FormState> globalKey;
  final Function onPressed;

  const EnterComponent({Key key, this.globalKey, this.onPressed}) : super(key: key);  


  @override
  _EnterComponentState createState() => _EnterComponentState();
}

class _EnterComponentState extends State<EnterComponent> {
  FocusNode _focusNode = FocusNode();
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 15.0,
        bottom: 20.0
      ), 
      child: ButtonTheme(
        minWidth: double.infinity,
        height: 50.0,
        child: FlatButton(
          focusNode: this._focusNode,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15.0)
          ),
          color: Theme.of(context).primaryColor,
          onPressed: (){
            if(!widget.globalKey.currentState.validate()){
              return;
            }
            widget.onPressed(widget.globalKey);
            this._focusNode.requestFocus();
          }, 
          child: Text(
            'Entrar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0
            ),
          )
        )
      ) 
    );
  }
}