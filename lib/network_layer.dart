part of leiratech_trackzero;

final _baseUrl = "https://api.trackzero.io";

_request(String endpointUrl, body, String method) async {
  try {
    var url = Uri.parse('$_baseUrl$endpointUrl');
    var response;
    switch (method) {
      case "POST":
        response = await http.post(url, body: body);
        break;
      case "DELETE":
        response = await http.delete(url, body: body);
        break;
      default:
        break;
    }
    return new Response(response.statusCode, response.body);
  } catch (e) {
    return new Response(null, null, e.toString());
  }
}

post(String endpointUrl, body) async {
  return await _request(endpointUrl, jsonEncode(body), "POST");
}

delete(String endpointUrl, body) async {
  return await _request(endpointUrl, jsonEncode(body), "DELETE");
}
