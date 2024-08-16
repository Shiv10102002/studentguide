import 'package:flutter/material.dart';
import 'package:studentguide/constant.dart';

class TaskSLider extends StatelessWidget {
  const TaskSLider({super.key});

  @override
  Widget build(BuildContext context) {
    List<List<Color>> colorlist = [
      [Colors.blue.shade900, Colors.blue.shade700, Colors.indigoAccent],
      [
        const Color.fromARGB(255, 10, 43, 27),
        const Color.fromARGB(255, 4, 56, 47),
        const Color.fromARGB(255, 205, 2, 2)
      ],
      [
        const Color.fromARGB(255, 21, 41, 22),
        Colors.greenAccent,
        Colors.green.shade700
      ],
      [
        const Color.fromARGB(255, 3, 113, 114),
        const Color.fromARGB(255, 23, 41, 45),
        const Color.fromARGB(255, 3, 99, 118)
      ],
      [
        const Color.fromARGB(233, 240, 200, 2),
        const Color.fromARGB(255, 229, 109, 5),
        const Color.fromARGB(255, 247, 24, 17)
      ],
    ];
    return ConstrainedBox(
      constraints: BoxConstraints(
          minHeight: 100,
          maxHeight: 150,
          minWidth: MediaQuery.of(context).size.width * 0.8,
          maxWidth: MediaQuery.of(context).size.width),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return FittedBox(
              fit: BoxFit.fill,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                margin:
                    const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                padding: const EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                    border: Border.all(color: primaryColor),
                    // gradient: LinearGradient(colors: colorlist[index % 4]),
                    borderRadius: BorderRadius.circular(7)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Task heading large dsfas sd fas df df;",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    Text(
                      "Task subheading dfsk sdf s;",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: defaultPadding / 2,
                    ),
                    Text(
                      "Task deadline",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:studentguide/constant.dart';

// class TaskSLider extends StatelessWidget {
//   const TaskSLider({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List<List<Color>> colorlist = [
//       [Colors.blue.shade900, Colors.blue.shade700, Colors.indigoAccent],
//       [
//         Colors.redAccent.shade700,
//         Colors.redAccent,
//         const Color.fromARGB(255, 205, 2, 2)
//       ],
//       [Colors.green.shade900, Colors.greenAccent, Colors.green.shade700],
//       [
//         const Color.fromARGB(255, 3, 113, 114),
//         const Color.fromARGB(255, 5, 192, 239),
//         const Color.fromARGB(255, 3, 99, 118)
//       ],
//       [
//         const Color.fromARGB(233, 240, 200, 2),
//         const Color.fromARGB(255, 229, 109, 5),
//         const Color.fromARGB(255, 247, 24, 17)
//       ],
//     ];
//     return SizedBox(
//       height: MediaQuery.of(context).size.height * 0.3,
//       child: ListView.builder(
//           shrinkWrap: true,
//           scrollDirection: Axis.horizontal,
//           itemCount: 4,
//           itemBuilder: (context, index) {
//             return Container(
//               margin:
//                   const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
//               padding: const EdgeInsets.all(defaultPadding),
//               width: MediaQuery.of(context).size.width * 0.8,
//               decoration: BoxDecoration(
//                   gradient: LinearGradient(colors: colorlist[index % 4]),
//                   borderRadius: BorderRadius.circular(12)),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Task heading large ;",
//                     style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                         overflow: TextOverflow.ellipsis,
//                         height: 1.1),
//                     maxLines: 2,
//                   ),
//                   SizedBox(
//                     height: defaultPadding,
//                   ),
//                   Text(
//                     "Task subheading dfsk sdf s;",
//                     style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                         overflow: TextOverflow.ellipsis),
//                     maxLines: 1,
//                   ),
//                   SizedBox(
//                     height: defaultPadding / 2,
//                   ),
//                   Text(
//                     "Task deadline",
//                     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                         fontWeight: FontWeight.bold, color: Colors.white),
//                   ),
//                 ],
//               ),
//             );
//           }),
//     );
//   }
// }
