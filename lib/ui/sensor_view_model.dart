import 'package:sensors_plus/sensors_plus.dart';
import 'package:tilt_sensor/data/sensor_event.dart';

class SensorViewModel {
  Stream<SensorEvent> get eventStream =>
      accelerometerEvents.map((e) => SensorEvent(e.x, e.y, e.z));
}
