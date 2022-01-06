//
// import 'package:flutter/material.dart';
// import 'package:gourmet_eats/views/cart_view.dart';
//
// class AppBarWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomAppBar(
//         child: bottomBar(context),
//       ),
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.white),
//         backgroundColor: Colors.grey[900],
//         centerTitle: true,
//         title: Text("Beef Burger",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),),
//         actions: [
//           Badge(
//             badgeColor: Colors.orange,
//             position: BadgePosition.topEnd(top: 10, end: 10),
//             showBadge: true,
//             badgeContent: Text('$counter'),
//             child: IconButton(
//               icon: Icon(
//                 Icons.shopping_basket,
//                 color: Colors.white,
//               ),
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => CartView()));
//               },
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           child: Column(
//             children: [
//               Container(
//                 height: 250.0,
//                 child: Center(child: Text("IMAGE",style: TextStyle(fontSize: 30.0),)),),
//               orderList(context),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
