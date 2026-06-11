import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sisconsultas/core/exceptions/unauthorized_exception.dart';
import 'package:sisconsultas/features/auth/presentation/providers/auth_provider.dart';
import 'package:sisconsultas/features/empresas/data/models/empresas_model.dart';
import 'package:sisconsultas/features/empresas/data/services/empresas_api_service.dart';


class PageEmpresas extends StatefulWidget {
  const PageEmpresas({super.key});

  @override
  State<PageEmpresas> createState() => _PageEmpresasState();
}

class _PageEmpresasState extends State<PageEmpresas> {
  bool loading = true;
  List<Empresa> empresas = [];

  @override
  void initState() {
    super.initState();
    cargarEmpresas();
  }

  Future<void> cargarEmpresas() async {
    try {
      final response = await EmpresaApiService().getEmpresas();

      if (!mounted) return;

      setState(() {
        empresas = response?.empresas ?? [];
        loading = false;
      });

    } on UnauthorizedException {

      if (!mounted) return;

      await context.read<AuthProvider>().logout();

    } catch (e) {

      if (!mounted) return;

      setState(() {
        loading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (empresas.isEmpty) {
      return const Center(
        child: Text('No existen empresas'),
      );
    }

    return RefreshIndicator(
      onRefresh: cargarEmpresas,
      child: ListView.builder(
        itemCount: empresas.length,
        itemBuilder: (context, index) {

          final empresa = empresas[index];

          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            child: ListTile(
              leading: const Icon(Icons.business),
              title: Text(
                empresa.razonSocial ?? '',
              ),
              subtitle: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'NIT: ${empresa.nit ?? ''}',
                  ),
                  Text(
                    empresa.estado ?? '',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}