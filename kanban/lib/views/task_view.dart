import 'package:flutter/material.dart';

import '../utils/data.dart';

class TaskView extends StatelessWidget {
  const TaskView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task View"),
      ),
      body: Center(
        child: Container(
          width:MediaQuery.of(context).size.width - 200,
          height: MediaQuery.of(context).size.height - 200,
          color: Color.fromARGB(255, 223, 223, 223),
          child: ListView.builder(
            itemCount: kanbanData.fold<int>(0, (prev, element) => prev + element.cards.length),
            itemBuilder: (context, index) {
              int currentCardIndex = index;
              for (var columnData in kanbanData) {
                if (currentCardIndex < columnData.cards.length) {
                  final kanbanCard = columnData.cards[currentCardIndex];
                  return Padding(
                    padding: const EdgeInsets.only(left: 2, top: 2, right: 2),
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                columnData.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 79, 79, 79)                            
                                ),
                              ),
                            ),   
                          ),
                          Text(
                            kanbanCard.summary,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    )
                  );
                } else {
                  currentCardIndex -= columnData.cards.length;
                }
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}