import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../constants/app_colors.dart';
import '../../constants/constants.dart';
import '../widgets/app_drawer.dart';

class MapScreen extends StatefulWidget {
   MapScreen({Key? key}) : super(key: key);


   static const LatLng _center = LatLng(37.422, -122.084);
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(25.4083, 68.2606),
    zoom: 15.00,
  );

  List<String> mapTypes= ['normal','hybrid'];

  String _selectedMapType = 'normal';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green,
        elevation: 0,
        foregroundColor: AppColors.black,
      ),
      drawer: AppDrawer(),
      backgroundColor: AppColors.blue,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: getDeviceSize(context).width,
              height: getDeviceSize(context).height * 0.75,
              decoration: const BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(24),
                      bottomLeft: Radius.circular(24))),
            ),
      Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
           // width: getDeviceSize(context).width - 100,
            decoration: const BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: DropdownButton<String>(
              iconEnabledColor: AppColors.white,
              dropdownColor: AppColors.black,
              underline: Container(
                height: 0,
                color: Colors.transparent,
              ),
              value: _selectedMapType,
              items: mapTypes.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e,style:const  TextStyle(color: AppColors.white),),
                );
              }).toList(),
              onChanged:  (value) {
                setState(() {
                  _selectedMapType = value!;
                });
              },
            ),
          ),
          const SizedBox(height: 6,),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only( left: 6,right: 6,bottom: 12),
              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(24)),color: AppColors.white),
              child: GoogleMap(
                initialCameraPosition: _initialPosition,
               // markers: Set<Marker>.of(_markers),
                mapType: _selectedMapType == 'normal' ? MapType.normal :MapType.hybrid,
                myLocationEnabled: true,
                //  compassEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
          ),
        ],
      ),

          ],
        ),
      ),
    );
  }
}
