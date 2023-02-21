import 'package:intl/intl.dart';

class GroupedDateData {
  GroupedDateData({required DateTime date, required double value})
      : _value = value,
        _date = date;

  final DateTime _date;
  final double _value;

  get day => DateFormat.E().format(_date);
  get value => _value;
}
