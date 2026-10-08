import 'dart:io';

class Professor {
  Professor({
    required this.codigo,
    required this.nome,
    required this.sexo,
    required this.salarioBruto,
    required this.salarioLiquido,
  });

  final String codigo;
  final String nome;
  final String sexo;
  final double salarioBruto;
  final double salarioLiquido;
}

void main() {
  const valorHora = 12.30;
  final professores = <Professor>[];

  while (true) {
    stdout.write('Digite o código do professor ou 9999 para encerrar: ');
    final codigo = (stdin.readLineSync() ?? '').trim();

    if (codigo == '9999') {
      break;
    }
    if (codigo.isEmpty) {
      print('O código não pode ficar vazio.');
      continue;
    }

    stdout.write('Digite o nome do professor: ');
    final nome = (stdin.readLineSync() ?? '').trim();
    if (nome.isEmpty) {
      print('O nome não pode ficar vazio.');
      continue;
    }

    String sexo;
    do {
      stdout.write('Digite o sexo (M/F): ');
      sexo = (stdin.readLineSync() ?? '').trim().toUpperCase();
      if (sexo != 'M' && sexo != 'F') {
        print('Sexo inválido. Digite M ou F.');
      }
    } while (sexo != 'M' && sexo != 'F');

    double? horasAula;
    do {
      stdout.write('Digite o número de horas de aula no mês: ');
      horasAula = double.tryParse(
        (stdin.readLineSync() ?? '').trim().replaceAll(',', '.'),
      );
      if (horasAula == null || !horasAula.isFinite || horasAula < 0) {
        print('Quantidade de horas inválida. Digite um valor não negativo.');
        horasAula = null;
      }
    } while (horasAula == null);

    final salarioBruto = horasAula * valorHora;
    final desconto = sexo == 'M' ? 0.10 : 0.05;
    professores.add(
      Professor(
        codigo: codigo,
        nome: nome,
        sexo: sexo,
        salarioBruto: salarioBruto,
        salarioLiquido: salarioBruto * (1 - desconto),
      ),
    );
  }

  print('\n========== LISTAGEM DE PROFESSORES ==========');
  if (professores.isEmpty) {
    print('Nenhum professor foi cadastrado.');
  } else {
    for (final professor in professores) {
      print('Código: ${professor.codigo}');
      print('Nome: ${professor.nome}');
      print('Salário bruto: R\$ ${professor.salarioBruto.toStringAsFixed(2)}');
      print(
        'Salário líquido: R\$ '
        '${professor.salarioLiquido.toStringAsFixed(2)}',
      );
      print('---------------------------------------------');
    }
  }

  final homens = professores.where((professor) => professor.sexo == 'M');
  final mulheres = professores.where((professor) => professor.sexo == 'F');
  final totalHomens = homens.length;
  final totalMulheres = mulheres.length;
  final somaLiquidosHomens = homens.fold<double>(
    0,
    (soma, professor) => soma + professor.salarioLiquido,
  );
  final somaLiquidosMulheres = mulheres.fold<double>(
    0,
    (soma, professor) => soma + professor.salarioLiquido,
  );

  print('\n========== MÉDIA DOS SALÁRIOS LÍQUIDOS ==========');
  if (totalHomens > 0) {
    print(
      'Média masculina: R\$ '
      '${(somaLiquidosHomens / totalHomens).toStringAsFixed(2)}',
    );
  } else {
    print('Nenhum professor masculino foi cadastrado.');
  }

  if (totalMulheres > 0) {
    print(
      'Média feminina: R\$ '
      '${(somaLiquidosMulheres / totalMulheres).toStringAsFixed(2)}',
    );
  } else {
    print('Nenhuma professora feminina foi cadastrada.');
  }
}
