import 'dart:io';

String? lerTexto(String mensagem) {
  stdout.write(mensagem);
  return stdin.readLineSync()?.trim();
}

int? lerInteiro(String mensagem) {
  while (true) {
    final entrada = lerTexto(mensagem);
    if (entrada == null) {
      return null;
    }

    final valor = int.tryParse(entrada);
    if (valor != null && valor >= 0) {
      return valor;
    }
    print('Digite um número inteiro maior ou igual a zero.');
  }
}

double? lerNota(String mensagem) {
  while (true) {
    final entrada = lerTexto(mensagem);
    if (entrada == null) {
      return null;
    }

    final valor = double.tryParse(entrada.replaceAll(',', '.'));
    if (valor != null && valor.isFinite) {
      return valor;
    }
    print('Digite uma nota válida.');
  }
}

String? lerSexo() {
  while (true) {
    final entrada = lerTexto('Digite o sexo (M/F): ');
    if (entrada == null) {
      return null;
    }

    final sexo = entrada.toUpperCase();
    if (sexo == 'M' || sexo == 'F') {
      return sexo;
    }
    print('Digite M para masculino ou F para feminino.');
  }
}

void main() {
  int totalAlunos = 0;
  int totalAprovados = 0;
  int totalMulheres = 0;

  double somaMediasTurma = 0;
  double somaMediasMulheres = 0;

  double maiorMediaMasculina = -1;
  double maiorMediaFeminina = -1;

  String matriculaMaiorMasculina = 'Nenhum';
  String matriculaMaiorFeminina = 'Nenhuma';

  while (true) {
    final matricula =
        lerTexto('Digite a matrícula ou 00000 para finalizar: ');
    if (matricula == null) {
      print('\nEntrada encerrada.');
      return;
    }
    if (matricula == '00000') {
      break;
    }

    final nome = lerTexto('Digite o nome: ');
    if (nome == null) {
      print('\nEntrada encerrada.');
      return;
    }

    final sexo = lerSexo();
    if (sexo == null) {
      print('\nEntrada encerrada.');
      return;
    }

    final nota1 = lerNota('Digite a primeira nota: ');
    if (nota1 == null) {
      print('\nEntrada encerrada.');
      return;
    }

    final nota2 = lerNota('Digite a segunda nota: ');
    if (nota2 == null) {
      print('\nEntrada encerrada.');
      return;
    }

    final nota3 = lerNota('Digite a terceira nota: ');
    if (nota3 == null) {
      print('\nEntrada encerrada.');
      return;
    }

    final faltas = lerInteiro('Digite o número de faltas: ');
    if (faltas == null) {
      print('\nEntrada encerrada.');
      return;
    }

    final media = (nota1 + nota2 + nota3) / 3;
    final aprovado = media >= 7 && faltas <= 18;

    totalAlunos++; 
    somaMediasTurma += media;

    if (sexo == 'F') {
      totalMulheres++;
      somaMediasMulheres += media;
    }

    if (aprovado) {
      totalAprovados++;

      if (sexo == 'M' && media > maiorMediaMasculina) {
        maiorMediaMasculina = media;
        matriculaMaiorMasculina = matricula;
      }

      if (sexo == 'F' && media > maiorMediaFeminina) {
        maiorMediaFeminina = media;
        matriculaMaiorFeminina = matricula;
      }
    }

    print('\nAluno: $nome');
    print('Média: ${media.toStringAsFixed(2)}');
    print(aprovado ? 'Situação: Aprovado' : 'Situação: Reprovado');
  }

  if (totalAlunos == 0) {
    print('\nNenhum aluno foi cadastrado.');
    return;
  }

  final mediaTurma = somaMediasTurma / totalAlunos;
  final percentualAprovados = totalAprovados * 100 / totalAlunos;

  print('\n RESULTADOS ');
  print('Média da turma: ${mediaTurma.toStringAsFixed(2)}');
  print(
    'Percentual de aprovados: '
    '${percentualAprovados.toStringAsFixed(2)}%',
  );
  print(
    'Matrícula do homem aprovado com maior média: '
    '$matriculaMaiorMasculina',
  );
  print(
    'Matrícula da mulher aprovada com maior média: '
    '$matriculaMaiorFeminina',
  );

  if (totalMulheres > 0) {
    final mediaMulheres = somaMediasMulheres / totalMulheres;
    print('Média das alunas: ${mediaMulheres.toStringAsFixed(2)}');
  } else {
    print('Nenhuma aluna foi cadastrada.');
  }
}
