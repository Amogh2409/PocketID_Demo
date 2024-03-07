import 'package:flutter/material.dart';

Padding reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0),
    child: Container(
      height: 55,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(50)),
      child: TextField(
        controller: controller,
        obscureText: isPasswordType,
        enableSuggestions: !isPasswordType,
        autocorrect: !isPasswordType,
        cursorColor: Colors.grey[200],
        style: TextStyle(color: Colors.grey[700]),
        decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.grey[750],
            ),
            labelText: text,
            labelStyle: TextStyle(
              color: Colors.grey[750],
            ),
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            fillColor: Colors.grey[300],
            border: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 0, style: BorderStyle.none))),
        keyboardType: isPasswordType
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
      ),
    ),
  );
}

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
  );
}

AppBar appBar(String title, context) {
  return AppBar(
    backgroundColor: Color.fromARGB(255, 55, 14, 201),
    elevation: 0,
    foregroundColor: Colors.white,
    leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          size: 21,
        )),
    // centerTitle: true,
    title: Text(
      "${title}",
      style: TextStyle(fontSize: 21),
    ),
  );
}

Container reusableButtons(BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        isLogin ? 'LOG IN' : 'SIGN UP',
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}
