enum RequestMethod {
  get,
  post,
  put,
  patch,
  delete,
  head,
  options;

  String get rawValue => switch (this) {
        get => "GET",
        post => "POST",
        put => "PUT",
        patch => "PATCH",
        delete => "DELETE",
        head => "HEAD",
        options => "OPTIONS",
      };
}
