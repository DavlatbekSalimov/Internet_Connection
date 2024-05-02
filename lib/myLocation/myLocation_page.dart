import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keskalapitest/internet_checker/presed_connection.dart';
import 'package:keskalapitest/myLocation/location_controller.dart';

class MyLocationPoint extends ConsumerWidget {
  const MyLocationPoint({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(mylocationController);
    var ctr = ref.watch(mylocationController);
    return Scaffold(
      body: ctr.isLoading
          ? Center(
              child: Text('${ctr.myPosition.latitude} ${ctr.myPosition.longitude}'),
            )
          : const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(strokeWidth: 4, color: Colors.lightBlueAccent),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Waiting'),
                ],
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              ctr.joylashuvniAniqlash();
            },
            child: const Icon(Icons.location_on_outlined),
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
            },
            child: const Icon(
              Icons.settings_input_antenna_rounded,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
