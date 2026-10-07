import 'dart:io';

String? lerTexto(String mensagem) {
  stdout.write(mensagem);
  return stdin.readLineSync()?.trim();
}

String? lerSexo() {
  while (true) {
    final entrada = lerTexto('digite o sexo (m/F):');
    if (entrada == null) {
      return null;
    }

    final sexo = entrada.toUpperCase();
    if (sexo == 'M' || sexo == 'F') {
      return sexo;
    }
    print('sexo inválido. Digite M ou F.');
  }
}

double? lerPeso() {
  while (true) {
    final entrada = lerTexto('digite o peso em kg: ');
    if (entrada == null) {
      return null;
    }

    var texto = entrada.trim();
    if (texto.contains(',') && texto.contains('.')) {
      texto = texto.replaceAll('.', '').replaceAll(',', '.');
    } else if (texto.contains(',')) {
      texto = texto.replaceAll(',', '.');
    }

    final peso = double.tryParse(texto);
    if (peso != null && peso.isFinite && peso >= 0) {
      return peso;
    }
    print('peso invalido. Digite um número maior ou igual a zero.');
  }
}

void main() {
  int total = 0;
  int baixoPeso = 0;
  int pesoNormal = 0;
  int altoPeso = 0;

  String? nomeFemininoMaiorPeso;
  double maiorPesoFeminino = -1;

  while (true) {
    final nome = lerTexto('Digite o nome ou "FIM" para encerrar: ');
    if (nome == null) {
      print('\nEntrada encerrada.');
      break;
    }

    if (nome.toUpperCase() == 'FIM') {
      break;
    }

    if (nome.isEmpty) {
      print('O nome não pode ficar vazio.');
      continue;
    }

    final sexo = lerSexo();
    if (sexo == null){
      print('\nEntrada encerrada.');
      break;
    }

   final peso = lerPeso();
   if (peso == null) {
    print('\nEntrda encerrada.');
    break;
   }

   final String classificacao;
   if (peso <= 2) {
    classificacao = 'Baixo peso';
    baixoPeso++;
   } else if (peso <= 4) {
    classificacao = 'Normal';
    pesoNormal++;
   } else {
    classificacao = 'Alto peso';
    altoPeso++;
   }

   total++;

   if (sexo == 'F' && peso > maiorPesoFeminino) {
    maiorPesoFeminino = peso;
    nomeFemininoMaiorPeso = nome;
   }

   print('\nNome: $nome');
   print('sexo: $sexo');
   print('classificacao: $classificacao');
  }  

  if (total == 0) {
    print('\nNenhum recém-nascido foi cadastrado.');
    return;
  }

  final percentualBaixo = baixoPeso * 100 / total;
  final percentualNormal = pesoNormal * 100 / total;
  final percentualAlto = altoPeso * 100 / total;

  print('\nRESULTADOS');

  if (nomeFemininoMaiorPeso != null){
    print('Recém-nacida com maior peso: $nomeFemininoMaiorPeso');
    print('Maior peso: ${maiorPesoFeminino.toStringAsFixed(2)} kg');
  } else {
    print('Nenhum recém-nascido do sexo feminino cadastrado.');
  }

  print(
    'Percentual de baixo peso: '
    '${percentualBaixo.toStringAsFixed(2)}%'
  );
  print(
    'Percentual de peso normal: '
    '${percentualNormal.toStringAsFixed(2)}%'
  );
  print(
    'Percentual de alto peso: '
    '${percentualAlto.toStringAsFixed(2)}%'
  );
}