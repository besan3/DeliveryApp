import 'package:flutter/cupertino.dart';

extension IterableExt on Iterable<Widget> {
  List<Widget> addSeparator({required Widget separator}) {
    final List<Widget> list = [];
    final iterator = this.iterator;
    if (iterator.moveNext()) {
      list.add(iterator.current); // Add the first element to the list
      while (iterator.moveNext()) {
        list.add(separator); // Add the separator
        list.add(iterator.current); // Add the next element to the list
      }
    }
    return list;
  }
}
