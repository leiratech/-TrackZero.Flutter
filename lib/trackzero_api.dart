part of leiratech_trackzero;

class LogApi {
  static const endPoint = "/log";

  ///Creates/Updates the Entity
  static Future<Response> upsertEntity(apiKey, body) async {
    return await post('$endPoint/entities?X-API-KEY=$apiKey', body);
  }

  ///Deletes the Entity
  static Future<Response> deleteEntity(apiKey, body) async {
    return await delete('$endPoint/entities?X-API-KEY=$apiKey', body);
  }

  ///Creates/Updates the Event
  static Future<Response> upsertEvent(apiKey, body) async {
    return await post('$endPoint/events?X-API-KEY=$apiKey', body);
  }

  ///Deletes the Event
  static Future<Response> deleteEvent(apiKey, body) async {
    return await delete('$endPoint/events?X-API-KEY=$apiKey', body);
  }
}

class ConfigApi {
  static const endPoint = "/dynamicconfiguration";

  ///Queries the configuration
  static Future<Response> queryConfiguration(apiKey, groupId, body) async {
    return await post(
        '$endPoint/applicable?X-API-KEY=$apiKey&configurationGroupId=$groupId',
        body);
  }
}
