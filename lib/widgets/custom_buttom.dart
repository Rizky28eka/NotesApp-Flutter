import 'package:flutter/material.dart';

import 'constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap,  this.isLoading = false});
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
    
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8)
        ),
    
        width: MediaQuery.of(context).size.width, //? MediaQuery.of(context).size.width → take all widget can to take in width
        height: 55,
    
        child:  Center(
          child: isLoading ? const SizedBox(
            height: 24,
            width: 24,
            child:  CircularProgressIndicator(
              color: Colors.grey,
            ),
          ) : const Text('Add', style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          //fontWeight: FontWeight.bold
          ),)
          ),
      ),
    );
  }
}