import 'package:negai_frontend_main/app/models/situacao-acompanhamento.model.dart';

class SituacaoAcompanhamentoRepository{

  List<SituacaoAcompanhamento> situacoes = [
    SituacaoAcompanhamento(value: 0, label: 'Acompanhando'),
    SituacaoAcompanhamento(value: 1, label: 'Não iniciado'),
    SituacaoAcompanhamento(value: 2, label: 'Parado'),
  ];

}