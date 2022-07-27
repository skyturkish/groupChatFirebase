// ignore_for_file: file_names

mixin LoadingProcess {
  bool _isLoading = false;

  void changeLoading() {
    _isLoading = !_isLoading;
  }

  bool get isLoading => _isLoading;
}
