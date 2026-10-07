import 'dart:io';
import 'dart:math';

void main(){
  final random = Random();

  final numeroSecreto = random.nextInt(100) + 1;
  int limiteMinimo = 1;
  int limiteMaximo = 100;
  int tentativas = 0;

  print('JOGO DO NUMERO RANDOM');
  print('Tente descobri o número entre 1 e 100.');

  while (true){
    stdout.write('\nDigite um número entre $limiteMinimo e $limiteMaximo: ');

    final entrada = stdin.readLineSync();
    if (entrada == null) {
      print('Entrada encerrada.');
      break;
    }

    final tentativa = int.tryParse(entrada);
    if (tentativa == null) {
      print('Entrada inválida. Digite um numero inteiro.');
    continue;
    }

    if (tentativa < limiteMinimo || tentativa > limiteMaximo){
      print(
        'Número inválido. Digite um valor entre '
        '$limiteMinimo e $limiteMaximo.'
      );
      continue;
    }

    tentativas++;

    if (tentativa == numeroSecreto) {
      print('\nParabéns! Você achou o número $numeroSecreto.');
      print('quantidade de tentativas: $tentativas');
      break;
    }

    if (tentativa < numeroSecreto){
      limiteMinimo = tentativa + 1;
      print('Nah tu errou Dica: o número é maior');
    } else {
      limiteMaximo = tentativa - 1;
      print('Nah tu errou Dica: o número é menor');
    }
  }
}

