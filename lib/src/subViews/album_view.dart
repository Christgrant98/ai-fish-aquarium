import 'dart:io';

import 'package:flutter/material.dart';
import 'package:login_flutter/src/utils/widgets/base_modal.dart';
import 'package:login_flutter/src/utils/widgets/layout.dart';
import 'package:path_provider/path_provider.dart';

import '../utils/widgets/custom_progress_indicator.dart';
import '../utils/widgets/text_view.dart';

class AlbumView extends StatefulWidget {
  const AlbumView({super.key});

  @override
  State<AlbumView> createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  List<String> photoPaths = [];

  @override
  Widget build(BuildContext context) {
    return Layout(
      hasBottomNavigationBar: true,
      body: Center(
        child: Container(
          color: Colors.teal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              const TextView(
                text: 'Album',
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: Colors.black,
                textAlign: TextAlign.center,
              ),
              const TextView(
                text:
                    'Explora las fotos que has tomado de tus encuentros submarinos',
                fontSize: 16,
                color: Colors.white,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 35, left: 15, right: 15),
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
                              if (photoPaths.isNotEmpty) {
                                return InkWell(
                                  onTap: () => showDialog(
                                      barrierColor: Colors.black87,
                                      context: context,
                                      builder: (context) {
                                        return _buildPreviewFishPic(index);
                                      }),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.file(
                                      File(photoPaths[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              } else {
                                return const Center(
                                    child: TextView(
                                  text: 'No hay elementos por mostrar',
                                  color: Colors.black,
                                ));
                              }
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
        ),
      ),
    );
  }

  Widget _buildPreviewFishPic(int index) {
    return BaseModal(
      borderRadius: 20,
      paddingValue: 20,
      heightFactor: .6,
      widthFactor: .9,
      content: Column(
        children: [
          const SizedBox(height: 15),
          TextView(
            text: 'Foto #${index + 1}',
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          const SizedBox(height: 40),
          AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.file(
                File(photoPaths[index]),
                fit: BoxFit.cover,
              ),
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
