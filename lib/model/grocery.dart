import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
const uuid=Uuid();
final formatter=DateFormat.yMd();
class Grocery {
   Grocery(
      {required this.name,
      required this.quantity,
      required this.amount,
      required this.type,
      required this.date}):id=uuid.v4();

  final String id;
  final String name;
  final String amount;
  final String quantity;
  final DateTime date;
  final String type;
   String get formattedDate{
     return formatter.format(date);
   }
}
