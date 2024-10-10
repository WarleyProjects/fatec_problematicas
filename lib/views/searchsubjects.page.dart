import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchSubject extends StatefulWidget {
  const SearchSubject({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchSubjectState createState() => _SearchSubjectState();
}

class _SearchSubjectState extends State<SearchSubject> {
  // Variáveis para armazenar os valores dos filtros
  String assunto = '';
  String tipo = 'Selecione o Tipo'; // Valor inicial para o dropdown
  String? data; // Armazena a data selecionada
  String parteTitulo = '';
  bool pesquisado = false;

  // Lista mock de problemas
  List<Map<String, String>> problemas = [
    {"titulo": "Problema 1", "descricao": "Descrição do problema 1"},
    {"titulo": "Problema 2", "descricao": "Descrição do problema 2"},
    {"titulo": "Problema 3", "descricao": "Descrição do problema 3"},
    {"titulo": "Problema 4", "descricao": "Descrição do problema 4"},
    {"titulo": "Problema 5", "descricao": "Descrição do problema 5"},
    {"titulo": "Problema 6", "descricao": "Descrição do problema 6"},
    {"titulo": "Problema 7", "descricao": "Descrição do problema 7"},
    {"titulo": "Problema 8", "descricao": "Descrição do problema 8"},
  ];

  // Opções do dropdown para o campo "Tipo"
  final List<String> tipos = ['Selecione o Tipo', 'Bug', 'Melhoria', 'Outro'];

  // Função para abrir o seletor de datas
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        data = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Subject'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo de filtro para Assunto
            TextField(
              decoration: const InputDecoration(labelText: 'Assunto'),
              onChanged: (value) {
                setState(() {
                  assunto = value;
                });
              },
            ),

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

            // Campo de filtro para Data
            TextField(
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Data',
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: () => _selectDate(context),
              controller: TextEditingController(text: data),
            ),

            TextField(
              decoration: const InputDecoration(labelText: 'Parte do Título'),
              onChanged: (value) {
                setState(() {
                  parteTitulo = value;
                });
              },
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 22, 145, 114),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), 
                    ),
                    minimumSize: const Size(120, 40),
                    backgroundColor: Colors.white,
                    side: const BorderSide(width: 2, color: Color(0xFF4CA087))
              ),
              onPressed: () {
                setState(() {
                  pesquisado = true;
                });
              },
              
              child: const Text(
                    "Pesquisar",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF228069),
                    )
              ),
              
            ),

            const SizedBox(height: 20),

            // Exibir a lista de problemas somente após clicar no botão "Pesquisar"
            pesquisado
                ? Expanded(
                    child: ListView.builder(
                      itemCount: problemas.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: const Color.fromARGB(255, 227, 239, 235),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 3, // Sombra no card
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ListTile(
                              title: Text(
                                problemas[index]['titulo'] ?? '',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF228069),
                                ),
                              ),
                              subtitle: Text(
                                problemas[index]['descricao'] ?? '',
                                style: const TextStyle(
                                  fontSize: 16, 
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}