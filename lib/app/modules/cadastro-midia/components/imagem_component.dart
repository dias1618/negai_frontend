import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:negai_frontend_main/app/modules/cadastro-midia/cadastro_midia_controller.dart';

class ImagemComponent extends StatefulWidget {
  @override
  _ImagemComponentState createState() => _ImagemComponentState();
}

class _ImagemComponentState extends State<ImagemComponent> {
  CadastroMidiaController cadastroMidiaController = Modular.get<CadastroMidiaController>();
  final ImagePicker _picker = ImagePicker();
  PickedFile _imageFile;
  dynamic _pickImageError;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: TextFormField(
              readOnly: true,
              controller: cadastroMidiaController.iconeController,
              autofocus: false,
              decoration: new InputDecoration(
                labelText: "Ícone",
              ),
              keyboardType: TextInputType.text,
            )
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: FlatButton(
                onPressed: () async{
                  try {
                    final pickedFile = await _picker.getImage(
                      source: ImageSource.gallery,
                    );
                    setState(() {
                      _imageFile = pickedFile;
                      cadastroMidiaController.iconeController.text = _imageFile.path;
                    });
                  } catch (e) {
                    setState(() {
                      _pickImageError = e;
                    });
                  }
                }, 
                child: Icon(Icons.file_upload)
              ),
            )
          )
        ],
      )
    );
  }
}