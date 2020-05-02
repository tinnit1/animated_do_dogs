import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _notificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Notification page'),
        ),
        floatingActionButton: BotonFlotante(),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int numberNot = Provider.of<_notificationModel>(context).number;
    return BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.pink,
        items: [
          BottomNavigationBarItem(
              title: Text('Bones'), icon: FaIcon(FontAwesomeIcons.bone)),
          BottomNavigationBarItem(
              title: Text('Notification'),
              icon: Stack(
                children: <Widget>[
                  FaIcon(FontAwesomeIcons.bell),
                  Positioned(
                    top: 0.0, right: 0.0,
                    // child: Icon(Icons.brightness_1, size: 8, color: Colors.redAccent,)
                    child: BounceInDown(
                      from: 10,
                      animate: numberNot > 0 ? true : false,
                      child: Bounce(
                        from: 10,
                        controller: (controller) => Provider.of<_notificationModel>(context).bounceController = controller,
                        child: Container(
                          child: Text(
                            '$numberNot',
                            style: TextStyle(color: Colors.white, fontSize: 7),
                          ),
                          alignment: Alignment.center,
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              color: Colors.redAccent, shape: BoxShape.circle),
                        ),
                      ),
                    ),
                  )
                ],
              )),
          BottomNavigationBarItem(
              title: Text('My Dog'), icon: FaIcon(FontAwesomeIcons.dog)),
        ]);
  }
}

class BotonFlotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      child: FaIcon(FontAwesomeIcons.play),
      onPressed: () {
        int number =
            Provider.of<_notificationModel>(context, listen: false).number;
        number++;
        Provider.of<_notificationModel>(context, listen: false).number = number;
        if(number >= 2) {
          final controller =  Provider.of<_notificationModel>(context, listen: false).bounceController;
          controller.forward(from: 0.0);
        }
      },
    );
  }
}

class _notificationModel extends ChangeNotifier {
  int _number = 0;
  AnimationController _bounceController;
  int get number => this._number;

  set number(int value) {
    this._number = value;
    notifyListeners();
  }

  AnimationController get bounceController => this._bounceController;

  set bounceController(AnimationController controller){
    this._bounceController = controller;
  }
}
