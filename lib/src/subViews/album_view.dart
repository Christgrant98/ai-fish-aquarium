import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../utils/widgets/custom_progress_indicator.dart';

class AlbumView extends StatefulWidget {
  const AlbumView({super.key});

  @override
  State<AlbumView> createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  List<String> photoPaths = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Album',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: FutureBuilder(
                  future: _loadPhotos(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return Image.file(
                            File(photoPaths[index]),
                            fit: BoxFit.cover,
                          );
                        },
                        itemCount: photoPaths.length,
                      );
                    } else {
                      return const Center(
                        child: CustomProgressIndicator(),
                      );
                    }
                  }),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _loadPhotos() async {
    final appDir = await getApplicationDocumentsDirectory();
    final photoDir = Directory("${appDir.path}/photos");
    if (photoDir.existsSync()) {
      final List<FileSystemEntity> files = photoDir.listSync();
      photoPaths = files.map((file) => file.path).toList();
    }
  }
}
