import 'package:flutter/material.dart';
import 'package:medsur_app/constants/index_common.dart';

// ignore: must_be_immutable
class ListtileComponent extends StatefulWidget {
  String title = '';
  bool iconreq = false;
  var onTap;
  var children;
  ListtileComponent(
      {required this.title, this.onTap, this.iconreq = false, this.children});

  @override
  _ListtileComponentState createState() => _ListtileComponentState();
}

class _ListtileComponentState extends State<ListtileComponent> {
  bool childOp = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: AppColors.primaryBlue, width: 2))),
          padding: EdgeInsets.symmetric(
              horizontal: 10, vertical: widget.children != null ? 0 : 5),
          // margin:EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(widget.title),
                widget.children != null
                    ? InkWell(
                        child: Icon(!childOp
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up),
                        onTap: () {
                          setState(() {
                            childOp = !childOp;
                          });
                        })
                    : Container()
              ]),
              widget.children != null
                  ? childOp
                      ? Column(children: [
                          for (int i = 0; i < widget.children.length; i++)
                            widget.children[i]
                          // widget.children[index]
                        ])
                      : Container()
                  : Container()
            ],
          ),
        ));
  }
}
