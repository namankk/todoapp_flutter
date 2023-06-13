class TodoEntity{
  final String _data;
  final bool _isChecked;

  TodoEntity(this._data, this._isChecked);
  String get data=>_data;
  bool get isChecked=>_isChecked;
}