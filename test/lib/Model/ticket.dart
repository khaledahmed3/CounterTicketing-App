class Ticket {
  String? id;
  int? ticket;
  int? current;

  Ticket({this.id, this.ticket, this.current});
  Ticket.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    ticket = json['ticket']?.toInt();
    current = json['current']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ticket'] = ticket;
    data['current'] = current;
    return data;
  }
}
