import 'package:flutter/material.dart';
import 'package:sisconsultas/features/home/presentation/widgets/custom_item.dart';

class AppDrawerContent extends StatelessWidget {
  final String name;
  final String email;
  
  const AppDrawerContent({
    super.key, 
    required this.name, 
    required this.email,     
    });

  @override
  Widget build(BuildContext context) {
    

    return ListView(
        padding: EdgeInsets.zero, 
        children: [

          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue[200],
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
            icon: Icons.business_center_sharp, 
            title: "Empresas", 
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


        ]);
    
  }
}