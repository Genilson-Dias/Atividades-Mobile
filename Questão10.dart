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
      stdout.write('DIgite o sexo (M/F): ');
      sexo = (stdin.readLineSync() ?? '').trim().toUpperCase();

      if (sexo != 'M' && sexo != 'F') {
        print('Sexo inválido. Digite M ou F.');
      }
    } while(sexo != 'M' && sexo != 'F');

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

    do{
      stdout.write('Possui experiência no Serviço? (S/N: )');
      respostaExperiencia = (stdin.readLineSync() ?? '').trim().toUpperCase();

      if (respostaExperiencia != 'S' && respostaExperiencia != 'N') {
        print('Resposta inválida. Digite S ou N.');
      }
    }while (respostaExperiencia != 'S' && respostaExperiencia != 'N');

    bool possuiExperiencia = respostaExperiencia == 'S';

    if (sexo == 'M') {
      totalHomens++;

      if (possuiExperiencia) {
        somaIdadeHomensExperientes += idade;
        homensExperientes++;
      }
      
    }
  }
}