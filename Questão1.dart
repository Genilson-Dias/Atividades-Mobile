import 'dart:io';

void main() {
  const Map<String, double> bolosPrecos = {
    'ovos': 5.5,
    'chocolate': 7.5,
    'cenoura': 6.5,
  };
  final List<String> ordem = [];
  double total = 0.0;
  
  print('CARDÁPIO');
  bolosPrecos.forEach((bolo, preco){
    print('$bolo: R\$ ${preco.toStringAsFixed(2)}');
  });

  print('\nDigite os sabores do pedido.');
  print('QUANDO TERMINAR SEU PEDIDO DIGITE "FIM".');

  while (true) {
    stdout.write('\nSabor: ');
    final String sabor = (stdin.readLineSync()?? '').trim().toLowerCase();

    if (sabor == 'FIM'){
      break;
    }

    if (sabor.isEmpty) {
      print('Digite os sabores que deseja do cardápio.');
    } else if (bolosPrecos.containsKey(sabor)) {
      ordem.add(sabor);
      total += bolosPrecos[sabor]!;
      print('$sabor adicionado ao pedido.');
    } else {
      print('$sabor não está no cardápio.');
    }
  }

  print('\nPEDIDO');

  if (ordem.isEmpty) {
    print('Nenhum sabor foi pedido.');
  } else {
    for (final String bolo in ordem) {
      print('- $bolo: R\$ ${bolosPrecos[bolo]!.toStringAsFixed(2)}');
    }

    print('total = ${total.toStringAsFixed(2)}');
  }
}