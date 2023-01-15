import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../singleton.dart';

Widget rentalInfo() {
  final _servicio = new ServicioSingleton(); // instancia del singletone

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Column(
        children: [
          Row(
            children: [
              ValueListenableBuilder(
                valueListenable: _servicio.diaINICIO,
                builder: (BuildContext context, DateTime value, Widget? child) {
                  return Expanded(
                    child: _buildInfo(
                        subtitle: 'Start',
                        title: value == null
                            ? ''
                            : DateFormat('dd-MM-yy').format(
                                value), //DateFormat ya lo convierte a String :D
                        icon: Icon(
                          Icons.car_rental,
                          color: Colors.white,
                        )),
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: _servicio.diaFIN,
                builder: (BuildContext context, DateTime value, Widget? child) {
                  return Expanded(
                    child: _buildInfo(
                        subtitle: 'End',
                        title: value == null
                            ? ''
                            : DateFormat('dd-MM-yy').format(
                                value), //DateFormat ya lo convierte a String :D
                        icon: Icon(
                          Icons.car_rental,
                          color: Colors.white,
                        )),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

///////////// construir las cajitas con lka info de cada cosa

Widget _buildInfo({String? title, String? subtitle, Icon? icon}) {
  return Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.grey[100],
      border: Border.all(color: Colors.grey),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
          child: icon,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(subtitle!),
            Text(title!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        )
      ],
    ),
  );
}
