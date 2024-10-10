import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddSubject extends StatefulWidget {
  const AddSubject({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddSubjectState createState() => _AddSubjectState();
}

class _AddSubjectState extends State<AddSubject> {
  // Variáveis para armazenar os valores dos campos
  String titulo = '';
  String tipo = 'Selecione o Tipo'; // Valor inicial para o dropdown
  String descricao = '';
  String arquivo = '';

  // Opções do dropdown para o campo "Tipo"
  final List<String> tipos = ['Selecione o Tipo', 'Bug', 'Melhoria', 'Outro'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Problemática'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo de inserção para Título
            TextField(
              decoration: const InputDecoration(labelText: 'Título'),
              onChanged: (value) {
                setState(() {
                  titulo = value;
                });
              },
            ),

            // Dropdown para Tipo
            DropdownButton<String>(
              isExpanded: true,
              value: tipo,
              items: tipos.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  tipo = newValue!;
                });
              },
              hint: const Text('Selecione o Tipo'),
            ),

            // TextArea com scroll para descrição da problemática
            Expanded(
              child: TextField(
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  labelText: 'Descrição',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    descricao = value;
                  });
                },
              ),
            ),

            // Campo de envio de arquivos
            TextField(
              decoration: const InputDecoration(
                labelText: 'Envio de Arquivos',
                suffixIcon: Icon(Icons.attach_file),
              ),
              onChanged: (value) {
                setState(() {
                  arquivo = value;
                });
              },
            ),

            // Botões de Cancelar e Enviar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 169, 67, 67),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), 
                    ),
                    minimumSize: const Size(120, 40),
                    backgroundColor: Colors.white,
                    side: const BorderSide(width: 2, color: Color.fromARGB(255, 160, 76, 76)) // Cor do botão cancelar
                  ),
                  onPressed: () {
                    // Ação de cancelar
                    Navigator.pop(context); // Volta para a página anterior
                  },
                  child: const Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Ação de enviar (aqui você adicionaria a lógica de envio)
                    if (kDebugMode) {
                      print('Título: $titulo');
                    }
                    if (kDebugMode) {
                      print('Tipo: $tipo');
                    }
                    if (kDebugMode) {
                      print('Descrição: $descricao');
                    }
                    if (kDebugMode) {
                      print('Arquivo: $arquivo');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 22, 145, 114),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), 
                    ),
                    minimumSize: const Size(120, 40),
                    backgroundColor: Colors.white,
                    side: const BorderSide(width: 2, color: Color(0xFF4CA087))
                  ),
                  child: const Text('Enviar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
