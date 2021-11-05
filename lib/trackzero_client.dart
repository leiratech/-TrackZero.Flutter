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

  ///Gets a space portal session
  ///
  ///[analyticsSpaceId] - the analytics space id
  ///
  ///[ttl] - (in seconds) time to live, when the session expires
  Future<Response> getSession(int analyticsSpaceId, [int ttl = 3600]) async {
    if (this._apiKey == null) return Response(400, {"error": "API key null"});
    return await SpaceApi.getSession(this._apiKey!, analyticsSpaceId, ttl);
  }
}
