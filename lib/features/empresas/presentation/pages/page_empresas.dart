import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sisconsultas/core/exceptions/unauthorized_exception.dart';
import 'package:sisconsultas/features/auth/presentation/providers/auth_provider.dart';
import 'package:sisconsultas/features/empresas/data/models/empresas_model.dart';
import 'package:sisconsultas/features/empresas/data/services/empresas_api_service.dart';
import 'package:sisconsultas/features/empresas/presentation/widgets/empresa_card.dart';

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
      final response = await EmpresaApiService().getEmpresasSinApi();

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

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (empresas.isEmpty) {
      return const Center(child: Text('No existen empresas'));
    }

    return Scaffold(
      backgroundColor: Color(0xFF061333),
      appBar: AppBar(
        backgroundColor: Color(0xFF061333),
        foregroundColor: Colors.white,
        title: Text(
          'Empresas Vinculadas',
        ),
      ),
      body: RefreshIndicator(
        onRefresh: cargarEmpresas,
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: empresas.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: EmpresaCard(empresa: empresas[index], onTap: () {}),
            );
          },
        ),
      ),
    );
  }
}
