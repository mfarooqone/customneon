import 'package:customneon/desktop_view/create_neon/create_neon.dart';
import 'package:flutter/material.dart';

class MobileView extends StatelessWidget {
  const MobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CreateNeon();
    // return Scaffold(
    //   appBar: AppBar(
    //     centerTitle: true,
    //     backgroundColor: AppColors.orange,
    //     title: Text(
    //       'FAST FREE SHIPPING & 1 YEAR WARRANTY',
    //       maxLines: 1,
    //       style: AppTextStyle.white2,
    //     ),
    //   ),
    //   body: SingleChildScrollView(
    //     child: Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             SizedBox(height: 6.h),

    //             ///
    //             ///
    //             ///
    //             Align(
    //               alignment: Alignment.center,
    //               child: Text(
    //                 'CREATE YOUR OWN NEON SIGN',
    //                 maxLines: 1,
    //                 style:
    //                     AppTextStyle.white4.copyWith(color: AppColors.orange),
    //               ),
    //             ),

    //             ///
    //             ///
    //             ///
    //             Align(
    //               alignment: Alignment.center,
    //               child: Text(
    //                 'Design your neon sign with our online custom tool',
    //                 maxLines: 1,
    //                 style: AppTextStyle.black4,
    //               ),
    //             ),
    //             SizedBox(
    //               height: 6.h,
    //             ),

    //             ///
    //             ///
    //             ///
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Expanded(
    //                   child: Container(
    //                     color: AppColors.black,
    //                     width: MediaQuery.of(context).size.width,
    //                     height: MediaQuery.of(context).size.height,
    //                   ),
    //                 ),
    //                 Expanded(
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.start,
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Align(
    //                         alignment: Alignment.center,
    //                         child: Text(
    //                           'Create Your Neon Sign',
    //                           maxLines: 1,
    //                           style: AppTextStyle.black4,
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ],
    //         )),
    //   ),
    //   // backgroundColor: Colors.deepPurple[200],
    //   // appBar: AppBar(
    //   //   title: Text(
    //   //     'FAST FREE SHIPPING & 1 YEAR WARRANTY',
    //   //     maxLines: 1,
    //   //     style: AppTextStyle.black6,
    //   //   ),
    //   // ),
    //   // body: Padding(
    //   //   padding: const EdgeInsets.all(8.0),
    //   //   child: Column(
    //   //     children: [
    //   //       // youtube video
    //   //       Padding(
    //   //         padding: const EdgeInsets.all(8.0),
    //   //         child: AspectRatio(
    //   //           aspectRatio: 16 / 9,
    //   //           child: Container(
    //   //             color: Colors.deepPurple[400],
    //   //           ),
    //   //         ),
    //   //       ),

    //   //       // comment section & recommended videos
    //   //       Expanded(
    //   //         child: ListView.builder(
    //   //           itemCount: 8,
    //   //           itemBuilder: (context, index) {
    //   //             return Padding(
    //   //               padding: const EdgeInsets.all(8.0),
    //   //               child: Container(
    //   //                 color: Colors.deepPurple[300],
    //   //                 height: 120,
    //   //               ),
    //   //             );
    //   //           },
    //   //         ),
    //   //       )
    //   //     ],
    //   //   ),
    //   // ),
    // );
  }
}
