class SubCatModel {
  List<Sub>? subCat;

  SubCatModel({
    this.subCat,
  });
  SubCatModel.fromJson(Map<String, dynamic> json) {
    if (json['sub'] != null) {
      subCat = <Sub>[];
      json['sub'].forEach(
        (v) {
          subCat!.add(Sub.fromJson(v));
        },
      );
    }
  }
}

class Sub {
  int? id;
  String? name;
  List<SubAll>? subAll;
  Sub({
    this.id,
    this.name,
    this.subAll,
  });
  Sub.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];

    if (json['suball'] != null) {
      subAll = <SubAll>[];
      json['suball'].forEach(
        (v) {
          subAll!.add(SubAll.fromJson(v));
        },
      );
    }
  }
}

class SubAll {
  int? subId;
  String? subName;
  SubAll({
    this.subId,
    this.subName,
  });
  SubAll.fromJson(Map<String, dynamic> json) {
    subId = json['id'];
    subName = json['name'];
  }
}
