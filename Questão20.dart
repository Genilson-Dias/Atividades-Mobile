import 'dart:io';

void exibirLabirinto(List<List<String>> labirinto) {
  print('');

  for (List<String> linha in labirinto) {
    print(linha.join());
  }

  print('');
}

void main() {
  List<List<String>> labirinto = [
    ['#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
    ['#', 'J', ' ', ' ', '#', ' ', ' ', ' ', ' ', '#'],
    ['#', '#', '#', ' ', '#', ' ', '#', '#', ' ', '#'],
    ['#', ' ', ' ', ' ', ' ', ' ', '#', ' ', ' ', '#'],
    ['#', ' ', '#', '#', '#', '#', '#', ' ', '#', '#'],
    ['#', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '#'],
    ['#', '#', '#', '#', '#', '#', '#', '#', 'S', '#'],
  ];

  int jogadorLinha = 1;
  int jogadorColuna = 1;

  print('=== JOGO DO LABIRINTO ===');
  print('Use W para cima, S para baixo, A para esquerda e D para direita.');
  print('J = jogador | # = parede | S = saída');

  while (true) {
    exibirLabirinto(labirinto);

    stdout.write('Digite o movimento (W/A/S/D): ');
    String movimento =
        (stdin.readLineSync() ?? '').trim().toUpperCase();

    int novaLinha = jogadorLinha;
    int novaColuna = jogadorColuna;

    if (movimento == 'W') {
      novaLinha--;
    } else if (movimento == 'S') {
      novaLinha++;
    } else if (movimento == 'A') {
      novaColuna--;
    } else if (movimento == 'D') {
      novaColuna++;
    } else {
      print('Comando inválido.');
      continue;
    }

    if (novaLinha < 0 ||
        novaLinha >= labirinto.length ||
        novaColuna < 0 ||
        novaColuna >= labirinto[0].length) {
      print('Movimento fora do labirinto.');
      continue;
    }

    if (labirinto[novaLinha][novaColuna] == '#') {
      print('Existe uma parede nesse caminho.');
      continue;
    }

    if (labirinto[novaLinha][novaColuna] == 'S') {
      labirinto[jogadorLinha][jogadorColuna] = ' ';
      labirinto[novaLinha][novaColuna] = 'J';

      exibirLabirinto(labirinto);
      print('Parabéns! Você encontrou a saída do labirinto!');
      break;
    }

    labirinto[jogadorLinha][jogadorColuna] = ' ';
    jogadorLinha = novaLinha;
    jogadorColuna = novaColuna;
    labirinto[jogadorLinha][jogadorColuna] = 'J';
  }
}