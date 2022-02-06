import 'package:dse_physics_app/Brains/formula_provider.dart';
import 'package:flutter/material.dart';
import 'package:dse_physics_app/Components/my_checkbox_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class StuffInTiles extends StatefulWidget {
  final QSetListWithCheckState myTiles;
  final void Function(bool, QSetListWithCheckState) onCheck;
  final bool isPortrait;

  StuffInTiles({required this.myTiles, required this.onCheck, this.isPortrait = true});

  @override
  _StuffInTilesState createState() => _StuffInTilesState();
}

class _StuffInTilesState extends State<StuffInTiles> with TickerProviderStateMixin {
  late AnimationController controller; //for more info container
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200), upperBound: 1);
    animation =
        Tween<double>(begin: 0, end: 0.5).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();

    // controller3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(widget.myTiles);
  }

  Widget _buildTiles(QSetListWithCheckState tile) {
    final provider = Provider.of<FormulaProvider>(context);
    // final providerNotListen = Provider.of<FormulaQuizBrain>(
    //     context, listen: false);

    if (tile.children.isEmpty) {
      return ListTile(
          dense: true,
          enabled: true,
          isThreeLine: false,
          trailing: Transform.scale(
            scale: isTabAspectRatio ? 2 : 1,
            child: Checkbox(
                onChanged: (checkState) {
                  setState(tile.toggleIsChecked);
                  widget.onCheck(checkState!, tile);
                },
                value: tile.selectAll == 'all'
                    ? provider.selectAllisChecked
                    : tile.selectAll == 'allMech'
                        ? provider.selectAllMechisChecked
                        : tile.selectAll == 'allE&M'
                            ? provider.selectAllEAndMisChecked
                            : tile.isChecked),
          ),
          title: Padding(
            padding: EdgeInsets.only(top: 8.0.h, bottom: 8.0.h),
            child: Text(
              tile.title,
              style: tile.selectAll == null
                  ? widget.isPortrait
                      ? kMeaningTextStyle.copyWith(fontSize: 30.h)
                      : kMeaningTextStyle.copyWith(fontSize: 40.h)
                  : widget.isPortrait
                      ? kSelectAllTextStyle.copyWith(fontSize: 30.h)
                      : kSelectAllTextStyle.copyWith(fontSize: 40.h),
            ),
          ));
    } else {
      return ExpansionTile(

        title: Padding(
          padding: EdgeInsets.only(top: 8.0.h, bottom: 8.0.h),
          child: Text(tile.title,
              style: widget.isPortrait
                  ? kMeaningTextStyle.copyWith(fontSize: 30.h)
                  : kMeaningTextStyle.copyWith(fontSize: 40.h)),
        ),
        children: tile.children.map(_buildTiles).toList(),
        // trailing: Checkbox(onChanged: (bool? value) {  }, value: false),
      );
    }
  }
}
