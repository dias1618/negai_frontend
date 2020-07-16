import 'package:aquila_frontend_main/app/services/message-manager/message.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class LoadingManagerService extends Disposable {
  void showLoading(String message);
  void updateMessage(String newMessage);
  void hideLoading([String message, MessageStruct messageStruct]);
  
  @override
  void dispose();
}