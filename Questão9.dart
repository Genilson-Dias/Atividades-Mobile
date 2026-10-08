void main(){
  print('Números encontrados: ');

  for (int numero = 1000; numero <= 9999; numero++) {
    int primeiraParte = numero ~/ 100;
    int segundaParte = numero % 100;

    int soma = primeiraParte + segundaParte;
    String segundaParteFormata = segundaParte.toString().padLeft(2, '0');


    if (soma * soma == numero) {
      print(
        '$numero: $primeiraParte + $segundaParteFormata = '
        '$soma e $soma x $soma = $numero',
      );
    }
  }
}