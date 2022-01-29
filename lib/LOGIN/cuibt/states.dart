import 'package:shopapp2/page_model/pagemodel.dart';

abstract class loginshopappstate{}
class  loginshopappstateinis  extends loginshopappstate{}
class  loginshopappstateloding  extends loginshopappstate{}
class  loginshopappstatesucsses  extends loginshopappstate{
  final pagemodela model;
  loginshopappstatesucsses(this.model);
}
class  loginshopappstateerror extends loginshopappstate{
  final error;
  loginshopappstateerror(this.error);
}
class changeobserved extends loginshopappstate{}

