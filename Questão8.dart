import 'dart:io';

void main() {
  int totalCandidatos = 0;
  int totalMasculino = 0;
  int totalFeminino = 0;

  String? nomeHomemMenorPontuacao;
  double menorPontuacaoMasculina = double.infinity;

  String? codigoHomemMaiorPontuacaoSI;
  double maiorPontuacaoMasculinaSI = -1;

  List<String> aprovadosCC = [];

  while (true) {
    stdout.write('Digite o código do candidato ou 0000 para finalizar: ');
    String codigo = (stdin.readLineSync() ?? '').trim();

    if (codigo == '0000') {
      break;
    }

    String curso;

    do {
      stdout.write('Digite o curso (CC/SI): ');
      curso = (stdin.readLineSync() ?? '').trim().toUpperCase();

      if (curso != 'CC' && curso != 'SI') {
        print('Curso inválido. Digite CC ou SI.');
      }
    } while (curso != 'CC' && curso != 'SI');

    stdout.write('Digite o nome do candidato: ');
    String nome = (stdin.readLineSync() ?? '').trim().toUpperCase();

    String sexo;

    do {
      stdout.write('Digite o sexo (M/F): ');
      sexo = (stdin.readLineSync() ?? '').trim().toUpperCase();

      if (sexo != 'M' && sexo != 'F') {
        print('Sexo iválido. Digite M ou F.');
      }
    } while (sexo != 'M' && sexo != 'F');

    double? pontuacao;

    do {
      stdout.write('Digite a pontuação entre 0 a 5000: ');

      pontuacao = double.tryParse(
        (stdin.readLineSync() ?? '').replaceAll(',', '.'),
      );
      if (pontuacao == null || pontuacao < 0 || pontuacao > 5000) {
        print('Pontuação iválida.');
        pontuacao = null;
      }
    } while (pontuacao == null);

    totalCandidatos++;

    if (sexo == 'M') {
      totalMasculino++;

      if (pontuacao < menorPontuacaoMasculina) {
        menorPontuacaoMasculina = pontuacao;
        nomeHomemMenorPontuacao = nome;
      }

      if (curso == 'SI' && pontuacao > maiorPontuacaoMasculinaSI) {
        maiorPontuacaoMasculinaSI = pontuacao;
        codigoHomemMaiorPontuacaoSI = codigo;
      }
    } else {
      totalFeminino++;
    }

    if (curso == 'CC' && pontuacao > 2500) {
      aprovadosCC.add(
        'código: $codigo | Nome: $nome | '
        'Pontuação: ${pontuacao.toStringAsFixed(0)}',
      );
    }

    print('Candidato cadastrado com sucesso.');
   }
   
   if (totalCandidatos == 0) {
    print('\nNenhum candidato cadastrado.');
    return;
   }

   double percentualMasculino = totalMasculino * 100 / totalCandidatos;

   double percentualFeminino = totalFeminino * 100 / totalCandidatos;

   print('RESULTADOS');

   print('\nCandidatos de CC com mais de 2500 pontos: ');

   if (aprovadosCC.isEmpty) {
    print('Nenhum candidato encontrado.');
   } else {
    for (String candidato in aprovadosCC) {
      print(candidato);
    }
  }

  if (nomeHomemMenorPontuacao != null) {
    print(
      '\nCandidato masculino com menor pontuacao: '
      '$nomeHomemMenorPontuacao',
    );

    print('Pontuação: ${menorPontuacaoMasculina.toStringAsFixed(0)}',);
  } else {
    print('\nNenhum candidato masculino foi cadastrado.');
  }

  if (codigoHomemMaiorPontuacaoSI != null) {
    print(
      '\nCódigo do candidato masculino com maior pontuação em SI: '
      '$codigoHomemMaiorPontuacaoSI',
    );
  } else {
    print('\nNenhum candidato de SI foi casdatrado.');
  }

  print(
    '\nPercentual masculino: '
    '${percentualMasculino.toStringAsFixed(2)}%'
    );

    print(
    '\nPercentual feminino: '
    '${percentualFeminino.toStringAsFixed(2)}%'
    );
}
