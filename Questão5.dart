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

    final peso = double.tryParse(entrada.replaceAll(',', ';'));
    if (peso != null && peso.isFinite && peso >= 0) {
      return peso;
    }
    print('peso invalido. Digite um número maior ou igual a zero.');
  }
} 

void main() {
  
}