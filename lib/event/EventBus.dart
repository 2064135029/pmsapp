class EventBus {
  fire(HttpErrorEvent httpErrorEvent) {}
}

class HttpErrorEvent {
  int code;
  String message;

  HttpErrorEvent(code, message) {
    this.code = code;
    this.message = message;
  }
}
