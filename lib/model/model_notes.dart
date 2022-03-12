class Notes {
 int?  id;
  String? body;
  String? updated;
  String? created;

  Notes({ this.id, this.body, this.updated, this.created});

 Notes.fromJson(Map<String, dynamic> json) {
    id = json['id']  ;
    body = json['body'];
    updated = json['updated'];
    created  = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['body'] = this.body;
    data['updated'] = this.updated;
    data['created'] = this.created;
    return data;
  }
}