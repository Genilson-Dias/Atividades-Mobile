import 'dart:io';

void main() {
  stdout.write('Digite a quantidade de bois: ');
  int quantidade = int.parse(stdin.readLineSync()!);

  List<int> numeros = [];
  List<double> pesos = [];

  for (int i = 0; i < quantidade; i++) {
    print('\nCadastro do ${i + 1}º boi');

    stdout.write('Digite o número do boi: ');
    int numero = int.parse(stdin.readLineSync()!);

    stdout.write('Digite o peso do boi: ');
    double peso = double.parse(
      stdin.readLineSync()!.replaceAll(',', '.'),
    );

    numeros.add(numero);
    pesos.add(peso);
  }

  while (true) {
    print('\n=== PESQUISA DE BOIS ===');

    stdout.write('Digite o peso mínimo: ');
    double pesoMinimo = double.parse(
      stdin.readLineSync()!.replaceAll(',', '.'),
    );

    stdout.write('Digite o peso máximo: ');
    double pesoMaximo = double.parse(
      stdin.readLineSync()!.replaceAll(',', '.'),
    );

    bool encontrou = false;

    print(
      '\nBois com peso entre '
      '${pesoMinimo.toStringAsFixed(2)} kg e '
      '${pesoMaximo.toStringAsFixed(2)} kg:',
    );

    for (int i = 0; i < quantidade; i++) {
      if (pesos[i] >= pesoMinimo && pesos[i] <= pesoMaximo) {
        print(
          'Número: ${numeros[i]} | '
          'Peso: ${pesos[i].toStringAsFixed(2)} kg',
        );

        encontrou = true;
      }
    }

    if (!encontrou) {
      print('Nenhum boi encontrado nesse intervalo.');
    }

    stdout.write('\nDeseja realizar outra pesquisa? (S/N): ');
    String resposta =
        (stdin.readLineSync() ?? '').trim().toUpperCase();

    if (resposta != 'S') {
      break;
    }
  }

  print('\nPrograma encerrado.');
}