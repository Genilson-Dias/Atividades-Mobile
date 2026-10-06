import 'dart:io';
import 'dart:math';

int fatorial(int numero) {
  if (numero < 0) {
    throw ArgumentError('o valor não pode ser negativo.');
  }

  int resultado = 1;
  for (int i = 2; i <= numero; i++) {
    resultado *= i;
  }
  return resultado;
}

double calcularTermo(int indice) {
  final base = 3 + (indice * 2);
  final numeroFatorial = 4 + (indice * 4);
  final denominador = 5 + (indice * 5);

  final exponente = fatorial(numeroFatorial);
  return pow(base, exponente).toDouble() / denominador;
}

void main() {
  stdout.write('Digite o número de termos: ');
  final entrada = stdin.readLineSync();

  if (entrada == null || entrada.trim().isEmpty) {
    print('Entrada inválida.');
    return;
  }

  final termos = int.tryParse(entrada.trim());
  if (termos == null || termos <= 0) {
    print('O número de termos deve ser maior que zero.');
    return;
  }

  double soma = 0;

  for (int i = 0; i < termos; i++) {
    final termo = calcularTermo(i);

    if (i < 3 || i.isEven) {
      soma += termo;
    } else {
      soma -= termo;
    }
  }

  print('Valor da série: ${soma.toStringAsFixed(2)}');
}