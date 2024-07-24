import 'package:flutter/material.dart';
import 'package:minesh_app/model/try_it_model.dart';
import 'package:url_launcher/url_launcher.dart';

class tryItButton extends StatelessWidget {
  const tryItButton({
    super.key,
    this.tryItModel,
  });

  final List<TryItModel>? tryItModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return ShowCustomDialog(
              tryItModel: tryItModel,
            );
          },
        );
      },
      child: Builder(
        builder: (context) {
          return Container(
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                height: 25,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Center(
                    child: Text(
                      'Try It',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ShowCustomDialog extends StatelessWidget {
  const ShowCustomDialog({
    super.key,
    this.tryItModel,
  });
  final List<TryItModel>? tryItModel;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Column(
        children: [
          Text(
            'Try It',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          Divider(),
        ],
      ),
      content: SizedBox(
        height: 120,
        width: 150,
        // child: Column(
        //   children: [
        //     ListTile(
        //       onTap: () {
        //         launchUrl(msapp);
        //       },
        //       contentPadding: EdgeInsets.zero,
        //       title: const Text(
        //         'Try on Play store',
        //         style: TextStyle(
        //           fontSize: 18,
        //           fontFamily: 'NanumMyeongjo',
        //         ),
        //       ),
        //     ),
        //     ListTile(
        //       onTap: () {
        //         launchUrl(nerdy);
        //       },
        //       contentPadding: EdgeInsets.zero,
        //       title: const Text(
        //         'Try on Git Hub',
        //         style: TextStyle(
        //           fontSize: 18,
        //           fontFamily: 'NanumMyeongjo',
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        child: Scrollbar(
          child: ListView.builder(
            itemCount: tryItModel!.length,
            itemBuilder: (BuildContext context, index) {
              return ListTile(
                title: Text(
                  tryItModel![index].title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'NanumMyeongjo',
                  ),
                ),
                onTap: () {
                  launchUrl(tryItModel![index].launchUrl);
                },
              );
            },
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancel',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
