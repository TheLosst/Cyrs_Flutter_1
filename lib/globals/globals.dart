library cyrs_1.globals;

import 'package:cyrs_1/custom%20classes/diskProreties.dart';

import '../custom classes/user.dart';

User user = User(email: "", username: "", password: "");
//DiskProp testDisk = DiskProp(id: "", name: "", description: "", cost: 0, fragmentId: "", type: "",);
List<DiskProp> test = [];
bool isAuthOn = true;

var shopList = ["beri.shop", " mobicomshop.ru", "comparema", "sly.ru"];
List<bool> like = [false, false, false, false, false];
List<bool> shoppingCard = [false, false, false, false, false];
String connIp = "http://192.168.69.246:80";

String buildVersion = "0.0.9";