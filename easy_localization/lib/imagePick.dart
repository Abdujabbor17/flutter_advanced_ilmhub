import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GetImage extends StatefulWidget {
  const GetImage({Key? key}) : super(key: key);

  @override
  State<GetImage> createState() => _GetImageState();
}

class _GetImageState extends State<GetImage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15)
              ),
              child: image.path == ''
                  ? const Center(child: Text("No image selected"))
                  : Image.file(image,fit: BoxFit.cover,
                  filterQuality: FilterQuality.low,
              ),
            ),
            ElevatedButton(
                onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    height: 150,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.camera_alt),
                          title: Text("Take a photo"),
                          onTap: () async {
                            await _pickImage(ImageSource.camera);
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.image),
                          title: const Text("Pick from gallery"),
                          onTap: () async {
                            await _pickImage(ImageSource.gallery);
                            print('======================================');
                            print(image.path);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                child: Text('Get Image'))
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    setState(() {
      image = File(pickedFile!.path);
    });
  }

}

File image = File('');

