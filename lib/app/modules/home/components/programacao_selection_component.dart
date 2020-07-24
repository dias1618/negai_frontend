import 'package:flutter/material.dart';

class ProgramacaoSelectionComponent extends StatefulWidget {
  @override
  _ProgramacaoSelectionComponentState createState() => _ProgramacaoSelectionComponentState();
}

class _ProgramacaoSelectionComponentState extends State<ProgramacaoSelectionComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: DropdownButton<String>(
        dropdownColor: Theme.of(context).primaryColor,
        isExpanded: true,
        value: 'Filmes/Series',
        icon: Icon(
          Icons.arrow_downward,
          color: Theme.of(context).accentColor,
        ),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 0,
        ),
        onChanged: (String newValue) {
          //setState(() {
          //  dropdownValue = newValue;
          //});
        },
        items: <String>['Filmes/Series', 'Animes', 'Bobagens', 'Curiosidades']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                value,
                style: TextStyle(
                  color: Theme.of(context).accentColor
                ),
              ),
            ),
          );
        }).toList(),
      )
    );
  }
}