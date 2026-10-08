import 'dart:io';

void main() {
  stdout.write('Digite um número inteiro: ');
  String numero = (stdin.readLineSync() ?? '').trim();

  String numeroInvertido = numero.split('').reversed.join();

  print('Número invertido: $numeroInvertido');
}