import 'dart:io';

void exibirForca(int erros) {
  const desenhos = [
    '''
+---+
|   |
    |
    |
    |
    |
=========
''',
    '''
+---+
|   |
O   |
    |
    |
    |
=========
''',
    '''
+---+
|   |
O   |
|   |
    |
    |
=========
''',
    '''
+---+
|   |
O   |
/|  |
    |
    |
=========
''',
    '''
+---+
|   |
O   |
/|\\ |
    |
    |
=========
''',
    '''
+---+
|   |
O   |
/|\\ |
/   |
    |
=========
''',
    '''
+---+
|   |
O   |
/|\\ |
/ \\ |
    |
=========
''',
  ];

  print(desenhos[erros]);
}

void main() {
  const palavraSecreta = 'computador';
  const limiteErros = 6;
  final letrasCorretas = <String>{};
  final letrasErradas = <String>{};

  print('=== JOGO DA FORCA ===');

  while (letrasErradas.length < limiteErros) {
    exibirForca(letrasErradas.length);

    final palavraExibida = palavraSecreta
        .split('')
        .map((letra) => letrasCorretas.contains(letra) ? letra : '_')
        .join(' ');
    print('Palavra: $palavraExibida');
    print(
      'Letras erradas: '
      '${letrasErradas.isEmpty ? 'nenhuma' : letrasErradas.join(', ')}',
    );

    if (!palavraExibida.contains('_')) {
      print('\nParabéns! Você descobriu a palavra!');
      print('A palavra era: $palavraSecreta');
      return;
    }

    stdout.write('\nDigite uma letra: ');
    final letra = (stdin.readLineSync() ?? '').trim().toLowerCase();

    if (letra.length != 1 || !RegExp(r'^[a-z]$').hasMatch(letra)) {
      print('\nDigite apenas uma letra de A a Z.');
      continue;
    }
    if (letrasCorretas.contains(letra) || letrasErradas.contains(letra)) {
      print('\nA letra "$letra" já foi digitada.');
      continue;
    }

    if (palavraSecreta.contains(letra)) {
      letrasCorretas.add(letra);
      print('\nVocê acertou uma letra!');
    } else {
      letrasErradas.add(letra);
      print('\nA letra não está na palavra.');
    }
  }

  exibirForca(letrasErradas.length);
  print('Fim de jogo!');
  print('A palavra era: $palavraSecreta');
}
