import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SimpleMap extends StatefulWidget {
  SimpleMap({
    super.key,
    required this.lat,
    required this.lon,
    required this.radius,
  });
  final double lat;
  final double lon;
  final String radius;
  @override
  State<SimpleMap> createState() => _SimpleMapState();
}

class _SimpleMapState extends State<SimpleMap> {
  late LatLng _kMapCenter;
  late CameraPosition _kInitialPosition;
  final Set<Marker> _markers = {};
  late Set<Circle> circles;
  late double? radius;
  @override
  void initState() {
    super.initState();
    radius = double.tryParse(widget.radius);
    _kMapCenter = LatLng(widget.lat, widget.lon);
    _kInitialPosition = CameraPosition(
      target: _kMapCenter,
      zoom: 15.0,
      tilt: 0,
      bearing: 0,
    );
    _markers.add(
      Marker(
        markerId: MarkerId(_kMapCenter.toString()),
        position: _kMapCenter,
        infoWindow: const InfoWindow(),
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    circles = Set.from([
      Circle(
        circleId: CircleId('current'),
        center: LatLng(widget.lat, widget.lon),
        radius: radius ?? 0,
        fillColor: Colors.blue.withOpacity(0.3),
        strokeWidth: 3,
        strokeColor: Colors.blue,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: GoogleMap(
        scrollGesturesEnabled: false,
        initialCameraPosition: _kInitialPosition,
        markers: _markers,
        circles: circles,
      ),
    );
  }
}
