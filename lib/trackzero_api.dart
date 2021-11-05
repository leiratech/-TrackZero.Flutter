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
}

class SpaceApi {
  static const endPoint = "/AnalyticsSpaces";

  ///Gets a space portal session
  static Future<Response> getSession(
      String apiKey, int analyticsSpaceId, int ttl) async {
    return await get(
        '$endPoint/session?analyticsSpaceId=$analyticsSpaceId&ttl=$ttl', {
      "X-API-KEY": apiKey,
    });
  }
}
