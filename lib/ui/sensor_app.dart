import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tilt_sensor/data/sensor_event.dart';
import 'package:tilt_sensor/ui/sensor_view_model.dart';

class SensorApp extends StatelessWidget {
  final viewModel = SensorViewModel();
  SensorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 화면 고정
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
    ]);
    final centerX = MediaQuery.of(context).size.width / 2 - 50;
    final centerY = MediaQuery.of(context).size.height / 2 - 50;

    return Scaffold(
      body: Stack(
        children: [
          StreamBuilder<SensorEvent>(
              stream: viewModel.eventStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final event = snapshot.data!;

                return Positioned(
                  left: centerX + event.y * 20,
                  top: centerY + event.x * 20,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    width: 100,
                    height: 100,
                  ),
                );
              }),
        ],
      ),
    );
  }
}
