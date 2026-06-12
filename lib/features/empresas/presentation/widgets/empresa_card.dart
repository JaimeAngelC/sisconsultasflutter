import 'package:flutter/material.dart';
import 'package:sisconsultas/features/empresas/data/models/empresas_model.dart';

class EmpresaCard extends StatelessWidget {
  final Empresa empresa;
  final VoidCallback? onTap;


  const EmpresaCard({
    super.key, 
    required this.empresa, 
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: const Color(0xFF2B3350),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.blue, width: 0.8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            offset: Offset(0.0, 5.0), //(x,y)
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(              
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFE4F8EC),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.green,
                  ),
                  SizedBox(width: 8,),
                  Text(
                    'Empresa Activa', 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600],
                      ),                  
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10,),

          const Icon(
            Icons.business,
            size: 80,
            color: Colors.green,
          ),

          Text(
            empresa.razonSocial?? '',
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10,),
          Text(
            empresa.nit?? '',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16
            ),
          ),

          const SizedBox(height: 10,),

          InkWell(
            onTap: onTap,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Ingresar',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5,),

                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.green,
                  size: 18,
                ),
              ],
            ),
          )

        ],
      ),

    );
  }
}
