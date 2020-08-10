import 'package:negai_frontend_main/app/models/situacao-midia.model.dart';

class SituacaoMidiaRepository{

  List<SituacaoMidia> situacoes = [
    SituacaoMidia(value: 0, label: 'Em andamento'),
    SituacaoMidia(value: 1, label: 'Em Hiato'),
    SituacaoMidia(value: 2, label: 'Finalizado'),
  ];

}