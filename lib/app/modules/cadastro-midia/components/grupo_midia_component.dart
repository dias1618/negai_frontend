import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:negai_frontend_main/app/viewmodels/grupo-midia.viewmodel.dart';
import 'package:negai_frontend_main/app/modules/cadastro-midia/cadastro_midia_controller.dart';
import 'package:negai_frontend_main/app/stores/grupo_midia_store.dart';

class GrupoMidiaComponent extends StatefulWidget {

  const GrupoMidiaComponent({Key key}) : super(key: key);  

  @override
  _GrupoMidiaComponentState createState() => _GrupoMidiaComponentState();
}

class _GrupoMidiaComponentState extends State<GrupoMidiaComponent> {

  CadastroMidiaController cadastroMidiaController = Modular.get<CadastroMidiaController>();
  GrupoMidiaStore grupoMidiaStore = Modular.get<GrupoMidiaStore>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: IgnorePointer(
        ignoring: !cadastroMidiaController.disabledGrupoMidia,
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            labelText: 'Tipo de Midia'
          ),
          isExpanded: true,
          value: cadastroMidiaController.cadastroMidiaViewModel.grupoMidiaValue,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          onChanged: (GrupoMidiaViewModel newValue) {
            setState(() {
              cadastroMidiaController.cadastroMidiaViewModel.grupoMidiaValue = newValue;
            });
          },
          validator: (value) {
            if (value==null) {
              return 'Selecione um grupo de mídia';
            }
            return null;
          },
          items: grupoMidiaStore.gruposMidia
              .map<DropdownMenuItem<GrupoMidiaViewModel>>((GrupoMidiaViewModel value) {
            return DropdownMenuItem<GrupoMidiaViewModel>(
              value: value,
              child: Text(value.titulo),
            );
          }).toList(),
        )
      )
    );
  }
    
}