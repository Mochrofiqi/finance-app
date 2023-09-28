// ignore_for_file: unnecessary_this

class Cashflow {
  late int id;
  late String _date;
  late int _nominal;
  late String _note;
  late String _tipe;

  Cashflow(this._date, this._nominal, this._note, this._tipe);

  Cashflow.map(dynamic obj) {
    this._date = obj['date'];
    this._nominal = obj['nominal'];
    this._note = obj['note'];
    this._tipe = obj['tipe'];
  }

  String get date => _date;
  int get nominal => _nominal;
  String get note => _note;
  String get tipe => _tipe;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['date'] = _date;
    map['nominal'] = _nominal;
    map['note'] = _note;
    map['tipe'] = _tipe;
    return map;
  }

  void setCashflowId(int id) {
    this.id = id;
  }
}
