import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/controller/controller.dart';
import 'package:test/counterbox.dart';
import 'package:test/main.dart';

class CounterManagement extends StatelessWidget {
  const CounterManagement({super.key});

  @override
  Widget build(BuildContext context) {
    var text = const Text(
      'Counter Management',
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Management')),
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
              child: text,
            ),
          ),
          FutureBuilder(
            future: Provider.of<Controller>(context).getCounters(),
            builder: (context, snapshot) =>
                (snapshot.connectionState == ConnectionState.waiting)
                    ? const Center(child: CircularProgressIndicator())
                    : Consumer<Controller>(
                        builder: (context, viewmodel, _) => Column(
                          children: [
                            CounterBox(viewmodel.counters
                                .where((counter) =>
                                    counter.title?.toLowerCase() ==
                                    'Counter 1'.toLowerCase())
                                .first),
                            CounterBox(viewmodel.counters
                                .where((counter) =>
                                    counter.title?.toLowerCase() ==
                                    'Counter 2'.toLowerCase())
                                .first),
                            CounterBox(viewmodel.counters
                                .where((counter) =>
                                    counter.title?.toLowerCase() ==
                                    'Counter 3'.toLowerCase())
                                .first),
                            CounterBox(viewmodel.counters
                                .where((counter) =>
                                    counter.title?.toLowerCase() ==
                                    'Counter 4'.toLowerCase())
                                .first)
                          ],
                        ),
                      ),
          ),
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
