class Formula {
  final int idade;
  final double peso;

  Formula({required this.idade, required this.peso});

  double calcular() {
    final List<MapEntry<Range, int>> recomendacoes = [
      MapEntry(Range(0, 17), 40),
      MapEntry(Range(18, 55), 35),
      MapEntry(Range(56, 65), 30),
      MapEntry(Range(66, 130), 25),
    ];

    final mlPorKg = recomendacoes
        .firstWhere((entry) => entry.key.contem(idade))
        .value;

    return mlPorKg * peso;
  }
}

class Range {
  final int min;
  final int max;

  Range(this.min, this.max);

  bool contem(int valor) => valor >= min && valor <= max;
}

main() {
  final formula = Formula(idade: 30, peso: 70);
  print('Quantidade de água recomendada: ${formula.calcular()} ml');
} 