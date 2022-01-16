import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get formatDate => DateFormat('MMM dd,yyyy').format(this);
}
