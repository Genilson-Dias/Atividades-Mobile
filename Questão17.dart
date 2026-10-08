import 'dart:io';

List<int> lerVetor(String nome) {
  stdout.write('Digite o tamanho do vetor $nome: ');
  int tamanho = int.parse(stdin.readLineSync()!);

  List<int> vetor = [];

  for (int i = 0; i < tamanho; i++) {
    stdout.write('Digite o ${i + 1}º elemento do vetor $nome: ');
    int numero = int.parse(stdin.readLineSync()!);
    vetor.add(numero);
  }

  return vetor;
}

List<int> somarVetores(List<int> vetorA, List<int> vetorB) {
  List<int> vetorSoma = [];

  for (int i = 0; i < vetorA.length; i++) {
    vetorSoma.add(vetorA[i] + vetorB[i]);
  }

  return vetorSoma;
}

int somarElementos(List<int> vetor) {
  int soma = 0;

  for (int numero in vetor) {
    soma += numero;
  }

  return soma;
}

void main() {
  stdout.write('Digite o tamanho dos vetores: ');
  int tamanho = int.parse(stdin.readLineSync()!);

  List<int> vetorA = [];

  print('\nDigite os elementos do vetor A:');
  for (int i = 0; i < tamanho; i++) {
    stdout.write('Elemento ${i + 1}: ');
    vetorA.add(int.parse(stdin.readLineSync()!));
  }

  List<int> vetorB = [];

  print('\nDigite os elementos do vetor B:');
  for (int i = 0; i < tamanho; i++) {
    stdout.write('Elemento ${i + 1}: ');
    vetorB.add(int.parse(stdin.readLineSync()!));
  }

  List<int> vetorC = somarVetores(vetorA, vetorB);
  int somaTotal = somarElementos(vetorC);

  print('\nVetor A: $vetorA');
  print('Vetor B: $vetorB');
  print('Terceiro vetor: $vetorC');
  print('Soma dos elementos do terceiro vetor: $somaTotal');
}