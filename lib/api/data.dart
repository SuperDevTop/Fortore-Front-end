class Data {
  String trx;
  String details;
  String amount;
  String created_at;
  String remainingBalance;
  String trxType;

  Data({required this.trx, required this.details, required this.amount, required this.created_at, required this.remainingBalance, required this.trxType});

  Data.fromJson(Map<String, dynamic> json)
      : trx =json["trx"],
        details = json["details"],
        remainingBalance = json["post_balance"],
        amount = json["amount"],
        trxType = json["trx_type"],
        created_at = json["created_at"];
}