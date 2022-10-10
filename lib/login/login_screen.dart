import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var isPassword = false;
  var rememberPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    //this colors from hex color sight
                    colors: [
                      Color(0xffF2F4F4),
                      Color(0xffE5E8E8),
                      Color(0xffCCD1D1),
                      Color(0xff99A3A4),
                      Color(0xff7F8C8D),
                      Color(0xff707B7C),
                      Color(0xff616A6B),
                      Color(0xff515A5A),
                      Color(0xff424949),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                        ),
                        const Text(
                          'Hello User! ☺',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),
                        buildEmailItem(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                        buildPassItem(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        buildRowItem(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        buildLoginButton(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        buildSightsItem(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        const Text(
                          'الشروط والاحكام',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEmailItem() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Email',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            height: 60.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xffebefff),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: TextFormField(
              cursorColor: Colors.black,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xff4c5166),
                ),
                hintText: 'Email...',
              ),
            ),
          ),
        ],
      );

  Widget buildPassItem() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Password',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            height: 60.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xffebefff),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: TextFormField(
              cursorColor: Colors.black,
              controller: passController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: isPassword,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: const Icon(
                  Icons.vpn_key,
                  color: Color(0xff4c5166),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                  icon: Icon(
                    isPassword ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0xff4c5166),
                  ),
                ),
                hintText: 'Password...',
              ),
            ),
          ),
        ],
      );

  Widget buildRowItem() => Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Theme(
                  data: ThemeData(unselectedWidgetColor: Colors.white),
                  child: Checkbox(
                    value: rememberPassword,
                    activeColor: Colors.white,
                    checkColor: Colors.blueGrey,
                    onChanged: (bool? value) {
                      setState(() {
                        rememberPassword = value!;
                      });
                    },
                  ),
                ),
                const Text(
                  'Remember me',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'Forget Password !',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      );

  Widget buildLoginButton() => Container(
        height: 60.0,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xff515A5A),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 10.0,
            ),
          ],
        ),
        child: MaterialButton(
          onPressed: () {},
          child: const Text(
            'LOGIN',
            style: TextStyle(color: Colors.white, fontSize: 12.0),
          ),
        ),
      );

  Widget buildSightsItem() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 50.0,
            width: 50.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/facebook.png',
                ),
              ),
            ),
          ),
          Container(
            height: 50.0,
            width: 50.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/search.png',
                ),
              ),
            ),
          ),
          Container(
            height: 50.0,
            width: 50.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/twitter.png',
                ),
              ),
            ),
          ),
        ],
      );
}
