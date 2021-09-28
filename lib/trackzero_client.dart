part of leiratech_trackzero;

class TrackZeroClient {
  String? _apiKey;

  static final TrackZeroClient _inst = TrackZeroClient._internal();

  TrackZeroClient._internal();

  ///Initializes the singleton instance with the supplied API key
  ///
  ///returns a singleton instance of TrackZeroClient
  factory TrackZeroClient(String apiKey) {
    if (_inst._apiKey == null) {
      _inst._apiKey = apiKey;
    }
    return _inst;
  }

  ///Gets the singleton instance
  static TrackZeroClient getInstance() {
    return _inst;
  }

  ///Creates/Updates the Entity
  Future<Response> upsertEntity(Entity entity) async {
    var body = {
      "type": entity.type,
      "id": entity.id,
      "customAttributes": entity.customAttributes
    };

    return await LogApi.upsertEntity(this._apiKey, body);
  }

  ///Deletes the Entity
  ///
  ///[type] - type of entity to be deleted
  ///
  ///[id] - {String | int} - id of the entity to be deleted
  Future<Response> deleteEntity(String type, dynamic id) async {
    var body = {
      "type": type,
      "id": id,
    };

    return await LogApi.deleteEntity(this._apiKey, body);
  }

  ///Creates/Updates the Event
  Future<Response> upsertEvent(Event event) async {
    var body = {
      "id": event.id,
      "emitter": {
        "type": event.emitterType,
        "id": event.emitterId,
      },
      "startTime": event.startTime,
      "endTime": event.endTime,
      "name": event.name,
      "CustomAttributes": event.customAttributes,
      'Targets': event.targets
    };

    return await LogApi.upsertEvent(this._apiKey, body);
  }

  ///Deletes the Event
  ///
  ///[type] - event type/name to be deleted
  ///
  ///[id] - {String | int} - id of the event to be deleted
  Future<Response> deleteEvent(String type, dynamic id) async {
    var body = {
      "type": type,
      "id": id,
    };

    return await LogApi.deleteEvent(this._apiKey, body);
  }

  ///Queries the configuration based on the groupId
  ///
  ///[groupId] - the configuration group Id
  ///
  ///[identifier] - {String | int} - the value you want to check the conditions on
  Future<Response> queryConfiguration(
      String groupId, dynamic identifier) async {
    var body = {"identifier": identifier};

    return await ConfigApi.queryConfiguration(this._apiKey, groupId, body);
  }
}
