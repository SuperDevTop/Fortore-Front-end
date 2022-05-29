class DepositData {
  String transactionId;
  String processingDate;
  String paymentStatus;
  String paymentGateWay;
  String paymentAmount;

  DepositData({required this.transactionId, required this.processingDate, required this.paymentStatus, required this.paymentAmount, required this.paymentGateWay});

  DepositData.fromJson(Map<String, dynamic> json)
      : transactionId =json["TransactionID"],
        processingDate =json["Time"],
        paymentStatus =json["status"],
        paymentGateWay =json["gateway"],
        paymentAmount =json["amount"];
}