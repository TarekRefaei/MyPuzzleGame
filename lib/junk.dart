// Widget build(BuildContext context) {
//   var size = MediaQuery.of(context).size;
//   return BlocConsumer<PuzzleBloc, PuzzleState>(
//     listener: (BuildContext context, state) {
//
//     },
//     builder: (BuildContext context, state) {
//       if (state is PuzzleLoading) {
//         return const Scaffold(
//           body: Center(
//             child: CircularProgressIndicator(
//               color: Colors.black,
//             ),
//           ),
//         );
//       }
//       if (state is PuzzleLoaded) {
//         List<Uint8List> imageList = state.loadedCroppedImage;
//         int count = state.value;
//         return SafeArea(
//           child: LayoutBuilder(
//             builder: (BuildContext context, BoxConstraints constraints) {
//               return Scaffold(
//                 // backgroundColor: Colors.green[200],
//                 body: Stack(
//                   children: [
//                     GameBackground(size: size),
//                     SizedBox(
//                       width: size.width - 4.0,
//                       child: Column(
//                         children: [
//                           HeaderTitle(
//                             size: size,
//                             bannerTitle: 'Game Board',
//                           ),
//                           GamePuzzle(
//                             letters,
//                             count,
//                             size,
//                             () {},
//                             imageList: imageList,
//                           ),
//                           Row(),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         );
//       }
//       else {
//         return const Text('Something Wrong');
//       }
//     },
//   );
// }

// List<String> letters = [
//   'A',
//   'B',
//   'C',
//   'D',
//   'E',
//   'F',
//   'G',
//   'H',
//   'I',
//   'A',
//   'B',
//   'C',
//   'D',
//   'E',
//   'F',
//   'G',
//   'H',
//   'I',
//   'A',
//   'B',
//   'C',
//   'D',
//   'E',
//   'F',
//   'G',
//   'H',
//   'I'
// ];



//this old grid View
// GamePuzzle(
// count,
// size,
// clickGrid,
// imageList: imageList,
// ),
// clickGrid(index) {
//   setState(() {
//     print(index);
//     imageList[imageList.indexOf(imageList[0])] = imageList[index];
//
//     // imageList[5]=imageList.elementAt(index);
//     // imageList[index]=imageList.elementAt(5);
//     // imageList[imageList.indexOf(uint8list)] = imageList[index];
//     // imageList[index] = imageList.elementAt(3);
//     // print(index);
//     //change the Picture Success
//     //imageList[index]=uint8list2;
//   });
// }




// slideObjects.where((slideObject) => !slideObject.empty).map(
// (slideObject) {
// // change to animated position
// // disabled checking success on swap process
// return AnimatedPositioned(
// duration: Duration(milliseconds: 200),
// curve: Curves.ease,
// left: slideObject.posCurrent.dx,
// top: slideObject.posCurrent.dy,
// child: GestureDetector(
// onTap: () => changePos(slideObject.indexCurrent),
// child: SizedBox(
// width: slideObject.size.width,
// height: slideObject.size.height,
// child: Container(
// alignment: Alignment.center,
// margin: EdgeInsets.all(2),
// color: Colors.blue,
// child: Stack(
// children: [
// if (slideObject.image != null) ...[
// slideObject.image
// ],
// Center(
// child: TextWidget(
// "${slideObject.indexDefault}",
// color: Color(0xff225f87),
// strokeColor: Colors.white,
// strokeWidth: 8,
// fontFamily: "KidZone",
// fontSize: 40,
// overrideSizeStroke: false,
// ),
// ),

