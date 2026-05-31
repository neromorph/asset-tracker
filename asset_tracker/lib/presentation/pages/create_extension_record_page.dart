import 'package:flutter/material.dart';

/// Create extension record page.
/// Following PRD.md section 3.9 - Extension record requirements.
class CreateExtensionRecordPage extends StatelessWidget {
  final String assetId;

  const CreateExtensionRecordPage({super.key, required this.assetId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Perpanjangan'),
      ),
      body: const Center(
        child: Text('Form Perpanjangan'), // TODO: Implement
      ),
    );
  }
}