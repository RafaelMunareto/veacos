import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:veacos/app/modules/home/home_store.dart';

class BottomNavigateWidget extends StatefulWidget {
  const BottomNavigateWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavigateWidget> createState() => _BottomNavigateWidgetState();
}

class _BottomNavigateWidgetState extends State<BottomNavigateWidget> {
  HomeStore store = Modular.get();

  void _onItemTapped(int index) async {
    await store.client.setBottomNavigateIndex(index);
    switch (store.client.bottomNavigateIndex) {
      case 0:
        Modular.to.navigate('/home/');
        break;
      case 1:
        Modular.to.navigate('/home/meus_calotes');
        break;
      case 2:
        Modular.to.navigate('/home/create');
        break;
      default:
        Modular.to.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 2),
              ),
            ],
            border:
                const Border(top: BorderSide(color: Colors.black, width: 0.4))),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt),
              label: 'Meus Calotes',
            ),
          ],
          currentIndex: store.client.bottomNavigateIndex,
          onTap: (value) => _onItemTapped(value),
        ),
      );
    });
  }
}
