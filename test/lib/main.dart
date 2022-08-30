import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/controller/controller.dart';
import 'package:test/counter_management.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (context) => Users()),
        ChangeNotifierProvider(create: (context) => Controller()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ticket Management',
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<Controller>();
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(title: const Text('Queue Ticketing Application')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 100,
            child: Card(
              color: Colors.blue,
              elevation: 5,
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              'Now Serving : ${controller.ticket?.current ?? 'N/a'}'),
                          Container(
                              margin: const EdgeInsets.only(left: 30),
                              child: Text(
                                  'Last Number : ${controller.ticket?.ticket ?? 'N/a'}')),
                        ],
                      ),
                      Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                              onPressed: () async {
                                //  print('a7a');
                                await controller.getTicket();
                                print(controller.ticket);
                              },
                              child: Text('New Ticket',
                                  style: TextStyle(color: Colors.black)))),
                      Text(
                          'Your number is :${controller.ticket?.ticket ?? 'N/a'}'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          FutureBuilder(
              future:
                  Provider.of<Controller>(context, listen: false).getCounters(),
              builder: (context, snapshot) {
                return (snapshot.connectionState == ConnectionState.waiting)
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 100,
                            child: Card(
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 30),
                                          child: Text('Counter 1')),
                                      Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 20),
                                          child: Text(
                                              'Current number :${controller.counters.where((counter) => counter.title?.toLowerCase() == 'Counter 1'.toLowerCase()).first.current} ')),
                                    ],
                                  ),
                                  (controller.counters
                                              .where((counter) =>
                                                  counter.title
                                                      ?.toLowerCase() ==
                                                  'Counter 1'.toLowerCase())
                                              .first
                                              .status ==
                                          'offline')
                                      ? Container(
                                          width: 20,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey))
                                      : (controller.counters
                                                  .where((counter) =>
                                                      counter.title
                                                          ?.toLowerCase() ==
                                                      'Counter 1'.toLowerCase())
                                                  .first
                                                  .status ==
                                              'online')
                                          ? Container(
                                              width: 20,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.green))
                                          : Container(
                                              width: 20,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.red))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 100,
                            child: Card(
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 30),
                                          child: Text('Counter 2')),
                                      Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 20),
                                          child: Text(
                                              'Current number : ${(controller.counters.where((counter) => counter.title?.toLowerCase() == 'Counter 2'.toLowerCase()).first.current)}')),
                                    ],
                                  ),
                                  (controller.counters
                                              .where((counter) =>
                                                  counter.title
                                                      ?.toLowerCase() ==
                                                  'Counter 2'.toLowerCase())
                                              .first
                                              .status ==
                                          'offline')
                                      ? Container(
                                          width: 20,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey))
                                      : (controller.counters
                                                  .where((counter) =>
                                                      counter.title
                                                          ?.toLowerCase() ==
                                                      'Counter 2'.toLowerCase())
                                                  .first
                                                  .status ==
                                              'online')
                                          ? Container(
                                              width: 20,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.green))
                                          : Container(
                                              width: 20,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.red))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 100,
                            child: Card(
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 30),
                                          child: Text('Counter 3')),
                                      Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 20),
                                          child: Text(
                                              'Current number : ${(controller.counters.where((counter) => counter.title?.toLowerCase() == 'Counter 3'.toLowerCase()).first.current)}')),
                                    ],
                                  ),
                                  (controller.counters
                                              .where((counter) =>
                                                  counter.title
                                                      ?.toLowerCase() ==
                                                  'Counter 3'.toLowerCase())
                                              .first
                                              .status ==
                                          'offline')
                                      ? Container(
                                          width: 20,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey))
                                      : (controller.counters
                                                  .where((counter) =>
                                                      counter.title
                                                          ?.toLowerCase() ==
                                                      'Counter 3'.toLowerCase())
                                                  .first
                                                  .status ==
                                              'online')
                                          ? Container(
                                              width: 20,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.green))
                                          : Container(
                                              width: 20,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.red))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 100,
                            child: Card(
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 30),
                                          child: Text('Counter 4')),
                                      Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 20),
                                          child: Text(
                                              'Current number : ${(controller.counters.where((counter) => counter.title?.toLowerCase() == 'Counter 4'.toLowerCase()).first.current)}')),
                                    ],
                                  ),
                                  (controller.counters
                                              .where((counter) =>
                                                  counter.title
                                                      ?.toLowerCase() ==
                                                  'Counter 4'.toLowerCase())
                                              .first
                                              .status ==
                                          'offline')
                                      ? Container(
                                          width: 20,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey))
                                      : (controller.counters
                                                  .where((counter) =>
                                                      counter.title
                                                          ?.toLowerCase() ==
                                                      'Counter 4'.toLowerCase())
                                                  .first
                                                  .status ==
                                              'online')
                                          ? Container(
                                              width: 20,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.green))
                                          : Container(
                                              width: 20,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.red))
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
              }),
        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('View'),
            ),
            ListTile(
              title: const Text('User View'),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const MyHomePage()));
              },
            ),
            ListTile(
              title: const Text('Counter Management View'),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const CounterManagement()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
