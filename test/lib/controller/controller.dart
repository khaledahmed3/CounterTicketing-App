import 'package:flutter/material.dart';
import 'package:test/Model/counter.dart';
import 'package:test/Model/ticket.dart';
import 'package:test/rest.dart';

class Controller extends ChangeNotifier {

  Ticket? ticket;
  List<Counter> counters = [];
  // Rest rest = Rest();
  getTicket() async {
    final data = Ticket.fromJson((await Rest.get('ticket'))[0]);
    ticket = data;
    int appended = data.ticket!;
    appended++;
    ticket?.ticket = appended;
    await Rest.patch('ticket/${ticket?.id}', data: ticket?.toJson());
    notifyListeners();
  }

  getCounters() async {
    counters = [];
    final jsoncounters = await Rest.get('counter');
    for (var counter in jsoncounters) {
      counters.add(Counter.fromJson(counter));
    }
    // notifyListeners();
  }

  goOffline(Counter counter) async {
    counter.status = 'offline';
    await Rest.patch('counter/${counter.id}', data: counter.toJson());
  }

  completeOrder(Counter counter) async {
    counter.status = 'online';
    counter.serving = false;
    await Rest.patch('counter/${counter.id}', data: counter.toJson());
  }

  callNextCustomer(Counter counter) async {
    final data = Ticket.fromJson((await Rest.get('ticket'))[0]);
    int appended = data.current!;
    appended++;
    data.current = appended;
    counter.current = appended;
    counter.status = 'busy';
    await Rest.patch('ticket/${data.id}', data: data.toJson());
    await Rest.patch('counter/${counter.id}', data: counter.toJson());
    notifyListeners();
  }
}
