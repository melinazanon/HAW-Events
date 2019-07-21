class EventList {
  final int count;
  final List<Event> events;

  EventList({
    this.count,
    this.events,
  });

  factory EventList.fromJson(Map<String, dynamic> parsedJson) {
    var events = parsedJson['events'] as List;
    print(events.runtimeType);
    List<Event> eventList = events.map((i) => Event.fromJson(i)).toList();

    return EventList(
      count: parsedJson['count'],
      events: eventList
    );
  }
}

class Event {

  String image;
  String id;
  String name;
  String contact;
  String start;
  String end;
  String room;
  String type;
  String department;
  String website;
  String description;

  Event ({
    this.image,
    this.id,
    this.name,
    this.contact,
    this.start,
    this.end,
    this.room,
    this.type,
    this.department,
    this.website,
    this.description,
  });

  factory Event.fromJson(Map<String, dynamic> parsedJson){
    return Event(
    image: parsedJson['image'],
    id: parsedJson['_id'],
    name: parsedJson['name'],
    contact: parsedJson['contact'],
    start: parsedJson['start'],
    end: parsedJson['end'],
    room: parsedJson['room'],
    type: parsedJson['type'],
    department: parsedJson['department'],
    website: parsedJson['website'],
    description: parsedJson['description'],
    );
  }
}