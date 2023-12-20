import 'package:sqflite/sqflite.dart';

extension Count on Database {
  Future<int> count(String table, {String? aditionalWhere}) async {
    try {
      var response = await query(table, columns: ['count()'], where: aditionalWhere);
      return (response.first['count()'] as num).toInt();
    } catch (err) {
      return 0;
    }
  }
}
