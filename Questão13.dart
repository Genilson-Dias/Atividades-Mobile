import 'dart:io';

void main() {
  stdout.write('Digite a quantidade de números: ');
  int quantidade = int.parse(stdin.readLineSync()!);

  List<int> numeros = [];

  for (int i = 0; i < quantidade; i++) {
    stdout.write('Digite o ${i + 1}º número: ');
    int numero = int.parse(stdin.readLineSync()!);
    numeros.add(numero);
  }

  Map<int, int> repeticoes = {};

  for (int numero in numeros) {
    repeticoes[numero] = (repeticoes[numero] ?? 0) + 1;
  }

  print('\nResultado:');

  repeticoes.forEach((numero, quantidade) {
    print('$numero - $quantidade');
  });
}