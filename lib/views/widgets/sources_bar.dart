import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/models/source.dart';
import 'package:news/views/widgets/source_bar_item.dart';
class SourcesBar extends StatelessWidget {
  List<Source> sources;
  SourcesBar(this.sources);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height*0.05,
      child: ListView.builder(
        itemCount: sources.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return SourceBarItem(sources[index]);
        },
      ),
    );
  }
}
