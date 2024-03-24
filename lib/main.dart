import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:learning_getx/value_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: false,
      ),
      home: SafeArea(child: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final textController = TextEditingController();

  final valueController = ValueController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Valor
            GetX<ValueController>(
              init: valueController,
              builder: (ctrl) {
                return Text('Valor definido: ${ctrl.definedValue} ');
              },
            ),
            //Campo
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: TextField(
                controller: textController,
              ),
            ),
            //Botão
            GetX(
              init: valueController,
              builder: (ctrl) {
                return ctrl.isLoading.value
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          String value = textController.text;
                          valueController.setValue(value);
                        },
                        child: const Text('Confirmar'),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
