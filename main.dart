
import 'package:flutter/material.dart';

void main() {
  runApp(SimuladorDoCorretor());
}

class SimuladorDoCorretor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simulador do Corretor',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SimuladorPage(),
    );
  }
}

class SimuladorPage extends StatefulWidget {
  @override
  _SimuladorPageState createState() => _SimuladorPageState();
}

class _SimuladorPageState extends State<SimuladorPage> {
  final _valorController = TextEditingController();
  final _rendaController = TextEditingController();
  String resultado = '';

  void calcularFinanciamento() {
    final double valorImovel = double.tryParse(_valorController.text) ?? 0;
    final double renda = double.tryParse(_rendaController.text) ?? 0;

    if (valorImovel > 0 && renda > 0) {
      double percentualFinancia = 0.8;

      if (renda < 2200) {
        percentualFinancia = 0.9;
      } else if (renda < 4000) {
        percentualFinancia = 0.85;
      }

      final double valorFinanciado = valorImovel * percentualFinancia;

      setState(() {
        resultado = 'Valor aproximado financiado: R\$ ${valorFinanciado.toStringAsFixed(2)}';
      });
    } else {
      setState(() {
        resultado = 'Preencha os campos corretamente.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simulador do Corretor')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _valorController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Valor do imóvel'),
            ),
            TextField(
              controller: _rendaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Renda do cliente'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularFinanciamento,
              child: Text('Calcular'),
            ),
            SizedBox(height: 20),
            Text(resultado, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
