import 'package:flutter/material.dart';
import 'package:formulario1/meu_input.dart';
import 'package:formulario1/meu_input_date.dart';

class FormularioPage extends StatefulWidget {
  const FormularioPage({Key? key}) : super(key: key);

  @override
  _FormularioPageState createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  final TextEditingController _controllerProduto = TextEditingController();
  final TextEditingController _controllerValorProduto = TextEditingController();
  final TextEditingController _controllerDataCompra = TextEditingController();
  final TextEditingController _controllerLocalCompra = TextEditingController();
  String dropdownValue = 'Supermercado';
  late String _itemSelecionado;
  final List<String> _cidades = [
    'São Paulo',
    'Santos',
    'Porto Alegre',
    'Campinas',
    'Rio de Janeiro',
    'Cuiabá',
  ];
  _FormularioPageState() {
    _itemSelecionado = _cidades[0];
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            MeuInputText(
              ctrl: _controllerProduto,
              icone: const Icon(Icons.production_quantity_limits),
              qtdCaracter: 20,
              texthint: "Informe o nome do produto",
              textlabel: "Produto",
              tipoTeclado: TextInputType.text,
            ),
            MeuInputText(
              ctrl: _controllerValorProduto,
              icone: const Icon(Icons.money),
              qtdCaracter: 10,
              texthint: "Informe o Valor",
              textlabel: "Valor",
              tipoTeclado: TextInputType.number,
            ),
            MeuInputText(
              ctrl: _controllerDataCompra,
              icone: const Icon(Icons.calendar_today),
              qtdCaracter: 10,
              texthint: "Informe a data da compra",
              textlabel: "Data",
              tipoTeclado: TextInputType.datetime,
            ),
            const Text("Data da Compra"),
            MeuInputDate(),
            SizedBox(
              height: 29,
            ),
            const Text("Local de Compra"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DropdownButton<String>(
                  isExpanded: true,
                  items: _cidades.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  onChanged: (String? novoItemSelecionado) {
                    setState(() {
                      _itemSelecionado = novoItemSelecionado!;
                      _controllerLocalCompra.text = novoItemSelecionado;
                    });
                  },
                  value: _itemSelecionado),
            ),
            ElevatedButton(
              onPressed: () {
                if (_controllerProduto.text != "" &&
                    _controllerValorProduto.text != "" &&
                    _controllerDataCompra.text != "" &&
                    _controllerLocalCompra.text != "") {
                  salvar(context, true);
                } else {
                  salvar(context, false);
                }
              },
              child: const Text("Salvar"),
            )
          ],
        ),
      ),
    );
  }
}

salvar(BuildContext context, bool podeSalvar) {
  if (podeSalvar) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Confirmação'),
        content: const Text('Deseja realmente salvar'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('Sim'),
          ),
        ],
      ),
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Atenção'),
        content: const Text('Preencha todos os campos'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
