import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:foode/presentation/widgets/small_button.dart';
import 'package:foode/utils/navigator_utils.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

import '../../../Screens/address.dart';
import '../../pages/location/Location_picker_controller.dart';
import '../../routes/routes.dart';
import '../filled_icon.dart';
import '../loading_widget.dart';
import '../m_scaffold.dart';
import '../space.dart';
import 'polyline_painter.dart';
import 'tile_servers.dart';
import 'utils.dart';
import 'm_marker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';

class MapWidget extends StatefulWidget {
  final bool isFromSetting;
   final MapController? mapController;
  final List<MMarker> markers;
  final List<PolyLine> lines;
  final LatLng? center;
  final double? zoom;
  final Function(LatLng location)? onTap;
  const MapWidget({Key? key, this.isFromSetting=false,this.mapController ,this.markers = const [], this.center, this.zoom, this.lines = const [], this.onTap}) : super(key: key);

  @override
  MapWidgetState createState() => MapWidgetState();
}

class MapWidgetState extends State<MapWidget>  with SingleTickerProviderStateMixin{
  late MapController controller;
  late AnimationController bottomSheet;
  location_picker_controller locationcontroller =Get.put(location_picker_controller());

  @override
  void initState() {
    bottomSheet = AnimationController(vsync: this ,duration: const Duration(seconds: 1));
    controller = MapController(
      location: widget.center ?? const LatLng(13.058083, 80.207743),
      zoom: widget.zoom ?? 15
    );
    controller=widget.mapController!;
    super.initState();
  }

  void _gotoDefault() {
    controller.center =locationcontroller.pickedLocation.value;
    controller.zoom = 15;
    setState(() {});
  }

  void _onDoubleTap(MapTransformer transformer, Offset position) {
    const delta = 0.5;
    final zoom = clamp(controller.zoom + delta, 2, 12);

    transformer.setZoomInPlace(zoom, position);
    setState(() {});
  }

  Offset? _dragStart;
  double _scaleStart = 1.0;
  void _onScaleStart(ScaleStartDetails details) {
    _dragStart = details.focalPoint;
    _scaleStart = 1.0;
  }

  void _onScaleUpdate(ScaleUpdateDetails details, MapTransformer transformer) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;

    if (scaleDiff > 0) {
      controller.zoom += 0.02;
      setState(() {});
    } else if (scaleDiff < 0) {
      controller.zoom -= 0.02;
      setState(() {});
    } else {
      final now = details.focalPoint;
      final diff = now - _dragStart!;
      _dragStart = now;
      transformer.drag(diff.dx, diff.dy);
      setState(() {});
    }
  }

  Widget _buildMarkerWidget(Offset pos, Widget child) {
    double h = 0.0, w = 0.0;

    if(child is MMarker){
      h = child.height;
      w = child.width;
    } else {
      h = 40;
      w = 40;
    }

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
      left: pos.dx - (w/2),
      top: pos.dy - h,
      width: w,
      height: h,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      body: MapLayout(
        controller: controller,
        builder: (context, transformer) {
          final markers = widget.markers.map((e) => _buildMarkerWidget(transformer.toOffset(e.latLng), e)).toList();
          final lines = widget.lines.map((e) => CustomPaint(
            painter: PolylinePainter(transformer: transformer, line: e),
          ));
          final centerLocation = Offset(
              transformer.constraints.biggest.width / 2,
              transformer.constraints.biggest.height / 2);

          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onDoubleTapDown: (details) => _onDoubleTap(
              transformer,
              details.localPosition,
            ),
            onTapUp: (details) {
              final tapped = transformer.toLatLng(details.localPosition);
              widget.onTap?.call(tapped);
            },
            onScaleStart: _onScaleStart,
            onScaleUpdate: (details) => _onScaleUpdate(details, transformer),
            child: Listener(
              behavior: HitTestBehavior.opaque,
              onPointerSignal: (event) {
                if (event is PointerScrollEvent) {
                  final delta = event.scrollDelta.dy / -1000.0;
                  final zoom = clamp(controller.zoom + delta, 2, 12);

                  transformer.setZoomInPlace(zoom, event.localPosition);
                  setState(() {});
                }
                if(event is PointerUpEvent){
                  print(event.position);
                }
              },
              child: Stack(
                children: [
                  TileLayer(
                    builder: (context, x, y, z) {
                      final tilesInZoom = pow(2.0, z).floor();

                      while (x < 0) {
                        x += tilesInZoom;
                      }
                      while (y < 0) {
                        y += tilesInZoom;
                      }

                      x %= tilesInZoom;
                      y %= tilesInZoom;

                      return CachedNetworkImage(
                        imageUrl: google(z, x, y),
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  // homeMarkerWidget,
                  ...lines,
                  ...markers,

                  //centerMarkerWidget,
                ],
              ),
            ),
          );
        },
      ),
      //   bottomSheet: widget.isfromNavbar! ? null:BottomSheet(
      //   constraints: const BoxConstraints(
      //     //maxHeight: 200
      //   ),
      //   onClosing: () {
      //
      //   },
      //   builder: (BuildContext context) {
      //     return Column(
      //       mainAxisSize: MainAxisSize.min,
      //       crossAxisAlignment: CrossAxisAlignment.stretch,
      //       children: [
      //         const Space(),
      //         Obx(()=>ListTile(
      //           contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      //           leading: const FilledIcon(
      //             icon: Icons.location_on_outlined,
      //           ),
      //           title: Row(
      //             children: [
      //               Expanded(child: Text(locationcontroller.mainAddress.value)),
      //               OutlinedButton(
      //                 onPressed: () {
      //                   context.push(Routes.manualLocation);
      //                 },
      //                 child: const Text('Change'),
      //               ).small()
      //             ],
      //           ),
      //           subtitle:
      //           Text(locationcontroller.FullAddress.value),
      //         ),
      //         ),
      //         const Space(),
      //         Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 24),
      //           child: FilledButton(
      //               onPressed: () {
      //                 // widget.isFromSetting? {
      //                 //   showModalBottomSheet(
      //                 //       context: context,
      //                 //       isScrollControlled: true,
      //                 //       builder: (_) => DetailedAddress()),
      //                 // }:context.push(Routes.home);
      //               context.pop();
      //               },
      //               child: const Text('Confirm Location')),
      //         ),
      //         const Space(),
      //       ],
      //     );
      //   },
      //   enableDrag: true,
      //   animationController: bottomSheet,
      // ) ,
      //
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton:widget.isfromNavbar! ?   null: Obx(()=> Transform.translate(
      //     offset: Offset(0, -32),
      //     child:locationcontroller.isloading.value? CupertinoActivityIndicator(color: Colors.orange,radius: 20,) : ElevatedButton.icon(
      //         onPressed: () async {
      //           await locationcontroller.getCurrentLocation();
      //           _gotoDefault();
      //         },
      //         style: ElevatedButton.styleFrom(
      //             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      //             visualDensity: VisualDensity.standard,
      //             textStyle: TextStyle(fontSize: 13),
      //             backgroundColor: Theme.of(context).cardColor
      //         ),
      //         icon: Icon(Icons.gps_fixed_rounded, size: 14,),
      //         label:Text('Locate me')),
      //   ),
      // ),
    );
  }
}