
class EventModel {
  int idEvent;
  String name;
  String description;
  String urlPhoto;
  String color;
  String infoDate;
  bool infoStatus;
  String city;
  String state;
  String location;

  EventModel(
      {this.idEvent,
      this.name,
      this.description,
      this.urlPhoto,
      this.color,
      this.infoDate,
      this.infoStatus,
      this.city,
      this.state,
      this.location});

  EventModel.fromJson(Map<String, dynamic> json) {
    idEvent = json['id_event'];
    name = json['name'];
    description = json['description'];
    urlPhoto = json['url_photo'];
    color = json['color'];
    infoDate = json['info_date'];
    infoStatus = json['info_status'];
    city = json['city'];
    state = json['state'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_event'] = this.idEvent;
    data['name'] = this.name;
    data['description'] = this.description;
    data['url_photo'] = this.urlPhoto;
    data['color'] = this.color;
    data['info_date'] = this.infoDate;
    data['info_status'] = this.infoStatus;
    data['city'] = this.city;
    data['state'] = this.state;
    data['location'] = this.location;
    return data;
  }

  static List<EventModel> fromJsonList(List list) {
    if (list == null) return null;
    return list.map<EventModel>((item) => EventModel.fromJson(item)).toList();
  }

  @override
  String toString() {
    return '${this.toJson()}';
  }
}
