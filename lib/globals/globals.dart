library cyrs_1.globals;

import 'package:cyrs_1/custom%20classes/diskProreties.dart';

import '../custom classes/user.dart';

User user = User(email: "", username: "", password: "");
DiskProp testDisk = DiskProp(id: "", name: "", description: "", cost: 0, type: "");

bool isAuthOn = true;

String connIp = "http://192.168.69.101:80";

String buildVersion = "0.0.9";