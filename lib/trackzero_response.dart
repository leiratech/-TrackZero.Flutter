part of leiratech_trackzero;

class Response {
  int? status;
  dynamic data;
  String? error;

  Response(int? status, dynamic data, [String? error]) {
    if (error != null) {
      this.error = 'error: $error';
    } else {
      this.status = status;
      try {
        this.data = jsonDecode(data);
      } catch (e) {
        this.data = data;
      }
      this.error = status! >= 400
          ? 'Check status $status on https://developer.mozilla.org/en-US/docs/Web/HTTP/Status#client_error_responses'
          : null;
    }
  }

  @override
  String toString() {
    return '{status: $status, data: $data, error:$error}';
  }
}
