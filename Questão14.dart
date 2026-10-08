import 'dart:io';

List<int> lerVetorOrdenado(String nome) {
  int tamanho;

  do {
    stdout.write('Digite o tamanho do vetor $nome: ');
    tamanho = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

    if (tamanho <= 0) {
      print('O vetor deve possuir pelo menos um elemento.');
    }
  } while (tamanho <= 0);

  List<int> vetor = [];

  for (int i = 0; i < tamanho; i++) {
    stdout.write('Digite o ${i + 1}º elemento do vetor $nome: ');
    int numero = int.parse(stdin.readLineSync()!);
    vetor.add(numero);
  }

  vetor.sort();
  return vetor;
}

void main() {
  List<int> vetorA = lerVetorOrdenado('A');
  List<int> vetorB = lerVetorOrdenado('B');

  List<int> vetorC = [...vetorA, ...vetorB];
  vetorC.sort();

  print('\nVetor A ordenado: $vetorA');
  print('Vetor B ordenado: $vetorB');
  print('Terceiro vetor ordenado: $vetorC');
}