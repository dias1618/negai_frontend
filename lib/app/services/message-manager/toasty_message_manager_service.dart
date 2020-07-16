import 'package:aquila_frontend_main/app/services/message-manager/message.dart';
import 'package:aquila_frontend_main/app/services/message-manager/message_manager_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastyMessageManagerService extends Disposable implements MessageManagerService {

  FlutterToast flutterToast;
  


  @override
  void initMessage(BuildContext context){
    this.flutterToast = FlutterToast(context);
  }

  @override
  void dialogMessage(
    String message, {
      int timeMessage=3, 
      MessageStruct messageStruct
      }) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: (messageStruct != null ? messageStruct.color : Theme.of(this.flutterToast.context).accentColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            (messageStruct != null ? messageStruct.iconData : Icons.check),
            color: Colors.white,
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            message,
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ],
      ),
    );


    flutterToast.showToast(
        child: toast,
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: timeMessage),
    );

  }

  //dispose will be called automatically
  @override
  void dispose() {}

}