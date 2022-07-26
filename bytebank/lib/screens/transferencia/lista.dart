import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

const tituloAppBar = "Lubank";

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
        title: const Text(tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget.transferencias.length,
        itemBuilder: (
          context,
          indice,
        ) {
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
              atualiza(trasnferenciaRecebida);
            },
          );
        },
      ),
    );
  }

  void atualiza(Transferencia? trasnferenciaRecebida) {
    debugPrint("Chegou no then do Future");
    debugPrint('$trasnferenciaRecebida');
    setState(
      () {
        widget.transferencias.add(trasnferenciaRecebida!);
        debugPrint("Atualizando a tela! Adicionando transferencia");
      },
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
