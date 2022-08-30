import 'package:flutter/material.dart';
import 'package:test/Model/counter.dart';
import 'package:provider/provider.dart';
import 'package:test/controller/controller.dart';

class CounterBox extends StatelessWidget {
  final Counter counter;
  const CounterBox(this.counter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<Controller>();
    return Container(
      margin: const EdgeInsets.all(8),
      color: Colors.blue,
      child: Column(children: [
        Text(counter.title!),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () async {
                  await controller.goOffline(counter);
                },
                child: const Text('Go offline',
                    style: TextStyle(color: Colors.black))),
            const SizedBox(width: 3),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () async {
                  await controller.completeOrder(counter);
                },
                child: const Text('Complete current order',
                    style: TextStyle(color: Colors.black))),
            const SizedBox(width: 3),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () async {
                  await controller.callNextCustomer(counter);
                },
                child: const Text('Call next',
                    style: TextStyle(color: Colors.black)))
          ],
        )
      ]),
    );
  }
}
