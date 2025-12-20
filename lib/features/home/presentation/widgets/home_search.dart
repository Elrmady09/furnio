import 'package:flutter/material.dart';
import 'package:furnio/core/widgets/space.dart';



class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key, this.searchText, this.textEditingController, this.onSubmitted, this.onChanged, this.focusNode, this.onTap});
  final String? searchText;
  final TextEditingController? textEditingController;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Container(
      height: size.width * 0.11,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04,vertical: size.height * 0.01),
      decoration: BoxDecoration(
        color: Colors.grey.shade100, // Light background color
        borderRadius: BorderRadius.circular(size.width * 0.03),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey.shade400), // Search icon
          WidthSpace(space: 0.03), // Space between icon and text
          Expanded(
            child: TextField(
              controller: textEditingController,
              textInputAction: TextInputAction.search,
              onSubmitted:onSubmitted ,
              onChanged:onChanged ,
              focusNode: focusNode,
              onTap: onTap,
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.grey.shade500), // Light text color
                border: InputBorder.none, // Removes underline
              ),
            ),
          ),
          // Separator ( | )
          Container(
            height: size.height * 0.04, // Height of separator
            width: size.width * 0.004, // Width of separator
            color: Colors.grey.shade300, // Light grey separator color
          ),
          WidthSpace(space: 0.03), // Space between separator and mic icon
          Icon(Icons.tune, color: Colors.black), // Mic icon
        ],
      ),
    );
  }
}
