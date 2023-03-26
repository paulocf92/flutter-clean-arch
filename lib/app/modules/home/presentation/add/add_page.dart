import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/app/modules/home/domain/models/dtos/user_dto.dart';
import 'package:flutter_clean_arch/app/modules/home/presentation/add/add_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final controller = Modular.get<AddController>();
  final formKey = GlobalKey<FormState>();

  final TextEditingController _nameTextController =
      TextEditingController(text: 'Sid Silva');
  final TextEditingController _emailTextController =
      TextEditingController(text: 'sid@email.com');
  final TextEditingController _phoneTextController =
      TextEditingController(text: '99999999999');

  void alertMessage(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Aviso'),
          content: Text(message),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Modular.to.pop(),
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Contato'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Nome Completo'),
              TextFormField(
                controller: _nameTextController,
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'Required!';
                  }

                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Nome Completo',
                ),
              ),
              const SizedBox(height: 10),
              const Text('E-mail'),
              TextFormField(
                controller: _emailTextController,
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'Required!';
                  }

                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'E-mail',
                ),
              ),
              const SizedBox(height: 10),
              const Text('Telefone'),
              TextFormField(
                controller: _phoneTextController,
                validator: (v) {
                  if (v!.isEmpty) {
                    return 'Required!';
                  }

                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Telefone',
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    var res = await controller.addContact(UserDto(
                      name: _nameTextController.text,
                      email: _emailTextController.text,
                      phone: _phoneTextController.text,
                    ));

                    if (res.success) {
                      alertMessage('Contato adicionado!');
                      Modular.to.pop();
                      Modular.to.pop(true);
                    } else {
                      alertMessage(res.message ?? 'Error');
                    }
                  }
                },
                child: const Text('Adicionar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
