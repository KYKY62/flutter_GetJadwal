import 'package:flutter/material.dart';
import 'package:flutter_getjadwal/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final loginC = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3A0B48),
        elevation: 0,
        title: const Text(
          "GetJadwal",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: loginC.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              const Center(
                child: Text(
                  "Check In",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 7.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffE5E5E5),
                    borderRadius: BorderRadius.circular(6),
                    border: loginC.isErrorEmail.value == true
                        ? Border.all(
                            color: Colors.red,
                          )
                        : Border.all(
                            color: Colors.transparent,
                          ),
                  ),
                  child: TextFormField(
                    onChanged: (value) {
                      if (GetUtils.isEmail(value)) {
                        loginC.isErrorEmail(false);
                      } else {
                        loginC.isErrorEmail(true);
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: "Masukkan email anda",
                      hintStyle: TextStyle(
                        color: Color(0xffBBBBBB),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: loginC.emailC,
                  ),
                ),
              ),
              loginC.isErrorEmail.value
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 15.0,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            "Format email tidak sesuai",
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 22.0,
              ),
              GestureDetector(
                onTap: () {
                  loginC.loginWithEmail(loginC.emailC.text);
                  print("ditekan");
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    // width: 361,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xffD9019C),
                      borderRadius: BorderRadius.circular(47),
                    ),
                    child: const Center(
                      child: Text(
                        "Mulai Sesi",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
