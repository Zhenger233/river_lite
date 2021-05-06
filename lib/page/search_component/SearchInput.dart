import 'package:flutter/material.dart';
import 'package:offer_show/asset/color.dart';
import 'package:offer_show/asset/size.dart';
import 'package:offer_show/asset/svg.dart';
import 'package:offer_show/util/provider.dart';
import 'package:provider/provider.dart';

class SearchInput extends StatefulWidget {
  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    SearchProvider provider = Provider.of<SearchProvider>(context);
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: os_padding),
      decoration: BoxDecoration(
        color: os_white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: os_width - 2 * os_padding,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container(
            width: os_width * 0.55,
            child: TextField(
              onSubmitted: (res) {
                provider.search();
              },
              controller: provider.searchController,
              cursorColor: os_black,
              decoration: InputDecoration(
                hintText: "公司+岗位可以组合查询",
                hintStyle: TextStyle(
                  color: os_middle_grey,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
          ),
          IconButton(
            icon: os_svg(
              path: "lib/img/search-cross.svg",
              size: 20,
            ),
            onPressed: () {
              provider.clearInput();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              size: 28,
            ),
            onPressed: () {
              provider.search();
            },
          ),
        ],
      ),
    );
  }
}