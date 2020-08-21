import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:negai_frontend_main/app/models/midia.model.dart';
import 'package:negai_frontend_main/app/repositories/situacao_acompanhamento.repository.dart';

class CardMidiaComponent extends StatefulWidget {

  Midia midia;
  Function onTap;

  CardMidiaComponent({this.midia, this.onTap});

  @override
  _CardMidiaComponentState createState() => _CardMidiaComponentState();
}

class _CardMidiaComponentState extends State<CardMidiaComponent> {

  SituacaoAcompanhamentoRepository situacaoAcompanhamentoRepository = Modular.get<SituacaoAcompanhamentoRepository>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, bottom: 5.0),
                            child: Text(
                              widget.midia.titulo,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              situacaoAcompanhamentoRepository.get(widget.midia.situacaoAcompanhamento).label,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 12.0,
                                fontStyle: FontStyle.italic
                              )
                            )
                          ),
                        ],
                      ),
                    )
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 10.0, bottom: 5.0),
                            child: Text(
                              'Último visto',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Text(
                              'Episódio ${widget.midia.ultimoVisto}',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 12.0,
                                fontStyle: FontStyle.italic
                              )
                            )
                          ),
                        ],
                      ),
                    )
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Divider(
                  color: Colors.black45,
                )
              )
            ],
          )
        ),
        onTap: () {
          widget.onTap(widget.midia);
        },
      )
    );
  }
}