import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    home: TreeViewPage(),
  );
}

class TreeViewPage extends StatefulWidget {
  @override
  _TreeViewPageState createState() => _TreeViewPageState();
}

class _TreeViewPageState extends State<TreeViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Wrap(
              children: [
                // Container(
                //   width: 100,
                //   child: TextFormField(
                //     initialValue: builder.siblingSeparation.toString(),
                //     decoration: InputDecoration(labelText: "Sibling Separation"),
                //     onChanged: (text) {
                //       builder.siblingSeparation = int.tryParse(text) ?? 100;
                //       this.setState(() {});
                //     },
                //   ),
                // ),
                // Container(
                //   width: 100,
                //   child: TextFormField(
                //     initialValue: builder.levelSeparation.toString(),
                //     decoration: InputDecoration(labelText: "Level Separation"),
                //     onChanged: (text) {
                //       builder.levelSeparation = int.tryParse(text) ?? 100;
                //       this.setState(() {});
                //     },
                //   ),
                // ),
                // Container(
                //   width: 100,
                //   child: TextFormField(
                //     initialValue: builder.subtreeSeparation.toString(),
                //     decoration: InputDecoration(labelText: "Subtree separation"),
                //     onChanged: (text) {
                //       builder.subtreeSeparation = int.tryParse(text) ?? 100;
                //       this.setState(() {});
                //     },
                //   ),
                // ),
                Container(
                  width: 100,
                  height: 100,

                ),
                // RaisedButton(
                //   onPressed: () {
                //     final node12 = Node(rectangleWidget(r.nextInt(100)));
                //     var edge = graph.getNodeAtPosition(r.nextInt(graph.nodeCount()));
                //     print(edge);
                //     graph.addEdge(edge, node12);
                //     setState(() {});
                //   },
                //   child: Text("Add"),
                // )
              ],
            ),
            Expanded(
              child: InteractiveViewer(
                  constrained: false,
                  boundaryMargin: EdgeInsets.all(100),
                  minScale: 0.01,
                  maxScale: 5.6,
                  child: GraphView(
                    graph: graph,
                    algorithm:  SugiyamaAlgorithm(builder),
                    paint: Paint()
                      ..color = Colors.green
                      ..strokeWidth = 1
                      ..style = PaintingStyle.stroke,
                    builder: (Node node) {
                      // I can decide what widget should be shown here based on the id
                      var a = node.key.value as int;
                      List<String> source_list = ["You","You","You","You","You","Hwajeong","Hwajeong"];
                      List<String> target_list = ["Hwajeong","Karachi","New York","Itaewon","China Town","New York","Pluto"];
                      var nodes_list = new List.from(source_list)..addAll(target_list);
                      var nodes = nodes_list.toSet().toList();

                      return rectangleWidget(a,nodes);
                    },
                  )),
            ),
          ],
        ));
  }

  Random r = Random();

  Widget rectangleWidget(int a,List<dynamic> nodes) {
    return InkWell(
      onTap: () {
        print('clicked');
      },
      child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(color: Colors.blue[100], spreadRadius: 1),
            ],
          ),
          child: Text(nodes[a])),
    );
  }

  final Graph graph = Graph();

  SugiyamaConfiguration builder = SugiyamaConfiguration();

  @override
  void initState() {
    List<String> source_list = ["You","You","You","You","You","Hwajeong","Hwajeong"];
    List<String> target_list = ["Hwajeong","Karachi","New York","Itaewon","China Town","New York","Pluto"];
    var nodes_list = new List.from(source_list)..addAll(target_list);
    var unique_nodes_list = nodes_list.toSet().toList();


    var ids_unique_nodes_list = new List<int>.generate(unique_nodes_list.length, (i) => i);

    List<int> ids_source_list = new List(source_list.length);
    for( var i = 0 ; i <source_list.length; i++ ) {
      ids_source_list[i]=unique_nodes_list.indexOf(source_list[i]);
    }

    List<int> ids_target_list = new List(target_list.length);
    for( var i = 0 ; i <source_list.length; i++ ) {
      ids_target_list[i]=unique_nodes_list.indexOf(target_list[i]);
    }



    List<dynamic> ref_node_list = new List(unique_nodes_list.length);

    for( var i = 0 ; i <unique_nodes_list.length; i++ ) {
      ref_node_list[i]=Node.Id(ids_unique_nodes_list[i]);
    }

    for(var i=0;i<source_list.length;i++)
      {
        graph.addEdge(ref_node_list[ids_source_list[i]],ref_node_list[ids_target_list[i]]);
      }


    // final node1 = Node.Id(1);
    // final node2 = Node.Id(2);
    // final node3 = Node.Id(3);
    // final node4 = Node.Id(4);
    // final node5 = Node.Id(5);
    // final node6 = Node.Id(6);
    // final node8 = Node.Id(7);
    // final node7 = Node.Id(8);
    // final node9 = Node.Id(9);
    // final node10 = Node(rectangleWidget(10));  //using deprecated mechanism of directly placing the widget here
    // final node11 = Node(rectangleWidget(11));
    // final node12 = Node(rectangleWidget(12));
    //
    // graph.addEdge(node1, node2);
    // graph.addEdge(node1, node3, paint: Paint()..color = Colors.red);
    // graph.addEdge(node1, node4, paint: Paint()..color = Colors.blue);
    // graph.addEdge(node2, node5);
    // graph.addEdge(node2, node6);
    // graph.addEdge(node6, node7, paint: Paint()..color = Colors.red);
    // graph.addEdge(node6, node8, paint: Paint()..color = Colors.red);
    // graph.addEdge(node4, node9);
    // graph.addEdge(node4, node10, paint: Paint()..color = Colors.black);
    // graph.addEdge(node4, node11, paint: Paint()..color = Colors.red);
    // graph.addEdge(node11, node12);

    builder
      ..nodeSeparation = (15)
      ..levelSeparation = (15)
      ..orientation = (SugiyamaConfiguration.ORIENTATION_LEFT_RIGHT);
  }
}
