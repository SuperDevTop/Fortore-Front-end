class MembershipInfo {
  String membershipName;
  String membershipTime;
  String membershipMin;
  String membershipMax;
  String membershipInterest;
  String membershipRepeattime;

  MembershipInfo({required this.membershipName, required this.membershipTime, required this.membershipMin, required this.membershipMax, required this.membershipInterest, required this.membershipRepeattime});

  MembershipInfo.fromJson(Map<String, dynamic> json)
      : membershipName =json["name"],
        membershipTime =json["times"],
        membershipMin =json["minimum"],
        membershipMax =json["maximum"],
        membershipInterest =json["interest"],
        membershipRepeattime =json["repeat_time"];
}