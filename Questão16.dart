import 'dart:io';

List<int> lerVetor(String nome) {
  stdout.write('Digite o tamanho do vetor $nome: ');
  int tamanho = int.parse(stdin.readLineSync()!);

  List<int> vetor = [];

  for (int i = 0; i < tamanho; i++) {
    stdout.write('Digite o ${i + 1}º elemento do vetor $nome: ');
    int elemento = int.parse(stdin.readLineSync()!);
    vetor.add(elemento);
  }

  return vetor;
}

void main() {
  List<int> vetorA = lerVetor('A');
  List<int> vetorB = lerVetor('B');
  List<int> vetorC = lerVetor('C');
  List<int> vetorD = lerVetor('D');

  List<int> vetorOrdenado = [
    ...vetorA,
    ...vetorB,
    ...vetorC,
    ...vetorD,
  ];

  vetorOrdenado.sort();

  Set<int> intersecao = vetorA.toSet()
      .intersection(vetorB.toSet())
      .intersection(vetorC.toSet())
      .intersection(vetorD.toSet());

  List<int> vetorIntersecao = intersecao.toList();
  vetorIntersecao.sort();

  print('\nQuinto vetor ordenado: $vetorOrdenado');

  if (vetorIntersecao.isEmpty) {
    print('Não existem elementos comuns aos quatro vetores.');
  } else {
    print(
      'Elementos presentes nos quatro vetores: '
      '$vetorIntersecao',
    );
  }
}