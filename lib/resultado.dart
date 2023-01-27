import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  const Resultado(
    this.pontuacao,
    this.quandoReiniciarQuestionario,
    {super.key}
  );

  String get fraseResultado {
    if(pontuacao < 8) {
      return 'Parabéns!';
    } else if(pontuacao < 16) {
      return 'Você é bom!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              fraseResultado,
              style: const TextStyle(
                fontSize: 28,
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                color: Colors.blue,
              )
            ),
            onPressed: quandoReiniciarQuestionario,
            child: const Text(
              'Reiniciar?',
              style: TextStyle(
                fontSize: 18
              ),
            )
          )
        ],
      )
    );
  }
}
