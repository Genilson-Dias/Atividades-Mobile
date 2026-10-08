import 'dart:io';

void exibirTabuleiro(List<String> tabuleiro) {
  print('');
  print(' ${tabuleiro[0]} | ${tabuleiro[1]} | ${tabuleiro[2]} ');
  print('---+---+---');
  print(' ${tabuleiro[3]} | ${tabuleiro[4]} | ${tabuleiro[5]} ');
  print('---+---+---');
  print(' ${tabuleiro[6]} | ${tabuleiro[7]} | ${tabuleiro[8]} ');
  print('');
}

bool verificarVitoria(List<String> tabuleiro, String jogador) {
  List<List<int>> combinacoesVencedoras = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  for (List<int> combinacao in combinacoesVencedoras) {
    if (tabuleiro[combinacao[0]] == jogador &&
        tabuleiro[combinacao[1]] == jogador &&
        tabuleiro[combinacao[2]] == jogador) {
      return true;
    }
  }

  return false;
}

void main() {
  List<String> tabuleiro = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  ];

  String jogadorAtual = 'X';
  int jogadas = 0;

  print('=== JOGO DA VELHA ===');
  print('Os jogadores alternam entre X e O.');

  while (true) {
    exibirTabuleiro(tabuleiro);

    stdout.write(
      'Jogador $jogadorAtual, escolha uma posição de 1 a 9: ',
    );

    int? posicao = int.tryParse(stdin.readLineSync() ?? '');

    if (posicao == null || posicao < 1 || posicao > 9) {
      print('Posição inválida. Digite um número entre 1 e 9.');
      continue;
    }

    int indice = posicao - 1;

    if (tabuleiro[indice] == 'X' || tabuleiro[indice] == 'O') {
      print('Essa posição já está ocupada.');
      continue;
    }

    tabuleiro[indice] = jogadorAtual;
    jogadas++;

    if (verificarVitoria(tabuleiro, jogadorAtual)) {
      exibirTabuleiro(tabuleiro);
      print('Jogador $jogadorAtual venceu!');
      break;
    }

    if (jogadas == 9) {
      exibirTabuleiro(tabuleiro);
      print('O jogo terminou em empate!');
      break;
    }

    jogadorAtual = jogadorAtual == 'X' ? 'O' : 'X';
  }
}