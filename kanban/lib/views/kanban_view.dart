import 'package:flutter/material.dart';

import '../utils/kanban_card_data.dart';
import '../widgets/appbar.dart';
import '../widgets/kanban_column.dart';
import '../widgets/side_bar.dart';
import '../widgets/side_box.dart';

class KanbanView extends StatelessWidget {
  KanbanView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: KanbanAppbar(),
      body: Row(
        children: [
          SideBar(),
          SideBox(),
          Expanded(
            child: Row(
              children: [
                KanbanColumn(
                  columnTitle: "BACKLOG",
                  columnCardList: allCards.where((card) => card.columnTitle == "BACKLOG").toList(),
                ),
                KanbanColumn(
                  columnTitle: "DEVELOPING",
                  columnCardList: allCards.where((card) => card.columnTitle == "DEVELOPING").toList(),
                ),
                KanbanColumn(
                  columnTitle: "DEVELOPED",
                  columnCardList: allCards.where((card) => card.columnTitle == "DEVELOPED").toList(),
                ),
                KanbanColumn(
                  columnTitle: "TESTING",
                  columnCardList: allCards.where((card) => card.columnTitle == "TESTING").toList(),
                ),
                KanbanColumn(
                  columnTitle: "TESTED",
                  columnCardList: allCards.where((card) => card.columnTitle == "TESTED").toList(),
                ),
                KanbanColumn(
                  columnTitle: "DONE",
                  columnCardList: allCards.where((card) => card.columnTitle == "DONE").toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
