import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ride_sync/colours.dart';

class AddVehiclePage extends StatefulWidget {
  const AddVehiclePage({Key? key}) : super(key: key);

  @override
  _AddVehiclePageState createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController makeController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController regNumberController = TextEditingController();
  TextEditingController carCapacityController = TextEditingController();
  TextEditingController drivingLicenseController = TextEditingController();

  String? carType;
  File? drivingLicenseImage;
  bool isOCRProcessing = false;
  final picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        drivingLicenseImage = File(pickedFile.path);
        isOCRProcessing = true;
      });
      await performOCROnLicense(drivingLicenseImage!);
    }
  }

  Future<void> performOCROnLicense(File image) async {
    final inputImage = InputImage.fromFile(image);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    final RecognizedText recognizedText =
        await textDetector.processImage(inputImage);

    String extractedText = recognizedText.text;

    // Regular expression pattern to match the DL number
    RegExp dlNumberPattern =
        RegExp(r'[A-Z]{2}\d{2}\s?\d{11}'); // Adjust this pattern as needed

    String? dlNumber;
    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        String textLine = line.text;
        // Check if the line contains the DL number
        if (dlNumberPattern.hasMatch(textLine)) {
          dlNumber = dlNumberPattern.firstMatch(textLine)?.group(0);
          break;
        }
      }
      if (dlNumber != null) {
        break;
      }
    }

    setState(() {
      isOCRProcessing = false;
      drivingLicenseController.text = dlNumber ?? 'DL number not found';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Vehicle', style: TextStyle(color: Colors.white)),
        backgroundColor: deepGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Make',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: makeController,
                  decoration: InputDecoration(
                    hintText: 'Enter vehicle make',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the vehicle make';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                const Text(
                  'Model',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: modelController,
                  decoration: InputDecoration(
                    hintText: 'Enter vehicle model',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the vehicle model';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                const Text(
                  'Car Type',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                DropdownButtonFormField<String>(
                  value: carType,
                  items: ['EV', 'Petrol', 'Diesel'].map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      carType = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a car type';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                const Text(
                  'Registration Number',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: regNumberController,
                  decoration: InputDecoration(
                    hintText: 'Enter registration number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the registration number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                const Text(
                  'Car Capacity',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: carCapacityController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter car capacity',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the car capacity';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                const Text(
                  'Driving License',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: pickImage,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        drivingLicenseImage == null
                            ? Text('Upload Driving License')
                            : Text('Driving License Uploaded'),
                        Icon(Icons.upload_file),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                if (isOCRProcessing)
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                if (!isOCRProcessing && drivingLicenseImage != null)
                  TextFormField(
                    controller: drivingLicenseController,
                    decoration: InputDecoration(
                      hintText: 'Extracted Driving License Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please upload a driving license';
                      }
                      return null;
                    },
                  ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // Proceed to submit the data
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text('Vehicle details added successfully!')),
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: deepGreen,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
