import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_barcode_scanner/main.dart';
import 'package:qr_mobile_vision/qr_camera.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
   // late CameraController controller;
  final bool isFlashOn=false;

  String? qr;
  double _width = 150;
  double _height = 150;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // controller = CameraController(cameras[0], ResolutionPreset.max);
    // controller.initialize().then((_) {
    //   if (!mounted) {
    //     return;
    //   }
    //   setState(() {});
    // }).catchError((Object e) {
    //   if (e is CameraException) {
    //     switch (e.code) {
    //       case 'CameraAccessDenied':
    //       // Handle access errors here.
    //         break;
    //       default:
    //       // Handle other errors here.
    //         break;
    //     }
    //   }
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.45),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.30),
          ),
          child: Stack(
            children: [
              // !controller.value.isInitialized?
              //   Container():
              //   CameraPreview(controller),
               Align(
                 alignment: Alignment.topCenter,
                 child: Padding(
                   padding:EdgeInsets.symmetric(horizontal: 15.w),
                   child: Container(
                     decoration: BoxDecoration(
                       color: Colors.black.withOpacity(.60),
                       borderRadius: BorderRadius.circular(10.w),
                     ),
                     child: Padding(
                       padding:  EdgeInsets.symmetric(vertical: 15.w),
                       child: const Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           IconWithText(text: 'Barcode',icons: Icons.qr_code,),
                           IconWithText(text: 'Helps',icons: Icons.question_mark_sharp,),
                           IconWithText(text: 'Url Scanner',icons: Icons.arrow_drop_down,),
                         ],
                       ),
                     ),
                   ),
                 ),
               ),
              Container(
                color: Colors.transparent,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: _height,
                      width: _width,
                      child: QrCamera(
                        onError: (context, error) => Text(
                          error.toString(),
                          style: const TextStyle(color: Colors.red),
                        ),
                        // cameraDirection: dirState ? CameraDirection.FRONT : CameraDirection.BACK,
                        cameraDirection: CameraDirection.BACK,
                        qrCodeCallback: (code) {
                          setState(() {
                            qr = code;
                          });
                        },
                        child: Container(
                          // color: Colors.blue,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child: GestureDetector(
                                  onPanUpdate: (details) => setState(() {
                                    log("==>dy${details.delta.dy}");
                                    log("==>dx${details.delta.dx}");


                                    _height += details.delta.dy;
                                    _width += details.delta.dx;

                                  }),
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(width: 1.5, color: Colors.red),
                                        right: BorderSide(width: 1.5, color: Colors.red),
                                      ),
                                    ),
                                    // color: Colors.red,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      top: BorderSide(width: 1.5, color: Colors.red),
                                      right: BorderSide(width: 1.5, color: Colors.red),
                                    ),
                                  ),
                                  // color: Colors.red,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(width: 1.5, color: Colors.red),
                                      left: BorderSide(width: 1.5, color: Colors.red),
                                    ),
                                  ),
                                  // color: Colors.red,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      top: BorderSide(width: 1.5, color: Colors.red),
                                      left: BorderSide(width: 1.5, color: Colors.red),
                                    ),
                                  ),
                                  // color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Text("Height:$_height"),
                    Text("Width:$_width"),
                    Text("$qr"),
                  ],
                ),
              ),
              Positioned(
                bottom: 100,
                child: Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width*0.9,
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.60),
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                  child:  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const IconWithText(text: 'Gallery',icons: Icons.image,),
                        IconWithText(text: 'Flash',icons:isFlashOn? Icons.flash_off:Icons.flash_on,),
                        IconWithText(text: 'Reverse',icons: Icons.cameraswitch,),
                        IconWithText(text: 'Batch',icons: Icons.batch_prediction,),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  final IconData? icons;
  final String text;
  const IconWithText({
    super.key, this.icons, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(icons,size: 20.sp,color: Colors.white,),
          Text(text,style: TextStyle(
            fontSize: 15.sp,
            color: Colors.white
          ),),
          
        ],
      ),
    );
  }
}

class DragDrop extends StatefulWidget {
  const DragDrop({super.key});

  @override
  State<DragDrop> createState() => _DragDropState();
}

class _DragDropState extends State<DragDrop> {

  double _width = 150;
  double _height = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  height: _height,
                  width: _width,
                  color: Colors.blue,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onPanUpdate: (details) => setState(() {
                            log("==>dy${details.delta.dy}");
                            log("==>dx${details.delta.dx}");


                            _height += details.delta.dy;
                            _width += details.delta.dx;

                          }),
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(width: 1.5, color: Colors.red),
                                right: BorderSide(width: 1.5, color: Colors.red),
                              ),
                            ),
                            // color: Colors.red,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 1.5, color: Colors.red),
                              right: BorderSide(width: 1.5, color: Colors.red),
                            ),
                          ),
                          // color: Colors.red,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 1.5, color: Colors.red),
                              left: BorderSide(width: 1.5, color: Colors.red),
                            ),
                          ),
                          // color: Colors.red,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 1.5, color: Colors.red),
                              left: BorderSide(width: 1.5, color: Colors.red),
                            ),
                          ),
                          // color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Text("Height:$_height"),
                Text("Width:$_width"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
