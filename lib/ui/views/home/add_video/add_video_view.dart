import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:yassin_saddem/app/theme.dart';
import 'package:yassin_saddem/ui/views/home/add_video/add_video_viewmodel.dart';

class AddVideoView extends StatefulWidget {
  const AddVideoView({Key? key}) : super(key: key);

  @override
  State<AddVideoView> createState() => _AddVideoViewState();
}

class _AddVideoViewState extends State<AddVideoView> {
  late FToast fToast;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  void showToast() {
    fToast.showToast(
      child: InkWell(
        onTap: () {
          fToast.removeQueuedCustomToasts();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset("assets/svgs/check.svg"),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Your video has been uploaded",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset("assets/svgs/Close.svg"),
              ],
            ),
          ),
        ),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 3),
    );
  }

  final InputBorder outlinedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: const BorderSide(color: Colors.transparent));

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => AddVideoModelView(),
        builder: (context, AddVideoModelView model, child) => Scaffold(
            appBar: AppBar(
              title: const Text(
                "Upload Video",
                style: TextStyle(color: Colors.black),
              ),
              elevation: 0.5,
              backgroundColor: Colors.white,
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 40, right: 25, left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _label("Title video"),
                  const SizedBox(height: 5),
                  TextFormField(
                    decoration: InputDecoration(
                        fillColor: textFieldBackgroundColor,
                        hintText: "",
                        focusedBorder: outlinedBorder,
                        enabledBorder: outlinedBorder,
                        border: outlinedBorder,
                        filled: true),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _label("Description"),
                  const SizedBox(height: 5),
                  TextFormField(
                    minLines: 2,
                    maxLines: 5,
                    decoration: InputDecoration(
                        fillColor: textFieldBackgroundColor,
                        hintText: "",
                        focusedBorder: outlinedBorder,
                        enabledBorder: outlinedBorder,
                        border: outlinedBorder,
                        filled: true),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Theme.of(context).primaryColor)),
                          onPressed: () {
                            showToast();
                            model.onSubmit(context);
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 50.0),
                              child: Text(
                                "Upload",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          )),
                    ],
                  )
                ],
              ),
            )));
  }

  Widget _label(String text) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12),
    );
  }
}
