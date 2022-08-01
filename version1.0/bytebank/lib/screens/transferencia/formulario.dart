import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const tituloAppBar = 'Criando Transferência';

const rotuloCampoValor = 'Valor';
const dicaCampoValor = '0.00';

const rotuloCampoNumeroConta = 'Número da conta';
const dicaCampoNumeroConta = '0000';

const textoBotaoConfirmar = 'Confirmar';

class FormularioLubank extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormularioLubankState();
  }
}

class FormularioLubankState extends State<FormularioLubank> {
  final TextEditingController _numContaController = TextEditingController();
  final TextEditingController _valorContaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text(tituloAppBar)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controlador: _numContaController,
              rotulo: rotuloCampoNumeroConta,
              dica: dicaCampoNumeroConta,
            ),
            Editor(
              controlador: _valorContaController,
              rotulo: rotuloCampoValor,
              dica: dicaCampoValor,
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              child: const Text(textoBotaoConfirmar),
              onPressed: () => criaTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }

  void criaTransferencia(BuildContext context) {
    final double? thisValorConta = double.tryParse(_valorContaController.text);
    final int? thisNumConta = int.tryParse(_numContaController.text);

    if (thisNumConta != null && thisValorConta != null) {
      final transferenciaCriada =
          Transferencia(valor: thisValorConta, numeroConta: thisNumConta);
      debugPrint("Criando transferencia");
      debugPrint("$transferenciaCriada");
      Navigator.pop(context, transferenciaCriada);
    }
  }
}