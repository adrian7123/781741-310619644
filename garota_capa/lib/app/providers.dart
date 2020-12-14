import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:garota_capa/pages/home/home_controller.dart';
import 'package:garota_capa/pages/perfil/perfil_controller.dart';

final List<SingleChildWidget> providers = [
  Provider<HomeController>(
    create: (_) => HomeController(),
  ),
  Provider<PerfilController>(
    create: (_) => PerfilController(),
  ),
];
