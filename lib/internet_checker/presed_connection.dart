import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keskalapitest/internet_checker/auto_connection.dart';
import 'package:keskalapitest/internet_checker/internet_controller.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(internetController);
    var ctr = ref.read(internetController);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pressed Connectivity'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              ctr.tekshirdim ? 'Yes' : 'No',
              style: TextStyle(color: ctr.tekshirdim ? Colors.green : Colors.red, fontSize: 40),
            ),
            ElevatedButton(
              onPressed: () {
                ctr.checkInternetConnection();
              },
              child: const Icon(Icons.connect_without_contact),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Keralsiz()));
        },
        child: const Icon(Icons.autofps_select_sharp),
      ),
    );
  }
}
