class Chek {
  late String who;
  late String bank;
  late String name;
  late String to_card;
  late String from_card;
  late String amount;
  late String merchant;
  late String terminal;
  late String time;
  late String tranzaksiyaID;

  Chek(
      {required this.name,
      required this.to_card,
      required this.from_card,
      required this.amount,
      required this.merchant,
      required this.terminal,
      required this.who,
      required this.bank,
      required this.tranzaksiyaID,
      required this.time});

  factory Chek.fromJson(Map json){
    return Chek(
      amount: json['amount'].toString(),
      from_card: json['from_json'].toString(),
      to_card: json['to_card'].toString(),
      merchant: json['merchant'].toString(),
      name: json['name'].toString(),
      terminal: json['terminal'].toString(),
      time: json['time'].toString(),
      who: json['who'].toString(),
      bank: json['bank'].toString(),
      tranzaksiyaID: json['tranzaksiyaID'].toString(),
    );
  }

  Map toJson(){
    return {
      'amount' : amount,
      'from_card' : from_card,
      'to_card' : to_card,
      'merchant' : merchant,
      'name' : name,
      'terminal' : terminal,
      'time' : time,
      'tranzaksiyaID' : tranzaksiyaID,
      'bank' : bank,
      'who' : who,
    };
  }

}