//
// if (state is PuzzleLoaded) {
// puzzlePiecesList = state.sliderPieces;
// // count = state.value;
// return SafeArea(
// child: LayoutBuilder(
// builder: (BuildContext context, BoxConstraints constraints) {
// return Scaffold(
// body: Stack(
// children: [
// GameBackground(size: size),
// SizedBox(
// child: Column(
// children: [
// HeaderTitle(
// size: size,
// bannerTitle: 'Game Board',
// ),
// Padding(
// padding: const EdgeInsets.all(2.0),
// child: Container(
// width: size.width,
// height: size.width,
// child: Stack(
// children: [
// ...[
// Container(
// color: Colors.transparent,
// height: double.maxFinite,
// ),
// ],
// ...puzzlePiecesList
//     .where((element) => element.empty)
//     .map((element) {
// return Positioned(
// top: element.posCurrent.dx,
// left: element.posCurrent.dy,
// child: SizedBox(
// width: element.size.width,
// height: element.size.height,
// child: Container(
// margin: const EdgeInsets.all(3),
// alignment: Alignment.center,
// child: Stack(
// children: [
// ...[
// Opacity(
// opacity: 0.0,
// child: element.image,
// ),
// ]
// ],
// ),
// ),
// ),
// );
// }),
// ...puzzlePiecesList
//     .where((element) => !element.empty)
//     .map((element) {
// return AnimatedPositioned(
// left: element.posCurrent.dx,
// top: element.posCurrent.dy,
// curve: Curves.easeIn,
// duration:
// const Duration(milliseconds: 10),
// child: GestureDetector(
// onTap: () {
// context.read<PuzzleBloc>().add(
// ChangePos(
// indexCurrent:
// element.indexCurrent),
// );
// print(element.indexCurrent);
// },
// child: SizedBox(
// width: element.size.width,
// height: element.size.height,
// child: Container(
// alignment: Alignment.center,
// margin: const EdgeInsets.all(3),
// child: Stack(
// children: [element.image],
// ),
// ),
// ),
// ),
// );
// }).toList()
// ],
// ),
// ),
// ),
// Row(),
// ],
// ),
// ),
// ],
// ),
// );
// },
// ),
// );
// } else {
// return const LoadingScreen();
// }
// if (sliderPiece
//             .where((element) =>
//                 element.indexCurrent == element.indexDefault - 1)
//             .length ==
//         sliderPiece.length &&
//     finish) {
//   print("success");
//   success = true;
// } else {
//   success = false;
// }
// startSlide = true;

//await Future.delayed(const Duration(seconds: 5));

// bool swap = true;
// process = [];
//
// SliderPieces emptyObject =
//     sliderPiece.firstWhere((element) => element.empty);
//
// // 20 * size puzzle shuffle
// for (var i = 0; i < value * 20; i++) {
//   for (var j = 0; j < value / 2; j++) {
//     // get index of empty slide object
//     int emptyIndex = emptyObject.indexCurrent;
//     process.add(emptyIndex);
//     int randKey;
//
//     if (swap) {
//       // horizontal swap
//       int row = emptyIndex ~/ value;
//       randKey = row * value + Random().nextInt(value);
//     } else {
//       int col = emptyIndex % value;
//       randKey = value * Random().nextInt(value) + col;
//     }
//
//     //index of current empty object
//     emptyIndex = emptyObject.indexCurrent;
//     //index of current chosen object
//     int indexCurrent = randKey;
//     // min & max index based on vertical or horizontal
//     int minIndex = min(randKey, emptyIndex);
//     int maxIndex = max(randKey, emptyIndex);
//
//     List<SliderPieces> rangeMoves = [];
//
//     if (randKey % value == emptyIndex % value) {
//       //vertical Line
//       rangeMoves = sliderPiece
//           .where((element) =>
//               element.indexCurrent % value == randKey % value)
//           .toList();
//     } else if (randKey ~/ value == emptyIndex ~/ value) {
//       rangeMoves = sliderPiece;
//     } else {
//       rangeMoves = [];
//     }
//
//     rangeMoves = rangeMoves
//         .where((element) =>
//             element.indexCurrent >= minIndex &&
//             element.indexCurrent <= maxIndex &&
//             element.indexCurrent != emptyIndex)
//         .toList();
//
//     if (emptyIndex < randKey) {
//       rangeMoves.sort((a, b) => a.indexCurrent < b.indexCurrent ? 1 : 0);
//     } else {
//       rangeMoves.sort((a, b) => a.indexCurrent < b.indexCurrent ? 0 : 1);
//     }
//
//     if (rangeMoves.isNotEmpty) {
//       int tempIndex = rangeMoves[0].indexCurrent;
//       Offset tempPos = rangeMoves[0].posCurrent;
//       for (var i = 0; i < rangeMoves.length - 1; i++) {
//         rangeMoves[i].indexCurrent = rangeMoves[i + 1].indexCurrent;
//         rangeMoves[i].posCurrent = rangeMoves[i + 1].posCurrent;
//       }
//       rangeMoves.last.indexCurrent = emptyObject.indexCurrent;
//       rangeMoves.last.posCurrent = emptyObject.posCurrent;
//       emptyObject.indexCurrent = tempIndex;
//       emptyObject.posCurrent = tempPos;
//     }
//
//     if (sliderPiece
//                 .where((element) =>
//                     element.indexCurrent == element.indexDefault - 1)
//                 .length ==
//             sliderPiece.length &&
//         finish) {
//       print("success");
//       success = true;
//     } else {
//       success = false;
//     }
//     startSlide = true;
//
//     // await Future.delayed(const Duration(seconds: 1));
//
//     swap = !swap;
//   }
// }
//
// startSlide = false;
// finishSwap = true;
//
// emit(
//   PuzzleChosenLoaded(sliderPiece),
// );
// print(state);