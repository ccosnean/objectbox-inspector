import 'package:objectbox/objectbox.dart';

extension BoxExtension on Box {
  String get displayName =>
      toString().replaceAll("Instance of 'Box<", "").replaceAll(">'", "");
}
