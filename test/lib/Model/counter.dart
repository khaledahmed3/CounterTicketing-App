class Counter {

  String? id;
  int? current;
  String? status;
  String? title;
  bool? serving;

  Counter({
    this.id,
    this.current,
    this.status,
    this.title,
    this.serving
  });
  Counter.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    current = json['current']?.toInt();
    status = json['status']?.toString();
    title = json['title']?.toString();
    serving = json['serving'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    // data['id'] = id;
    data['current'] = current;
    data['status'] = status;
    data['title'] = title;
    data['serving'] = serving;
    return data;
  }
}
