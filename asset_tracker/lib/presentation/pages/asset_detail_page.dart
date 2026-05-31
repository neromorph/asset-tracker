import 'package:flutter/material.dart';

/// Asset detail page.
/// Following PRD.md section 3.9 - Asset detail requirements.
class AssetDetailPage extends StatelessWidget {
  final String assetId;

  const AssetDetailPage({super.key, required this.assetId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Aset'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // TODO: Edit asset
            },
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'archive',
                child: Text('Arsipkan'),
              ),
              const PopupMenuItem(
                value: 'delete',
                child: Text('Hapus'),
              ),
            ],
          ),
        ],
      ),
      body: const Center(
        child: Text('Detail Aset'), // TODO: Implement
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add extension record
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}