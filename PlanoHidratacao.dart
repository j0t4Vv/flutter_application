class PlanoHidratacao {
  final double totalMlDia;
  final DateTime inicio;
  final DateTime fim;
  final int porcoes;

  PlanoHidratacao({
    required this.totalMlDia,
    required this.inicio,
    required this.fim,
    required this.porcoes,
  });

  double get quantidadePorPorcao => totalMlDia / porcoes;

  List<DateTime> gerarHorarios() {
    final duracaoTotal = fim.difference(inicio).inMinutes;
    final intervalo = duracaoTotal ~/ (porcoes - 1);

    return List.generate(porcoes, (i) => inicio.add(Duration(minutes: intervalo * i)));
  }

  String gerarPlanoTexto() {
    final horarios = gerarHorarios();
    final porcao = quantidadePorPorcao.toStringAsFixed(0);

    return List.generate(
      porcoes,
      (i) => 'Horário ${horarios[i].hour.toString().padLeft(2, '0')}:${horarios[i].minute.toString().padLeft(2, '0')} → $porcao ml',
    ).join('\n');
  }
}
