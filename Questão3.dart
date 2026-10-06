import 'dart:io';

void main() {
  stdout.write('digite o número de termos:');
  final entrada = stdin.readLineSync();
  final quantidade = entrada == null ? null : int.tryParse(entrada.trim());

  if (quantidade == null || quantidade <0) {
    print('digite um número inteiro maior ou igual a zero.');
    return;
  }

  int primeiro = 1;
  int segundo = 5;
  int terceiro = 100;
  int impressos = 0;

  while ( impressos < quantidade) {
    stdout.write('$primeiro ');
    impressos++;

    if (impressos < quantidade) {
      stdout.write('$segundo ');
      impressos++;
    }

    if (impressos < quantidade){
      stdout.write('$terceiro ');
      impressos++;
    }

    primeiro *= 2;
    segundo += 5;
    terceiro -= 10;
  }
  print('');
}