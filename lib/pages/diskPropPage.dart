import 'package:cyrs_1/custom%20classes/diskProreties.dart';
import 'package:flutter/cupertino.dart';

class DiskPropPage extends StatelessWidget {
  final DiskProp? disk;

  const DiskPropPage({Key? key, required this.disk}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: Text(disk?.name as String),
      );
}
