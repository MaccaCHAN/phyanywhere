import 'package:dse_physics_app/Brains/ad_helper.dart';
import 'package:dse_physics_app/Brains/formula_provider.dart';
import 'package:dse_physics_app/Components/my_checkbox_tile.dart';
import 'package:dse_physics_app/Components/stuff_in_equation_list_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:dse_physics_app/constants.dart';

class FormulaSummaryScreen extends StatelessWidget {

  static const id = '/FormulaSummaryScreen';
  late final bool isPortrait ;


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FormulaProvider>(context, listen: false);

    List<String> titleList = [];
    for (QSetListWithCheckState x in provider.topicTileGetter){
      if (x.selectAll != null) {
      } else {titleList.add(x.title) ;}
    }
    isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    // provider.createTileShortList();
    // final provider = Provider.of<FormulaQuizBrain>(context, listen: false);
    print('summary of formula parent built');
    print('titlelist : $titleList');
    print('isPortrait: $isPortrait');


    // print(titleList);

    return DefaultTabController(
      length: titleList.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(isPortrait ? 70.h : 120.h),
          child: AppBar(
              leading: GestureDetector(child: Icon(Icons.arrow_back_ios),
              onTap: (){Navigator.pop(context);
                        AdHelper().showInterstitialAd();

                      }),
              title: Text('Summary of Formula',
                  style:  kAppBarTextStyle.copyWith(fontSize: isPortrait ? 26.h : 43.h)),
              bottom: PreferredSize(preferredSize: Size.fromHeight(isPortrait ? 30.h : 50.0.h),
            child: TabBar(tabs: titleList.map<Widget>((x) =>
              Text(x, style: isPortrait ? kTabBarTextStyle.copyWith(fontSize: 16.h) :
              kTabBarTextStyle.copyWith(fontSize: 30.h ))).toList(), isScrollable: true,
          ),
          )),
        ),
        body: TabBarView(children:
                            List.generate(titleList.length,
                           (index) => provider.topicTileGetter[index].selectAll == null ?
                           StuffInEquationListViewBuilder(qList: provider.topicTileGetter[index], context: context,
                               isPortrait: isPortrait) : SizedBox())




      ),)
    );
  }


}
//
// class TabBarWithTabView extends StatelessWidget {
//
//   final FormulaQuizBrain provider;
//   final QSetListWithCheckState tile;
//
//   TabBarWithTabView({required this.provider, required this.tile});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return DefaultTabController(length: tile. .length,
//         child: Scaffold(appBar: AppBar(bottom: PreferredSize(preferredSize: Size.fromHeight(30.0),
//           child: TabBar(tabs: tile.children.map((x) => Text(x.title)).toList(), isScrollable: true),)),
//             body: TabBarView(children:
//                 List.generate(tabTitleList.length, (index) => StuffInEquationListViewBuilder(tiles: tile.children[index]  )
//             // [
//             //   StuffInEquationListViewBuilder(tiles: tile.children[0]),
//             //   StuffInEquationListViewBuilder(tiles: tile.children[1]),
//             //   StuffInEquationListViewBuilder(tiles: tile.children[2]),
//             //   StuffInEquationListViewBuilder(tiles: tile.children[3]),
//             //   StuffInEquationListViewBuilder(tiles: tile.children[4]),
//             // ]
//             )
//         ),
//
//         ), );
//   }
// }
//
//
