import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  final bool? status;

  const Status({super.key, this.status});

  @override
  Widget build(BuildContext context) {
    return (status!)
    ? Container(color: Colors.green, width: 25, height: 25)
    : Container(color: Colors.grey, width: 25, height: 25);
  }
}