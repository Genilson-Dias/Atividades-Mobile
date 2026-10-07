import 'dart:io';
import 'dart:math';

int fatorial(int numero) {
  if (numero < 0){
    throw ArgumentError('O valor não pode ser negativo.');
  }

  int resultado = 1;
  for (int i = 2; i <= numero; i++) {
    resultado *= i;
  }
  return resultado;
}

void main(){
  stdout.write('Digite o valor de X: ');
  final entradaX = stdin.readLineSync();
  if (entradaX == null || entradaX.trim().isEmpty) {
    print('Entrada iválida para X');
    return;
  }

  final x = double.tryParse(entradaX.replaceAll(',', '.'));
  if (x == null ) {
    print('Digitre um numero válido para X');
    return;
  }
  
  stdout.write('Digite o número de termos: ');
  final entradaTermos = stdin.readLineSync();
  if (entradaTermos == null || entradaTermos.trim().isEmpty){
    print('Entrada iválida para o número de termos.');
    return;
  }

  final numeroTermos = int.tryParse(entradaTermos.trim());
  if (numeroTermos == null || numeroTermos <=0) {
    print('O número de termos deve ser maior que zero.');
    return;
  }

  double soma = 0;

  for (int i = 0; i < numeroTermos; i++) {
    final expoente = i + 2;
    final termo = pow(x, expoente).toDouble() / fatorial(i + 1);
    soma += termo;
  }
  print('Valor da série: ${soma.toStringAsFixed(2)}');
}