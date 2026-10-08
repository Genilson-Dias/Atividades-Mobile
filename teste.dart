import 'dart:io';

void main() {
  int totalHomens = 0;
  int totalMulheres = 0;

  int somaIdadeHomensExperientes = 0;
  int homensExperientes = 0;
  int homensAcima45 = 0;
  int mulheresMenores30Experientes = 0;

  String? candidataMaisNova;
  int menorIdadeExperiente = 999;

  while (true) {
    stdout.write('Digite o nome do candidato ou FIM para encerrar: ');
    String nome = (stdin.readLineSync() ?? '').trim();

    if (nome.toUpperCase() == 'FIM') {
      break;
    }

    String sexo;

    do {
      stdout.write('Digite o sexo (M/F): ');
      sexo = (stdin.readLineSync() ?? '').trim().toUpperCase();

      if (sexo != 'M' && sexo != 'F') {
        print('Sexo inválido. Digite M ou F.');
      }
    } while (sexo != 'M' && sexo != 'F');

    int? idade;

    do {
      stdout.write('Digite a idade: ');
      idade = int.tryParse(stdin.readLineSync() ?? '');

      if (idade == null || idade <= 0) {
        print('Idade inválida.');
        idade = null;
      }
    } while (idade == null);

    String respostaExperiencia;

    do {
      stdout.write('Possui experiência no serviço? (S/N): ');
      respostaExperiencia =
          (stdin.readLineSync() ?? '').trim().toUpperCase();

      if (respostaExperiencia != 'S' &&
          respostaExperiencia != 'N') {
        print('Resposta inválida. Digite S ou N.');
      }
    } while (respostaExperiencia != 'S' &&
        respostaExperiencia != 'N');

    bool possuiExperiencia = respostaExperiencia == 'S';

    if (sexo == 'M') {
      totalHomens++;

      if (possuiExperiencia) {
        somaIdadeHomensExperientes += idade;
        homensExperientes++;
      }

      if (idade > 45) {
        homensAcima45++;
      }
    } else {
      totalMulheres++;

      if (idade < 30 && possuiExperiencia) {
        mulheresMenores30Experientes++;
      }

      if (possuiExperiencia && idade < menorIdadeExperiente) {
        menorIdadeExperiente = idade;
        candidataMaisNova = nome;
      }
    }

    print('Candidato cadastrado com sucesso.');
    print('-----------------------------------');
  }

  print('\n========== RESULTADOS ==========');
  print('Número de candidatos masculinos: $totalHomens');
  print('Número de candidatas femininas: $totalMulheres');

  if (homensExperientes > 0) {
    double mediaIdade =
        somaIdadeHomensExperientes / homensExperientes;

    print(
      'Idade média dos homens com experiência: '
      '${mediaIdade.toStringAsFixed(2)} anos',
    );
  } else {
    print('Nenhum homem com experiência foi cadastrado.');
  }

  if (totalHomens > 0) {
    double percentualAcima45 =
        homensAcima45 * 100 / totalHomens;

    print(
      'Percentual de homens com mais de 45 anos: '
      '${percentualAcima45.toStringAsFixed(2)}%',
    );
  } else {
    print('Percentual de homens com mais de 45 anos: 0.00%');
  }

  print(
    'Mulheres com menos de 30 anos e experiência: '
    '$mulheresMenores30Experientes',
  );

  if (candidataMaisNova != null) {
    print(
      'Candidata mais nova com experiência: '
      '$candidataMaisNova',
    );
    print('Idade: $menorIdadeExperiente anos');
  } else {
    print('Nenhuma candidata com experiência foi cadastrada.');
  }
}