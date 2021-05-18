import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xlo_mobx/screens/login/login_screen.dart';

class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.purple,
      height: 95,
      child: Row(
        children: [
          Icon(Icons.person, color: Colors.white, size: 35),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Acesse sua conta agora!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  child: Text(
                    "Clique aqui",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginScreen()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
