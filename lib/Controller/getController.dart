import 'package:get/get.dart';

class getController extends GetxController{
  final kalca_maks = 0.obs;
  final kalca_min = 0.obs;
  final diz_min = 0.obs;
  final diz_max = 0.obs;
  final destek1 = 0.obs;
  final destek2 = 0.obs;

  int get countskalca_maks => kalca_maks.value;
  void incrementkalca_maks() => kalca_maks.value++;
  void decrementkalca_maks () => kalca_maks.value--;

  int get countskalca_min => kalca_min.value;
  void incrementkalca_min() => kalca_min.value++;
  void decrementkalca_min () => kalca_min.value--;

  int get countsdiz_maks => diz_max.value;
  void incremendiz_maks() => diz_max.value++;
  void decrementdiz_maks () => diz_max.value--;

  int get countsdiz_min => diz_min.value;
  void incrementdiz_min() => diz_min.value++;
  void decrementdiz_min () => diz_min.value--;

  int get countsdestek1 => destek1.value;
  void incrementdestek1() => destek1.value++;
  void decrementdestek1 () => destek1.value--;

  int get countsdestek2 => destek2.value;
  void incrementdestek2() => destek2.value++;
  void decrementdestek2 () => destek2.value--;
}