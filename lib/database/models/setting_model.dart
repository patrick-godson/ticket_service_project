class Setting {
  Setting({
    this.id,
    this.link,
  });

  int? id;
  String? link;

  factory Setting.fromMap(Map<dynamic, dynamic> json) => Setting(
        id: json["id"],
        link: json["link"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "link": link,
      };
}
