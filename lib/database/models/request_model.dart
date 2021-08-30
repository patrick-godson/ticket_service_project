class Request {
  Request({
    this.id,
    this.level,
    this.fullName,
    this.phone,
    this.type,
    this.description,
    this.file,
    this.creationDate,
  });

  int? id;
  String? level;
  String? fullName;
  String? phone;
  String? type;
  String? description;
  String? file;
  String? creationDate;

  factory Request.fromMap(Map<dynamic, dynamic> json) => Request(
        id: json["id"],
        level: json["level"],
        fullName: json["fullName"],
        phone: json["phone"],
        type: json["type"],
        description: json["description"],
        file: json["file"],
        creationDate: json["creation_date"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "level": level,
        "fullName": fullName,
        "phone": phone,
        "type": type,
        "description": description,
        "file": file,
        "creation_date": creationDate.toString(),
      };
}
