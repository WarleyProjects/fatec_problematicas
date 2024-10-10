// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

const List<String> healthList = <String>['Oncologia', 'Cardiologia', 'Urologia', 'Ginecologia'];
const List<String> computationalList = <String>['IA', 'Segurança da Informação', 'Cloud', 'Desenvolvimento'];

class NewSubject extends StatelessWidget {
  const NewSubject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "Novo Assunto",
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
      body: MyForm()
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              style: TextStyle(
                fontSize: 20
              ),
              'Descrição:'
            ),
            TextFormField(
              maxLines: 50,
              minLines: 1,
              decoration: InputDecoration(
                hintText: 'Escreva a descrição do assunto aqui',
                border: OutlineInputBorder()
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Texto em branco!';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            Text(
              style: TextStyle(
                fontSize: 20
              ),
              'Dados disponíveis para análise:'
            ),
            TextFormField(
              maxLines: 50,
              minLines: 1,
              decoration: InputDecoration(
                hintText: 'Escreva quais dados serão disponíveis aqui',
                border: OutlineInputBorder()
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Texto em branco!';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
                        Text(
              style: TextStyle(
                fontSize: 20
              ),
              'Link externo do assunto:'
            ),
            TextFormField(
              maxLines: 2,
              minLines: 1,
              decoration: InputDecoration(
                hintText: 'Cole aqui o link externo',
                border: OutlineInputBorder()
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Texto em branco!';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            Text(
              style: TextStyle(
                fontSize: 20
              ),
              'Área da saúde abordado:'
            ),
            HealthAreaDropdownButton(),
             SizedBox(height: 20),
            Text(
              style: TextStyle(
                fontSize: 20
              ),
              'Área computacional necessária:'
            ),
            ComputationalAreaDropdownButton(),
            SizedBox(height: 20),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 100),
                child: ElevatedButton(
                  onPressed: () => {
                    if (_formKey.currentState!.validate()) {}
                  }, 
                  child: Text('Cadastrar') 
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

class HealthAreaDropdownButton extends StatefulWidget {
  const HealthAreaDropdownButton({super.key});

  @override
  State<HealthAreaDropdownButton> createState() => _HealthAreaDropdownButtonState();
}

class _HealthAreaDropdownButtonState extends State<HealthAreaDropdownButton> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: dropdownValue,
      hint: Text('Selecione uma opção'),
      items: healthList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(), 
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
    );
  }
}

class ComputationalAreaDropdownButton extends StatefulWidget {
  const ComputationalAreaDropdownButton({super.key});

  @override
  State<ComputationalAreaDropdownButton> createState() => _ComputationalAreaDropdownButton();
}

class _ComputationalAreaDropdownButton extends State<ComputationalAreaDropdownButton> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: dropdownValue,
      hint: Text('Selecione uma opção'),
      items: computationalList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(), 
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
    );
  }
}