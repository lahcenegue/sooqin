class AddAdsRequest {
  String? amount;
  String? name;
  String? comment;
  String? image;
  String? token;
  String? catid1;
  String? catid2;
  String? catid3;
  String? catid4;
  AddAdsRequest({
    this.amount,
    this.comment,
    this.image,
    this.name,
    this.token,
    this.catid1,
    this.catid2,
    this.catid3,
    this.catid4,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'amount': amount!.trim(),
      'name': name!.trim(),
      'comment': comment!.trim(),
      'image': image!.trim(),
      'token': token!.trim(),
      'catid1': catid1!.trim(),
      'catid2': catid2!.trim(),
      'catid3': catid3!.trim(),
      'catid4': catid4!.trim(),
    };
    return map;
  }
}

class AddAdsResponse {
  String? msg;
  String? code;

  AddAdsResponse({
    this.msg,
    this.code,
  });

  factory AddAdsResponse.fromJson(Map<String, dynamic> json) {
    return AddAdsResponse(
      msg: json['msg'],
      code: json['code'],
    );
  }
}
