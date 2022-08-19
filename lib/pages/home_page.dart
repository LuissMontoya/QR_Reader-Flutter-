import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/direcciones_page.dart';

import 'package:qr_reader/pages/mapas_page.dart';
import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';

import 'package:qr_reader/providers/ui_provider.dart';

import 'package:qr_reader/widgets/custom_navigatorbar.dart';
import 'package:qr_reader/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          IconButton(
            onPressed: () => scanListProvider.borrarTodos(),
            icon: Icon(
              Icons.delete_forever,
            ),
          )
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButtom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    // leer bd (temp)
    /* Probar las consultas de la bd
    final temScan = new ScanModel(valor: 'http://google.com');
    DBProvider.db.nuevoScan(temScan);

    DBProvider.db.getScanById(7).then(
          (scan) => print(scan?.valor),
        );

    DBProvider.db.getAllScan().then(print);
    DBProvider.db.deleteAllScans();*/

//usar el scanlistprovider
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);
    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScansTipo('geo');
        return MapasPage();

      case 1:
        scanListProvider.cargarScansTipo('http');
        return DireccionesPage();

      default:
        return MapasPage();
    }
  }
}
