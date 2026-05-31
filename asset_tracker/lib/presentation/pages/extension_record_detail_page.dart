import 'package:flutter/material.dart';

/// Extension record detail page.
/// Following PRD.md section 3.9 - Extension record detail requirements.
class ExtensionRecordDetailPage extends StatelessWidget {
  final String recordId;

  const ExtensionRecordDetailPage({super.key, required this.recordId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Dokumen'),
      ),
      body: const Center(
        child: Text('Detail Dokumen/Tagihan'), // TODO: Implement
      ),
    );
  }
}