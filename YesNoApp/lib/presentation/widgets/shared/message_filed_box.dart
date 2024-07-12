import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key, required this.onValue});

  final ValueChanged<String> onValue;

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();
    final colors = Theme.of(context).colorScheme;

    final OutlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

   final inputDecoration =  InputDecoration(
          hintText: 'End your message whit a "?"',
          enabledBorder: OutlineInputBorder,
          focusedBorder: OutlineInputBorder,
          filled: true,
          suffixIcon: IconButton(
              onPressed: () {
                final textValue = textController.value.text;
                textController.clear();
                onValue(textValue);
              }, icon: const Icon(Icons.send_outlined)));
   
   return TextFormField(
    onTapOutside: (event){
      focusNode.unfocus();
    },
    focusNode: focusNode,
    controller: textController,
    decoration: inputDecoration,
    onFieldSubmitted: (value){
      textController.clear();
      focusNode.requestFocus();
      onValue(value);
      
    },
    
    );
    
  }
}
