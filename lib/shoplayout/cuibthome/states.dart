import 'package:shopapp2/page_model/pagemodel.dart';

abstract class homestates{}
class homeinitstate extends homestates{}
class homechangecurrntnevstate extends homestates{}
class homegethomesuccstate extends homestates{}
class homegethomeerroestate extends homestates{}
class homehomelodingstate extends homestates{}
class homecatlodingstate extends homestates{}
class homecatsucstate extends homestates{}
class homecaterrstate extends homestates{}
class homefavsucstate extends homestates{}
class homefavrrstate extends homestates{}
class homegetfavsuccstate extends homestates{}
class homegetfaverroestate extends homestates{}
class homegetfavlodstate extends homestates{}
class homegetusersuccstate extends homestates{}
class homegetusererroestate extends homestates{}
class homegetuserlodstate extends homestates{}
class changevaluedrop extends homestates{}
class Signout extends homestates{}
class  regshopappstateloding  extends homestates{}
class  regshopappstatesucsses  extends homestates{
  final pagemodela model;
  regshopappstatesucsses(this.model);
}
class  regshopappstateerror extends homestates{
  final error;
  regshopappstateerror(this.error);
}