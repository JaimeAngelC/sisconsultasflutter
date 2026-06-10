import 'package:flutter/material.dart';
import 'package:sisconsultas/features/home/presentation/widgets/custom_item.dart';

class AppDrawer extends StatelessWidget {
  final String name;
  final String email;
  
  const AppDrawer({
    super.key, 
    required this.name, 
    required this.email,     
    });

  @override
  Widget build(BuildContext context) {
    

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, 
        children: [

          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green[800],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Bienvenido $name",),
                Text(email),
              ],
            ),
          ),

          DrawerItem(
            icon: Icons.home, 
            title: "Inicio", 
            onTap: (){}
            ),

          DrawerItem(
            icon: Icons.person, 
            title: "Perfil", 
            onTap: (){}
            ),

          DrawerItem(
            icon: Icons.settings, 
            title: "Configuración", 
            onTap: (){}
            ),


        ]),
    );
  }
}