import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:npac/common_widget/MCheckBox.dart';
import 'package:npac/widgets/space.dart';



class MRowTextCheckBox extends StatelessWidget {
  final bool? isneedDivider;
  final String? title;
  final List<String>? list;
  final Function(List<String>)? result;
  final bool? enabled;
  final List<String>? selectedlist ;
  const MRowTextCheckBox({super.key, this.isneedDivider, this.title, this.list, this.result, this.enabled, this.selectedlist});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title ?? ''),
                  ListCheckBox(selectedlist: selectedlist,enabled: enabled,list: list ,result:result,)
                 ],
              ),
            ),
            // Checkbox(value: widget.checkboxvalue, onChanged: (value) {}),
          ],
        ),
        (isneedDivider ?? true )? Divider(thickness: 1,height: 3,) : Container(),
        Space(),
      ],
    );
  }
}



class ListCheckBox extends StatefulWidget {
  final List<String>? list;
  final Function(List<String>)? result;
  final bool? enabled;
  final List<String>? selectedlist ;
  const ListCheckBox({super.key, this.list, this.result, this.enabled, this.selectedlist});

  @override
  State<ListCheckBox> createState() => _ListCheckBoxState();
}

class _ListCheckBoxState extends State<ListCheckBox> {
  List<String> Selectedlist = [];
  @override
  void initState() {
    super.initState();
    Selectedlist = widget.selectedlist ?? [];
  }
  @override
  Widget build(BuildContext context) {
    //print(widget.selectedlist);
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
        itemCount: widget.list?.length ?? 0,
        itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.only(left: 5),
          child: MCheckBox(boolValue: widget.selectedlist?.contains(widget.list?[index]) ?? false ,enabled: widget.enabled,onChanged: (val,name){
            if(val!){
              Selectedlist.add(name!);
            }else{
              Selectedlist.remove(name);
            }
            widget.result!(Selectedlist);
          },title:widget.list?[index] ,),
        );
  });
}
}
