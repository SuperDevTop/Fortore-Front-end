class InterestData {
  String amount;
  String interest;
  String name;
  String next_time;
  String dates;
  String rewardedDays;
  String remainingTime;

  InterestData({required this.amount, required this.interest, required this.name, required this.next_time, required this.dates, required this.rewardedDays, required this.remainingTime});

  InterestData.fromJson(Map<String, dynamic> json)
      : amount =json["amount"],
        interest = json["interest"],
        next_time = json["next_time"],
        dates = json["signed_at"],
        rewardedDays = json["return_rec_time"],
        remainingTime = json["remainingTime"],
        name = json["name"];
}