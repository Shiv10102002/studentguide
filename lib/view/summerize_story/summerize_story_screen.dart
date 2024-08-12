import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studentguide/constant.dart';
import 'package:studentguide/dummy_data.dart';

class SummarizeStroyScreen extends StatelessWidget {
  const SummarizeStroyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Summerize Notes"),
      ),
      floatingActionButton: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(30)),
          child: const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "Summerize Notes",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  child: Text(
                'Recent Notes',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              )),
              const SizedBox(
                height: defaultPadding,
              ),
              ...notesl.map((e) => Container(
                    decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey))),
                    child: (ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/icons/summery2.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        e['name'],
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(overflow: TextOverflow.ellipsis),
                      ),
                      subtitle: Text(
                        e['discr'],
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(overflow: TextOverflow.ellipsis),
                      ),
                    )),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
