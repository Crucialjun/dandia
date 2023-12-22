import 'dart:async';

import 'package:dandia/core/constants/app_assets.dart';
import 'package:dandia/core/models/app_user_model.dart';
import 'package:dandia/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeView extends StatefulWidget {
  static const routeName = '/home-view';

  final AppUserModel user;
  const HomeView({super.key, required this.user});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? mapStyle;

  @override
  void initState() {
    DefaultAssetBundle.of(context)
        .loadString(AppAssets.darkMapStyle)
        .then((string) {
      mapStyle = string;
    }).catchError((error) {});
    context.read<HomeBloc>().add(HomeInitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> mapController =
        Completer<GoogleMapController>();

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is HomeLoaded) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('HomeView'),
              ),
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.account_circle,
                            size: 50.r,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.user.username,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'Profile',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: IconButton(
                        icon: const Icon(
                          Icons.info,
                          color: Colors.grey,
                        ),
                        onPressed: () {},
                      ),
                      title: const Text('About'),
                      onTap: () {
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      leading: IconButton(
                        icon: const Icon(
                          Icons.logout,
                          color: Colors.grey,
                        ),
                        onPressed: () {},
                      ),
                      title: const Text('Logout'),
                      onTap: () {
                        context.read<HomeBloc>().add(LogoutEvent());
                      },
                    ),
                  ],
                ),
              ),
              body: Stack(children: [
                GoogleMap(
                  padding: EdgeInsets.only(bottom: 120.h),
                  mapType: MapType.normal,
                  myLocationButtonEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(state.locationData.latitude,
                        state.locationData.longitude),
                    zoom: 14.4746,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    mapController.complete(controller);
                    controller.setMapStyle(mapStyle);
                  },
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -80.h,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        shape: BoxShape.rectangle,
                      ),
                      height: 276.h,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey,
                                    shape: const CircleBorder(),
                                    padding: const EdgeInsets.all(24)),
                                onPressed: () {},
                                child: Icon(Icons.search,
                                    color: Colors.white, size: 25.r)),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey,
                                    shape: const CircleBorder(),
                                    padding: const EdgeInsets.all(24)),
                                onPressed: () {},
                                child: Icon(Icons.home,
                                    color: Colors.white, size: 25.r)),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey,
                                    shape: const CircleBorder(),
                                    padding: const EdgeInsets.all(24)),
                                onPressed: () {},
                                child: Icon(Icons.work,
                                    color: Colors.white, size: 25.r))
                          ])),
                )
              ]));
        }
        return Scaffold(
          body: Center(child: Text(state.toString())),
        );
      },
    );
  }
}
