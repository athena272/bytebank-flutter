import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: ListaLubank(),
      ),
    );
  }
}

class FormularioLubank extends StatelessWidget {
  final TextEditingController _numContaController = TextEditingController();
  final TextEditingController _valorContaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Criando uma Transferência")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controlador: _numContaController,
              rotulo: "Número da conta",
              dica: "00000",
            ),
            Editor(
              controlador: _valorContaController,
              rotulo: "Valor",
              dica: "0.00",
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              child: Text("Confirmar"),
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

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  const Editor({
    super.key,
    required this.controlador,
    required this.rotulo,
    required this.dica,
    this.icone,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 20.0,
        ),
        decoration: InputDecoration(
          icon: Icon(icone),
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ListaLubank extends StatefulWidget {
  final List<Transferencia> transferencias = List.empty(growable: true);
  // final List<Transferencia> transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaLubankState();
  }
}

class ListaLubankState extends State<ListaLubank> {
  @override
  Widget build(BuildContext context) {
    //Inicializar uma transferencia
    // widget.transferencias.add(Transferencia(valor: 100.0, numeroConta: 1000));
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lubank"),
      ),
      body: ListView.builder(
        itemCount: widget.transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget.transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia?> future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormularioLubank(),
            ),
          );
          future.then(
            (trasnferenciaRecebida) {
              debugPrint("Chegou no then do Future");
              debugPrint('$trasnferenciaRecebida');
              widget.transferencias.add(trasnferenciaRecebida!);
            },
          );
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia? transferencia;

  const ItemTransferencia(this.transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text("R\$${transferencia?.valor.toString()},00"),
        subtitle: Text("${transferencia?.numeroConta.toString()}"),
      ),
    );
  }
}

class Transferencia {
  final double? valor;
  final int? numeroConta;

  const Transferencia({this.valor, this.numeroConta});

  @override
  String toString() {
    return 'Transferencia{valor: $valor | numeroConta: $numeroConta}';
  }
}
