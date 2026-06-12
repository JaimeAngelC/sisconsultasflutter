import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;


  const DrawerItem({
    super.key, 
    required this.title, 
    required this.icon, 
    required this.onTap
    });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: TextStyle(color: Colors.white),),
      leading: Icon(icon, color: Colors.white),
      onTap: onTap
    );
  }
}