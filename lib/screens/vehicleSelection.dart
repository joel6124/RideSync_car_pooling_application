import 'package:flutter/material.dart';
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
  int carCapacityController = 1;
  String? carType;

  final RegExp regNumberPattern = RegExp(
    r'(^[A-Z]{2}[0-9]{2}[A-HJ-NP-Z]{1,2}[0-9]{4}$)|(^[0-9]{2}BH[0-9]{4}[A-HJ-NP-Z]{1,2}$)',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Add Vehicle Details',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: deepGreen,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/car_reg.jpg",
                width: 200,
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          ' Make',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextFormField(
                          controller: makeController,
                          decoration: InputDecoration(
                            hintText: 'Enter Vehicle Manufacturer',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: lightGreen,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: deepGreen,
                                ),
                                borderRadius: BorderRadius.circular(8)),
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
                          ' Model',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: modelController,
                          decoration: InputDecoration(
                            hintText: 'Enter Vehicle Model',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: lightGreen,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: deepGreen,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the vehicle model';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        const Text(
                          ' Car Type',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        DropdownButtonFormField<String>(
                          value: carType,
                          items: ['EV', 'Petrol or Diesel'].map((type) {
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
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: lightGreen,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: deepGreen,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select a Car Type';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),
                        const Text(
                          ' Registration Number',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: regNumberController,
                          decoration: InputDecoration(
                            hintText: 'Enter Registration Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: lightGreen,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: deepGreen,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the registration number';
                            } else if (!regNumberPattern.hasMatch(value)) {
                              return 'Invalid registration number format';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),
                        const Text(
                          ' Car Capacity',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(4, (index) {
                            int seatNumber = index + 1;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  carCapacityController = seatNumber;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 4),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: carCapacityController == seatNumber
                                        ? deepGreen
                                        : lightGreen,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 13, horizontal: 22),
                                  child: Text(
                                    '$seatNumber',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        // TextFormField(
                        //   controller: carCapacityController,
                        //   keyboardType: TextInputType.number,
                        //   decoration: InputDecoration(
                        //     hintText: 'Enter Seating Capacity',
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(8),
                        //     ),
                        //     enabledBorder: OutlineInputBorder(
                        //         borderSide: BorderSide(
                        //           color: lightGreen,
                        //         ),
                        //         borderRadius: BorderRadius.circular(8)),
                        //     focusedBorder: OutlineInputBorder(
                        //         borderSide: BorderSide(
                        //           color: deepGreen,
                        //         ),
                        //         borderRadius: BorderRadius.circular(8)),
                        //   ),
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'Please enter the seating capacity';
                        //     }
                        //     return null;
                        //   },
                        // ),
                        SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Vehicle details added successfully!'),
                                ),
                              );
                            }
                          },
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: deepGreen,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  "Add Vehicle",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
