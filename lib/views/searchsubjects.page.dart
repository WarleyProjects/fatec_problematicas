<<<<<<< HEAD
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
=======
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fatec_problematicas/utils/filter_dialog.dart';
import 'package:flutter/material.dart';

class SearchSubjects extends StatelessWidget {
  const SearchSubjects({super.key});

  Future<void> applyFilter(BuildContext context) {
    return showDialog<void>(
      context: context, 
      builder: (context) {
        return FilterDialog();
      }
    );
>>>>>>> 300fd071798af468a073bb03a1c0b2f9c72a9b5d
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
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
=======
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(100), // Altura do AppBar
        child: AppBar(
          scrolledUnderElevation: 0, // Fazer parar de mudar de cor no scroll
          elevation: 0,
          automaticallyImplyLeading: false, // Remover a seta automática
          backgroundColor: Color(0xFFFFFFFF),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 45.0), // Espaçamento superior
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // SizedBox(width: 16),
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Color(0xFF3D3D3D)),
                  onPressed: () {
                    Navigator.of(context).pop(); // Volta para a página anterior
                  },
                ),
                //SizedBox(width: 15), // Espaço entre a seta e o texto
                Text(
                  "Buscar Assunto",
                  style: TextStyle(
                    fontSize: 34,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF3D3D3D),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.logout_rounded, color: Color(0xFF3D3D3D)),
                  onPressed: () {
                    // Navigator.of(context).pop(); 
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: 350,
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Digite sua busca",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search_rounded)
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () => applyFilter(context), 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Aplicar Filtros'),
                      Icon(Icons.filter_list_rounded)
                    ],
                  )),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () => {}, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Limpar Filtros'),
                      Icon(Icons.filter_list_off_rounded)
                    ],
                  )),
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black, // Cor da borda
                  width: 3,          // Largura da borda
                ),
                borderRadius: BorderRadius.circular(12), // Opcional: para bordas arredondadas
              ),
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Center( // Centraliza o conteúdo do ListTile
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8, // Define uma largura customizada
                      child: ListTile(
                        title: Center(child: Text('Um assunto qualquer')),
                        onTap: () => Navigator.pushNamed(context, '/subject'),
                      ),
                    ),
                  );
                }
              ),
            ),
          ),
        ],
      )
>>>>>>> 300fd071798af468a073bb03a1c0b2f9c72a9b5d
    );
  }
}