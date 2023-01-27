import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {

  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  const Questionario({ 
    required this.perguntas, 
    required this.perguntaSelecionada, 
    required this.quandoResponder,
    super.key
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {

    // List<Widget> respostas = [];

    // for(var textoResp in perguntas[_perguntaSelecionada].cast()['respostas']) {
    //   respostas.add(Resposta(textoResp, _responder));
    // }
    
    List<Map<String, Object>> respostas = temPerguntaSelecionada
    ? perguntas[perguntaSelecionada].cast()['respostas']
    : null;

    return Container(
      child: Column(
            children: <Widget>[
              Questao(perguntas[perguntaSelecionada]['texto'].toString()),
              ...respostas
              .map((resp) {
                return Resposta(
                  resp['texto'] as String,
                  () => quandoResponder(
                    int.parse(resp['pontuacao'].toString())
                ));
              }).toList(),
              // ElevatedButton(
              //   onPressed: () {
              //     print('Pergunta respondida!!!');
              //   },
              //   child: const Text('Resposta 2'),
              // ),
              // ElevatedButton(
              //   onPressed: () => print('Pergunta respondida!!'),
              //   child: const Text('Resposta 3'),
              // ),
            ],
          )
    );
  }
}