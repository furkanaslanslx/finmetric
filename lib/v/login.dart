import 'package:fintableapp/services/responsive_size.dart';
import 'package:fintableapp/v/widgets/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final ResponsiveSize size = ResponsiveSize();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passController = TextEditingController();
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: Colors.transparent,
        leading: CupertinoNavigationBarBackButton(
          color: Colors.white,
          previousPageTitle: 'Geri',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // SizedBox(height: size.getHeight(context, kToolbarHeight + 50)),
            SizedBox(height: size.getHeight(context, 53)),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Finmetric', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                Text("'e giriş yap", style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal, color: Colors.white)),
              ],
            ),
            SizedBox(height: size.getHeight(context, 20)),
            const Text('Devam etmek için kimlik bilgilerinizi girin', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white)),
            SizedBox(height: size.getHeight(context, 78)),
            Form(
              key: formKey,
              child: SizedBox(
                width: size.getWidth(context, 540),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Row(
                      children: [
                        Text('TELEFON', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white)),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: size.getHeight(context, 15)),
                    MyTextField(
                      color: Colors.white,
                      type: TextInputType.phone,
                      controller: phoneController,
                      hint: '',
                      // validator: (givenPhone) {
                      //   if (givenPhone == null || givenPhone.isEmpty) {
                      //     return 'Telefon numarası gerekli';
                      //   }
                      //   if (givenPhone != '5321204075') {
                      //     return 'Geçersiz telefon numarası';
                      //   }
                      //   return null;
                      // },
                      validator: (p0) {
                        return null;
                      },
                    ),
                    SizedBox(height: size.getHeight(context, 38)),
                    const Row(
                      children: [
                        Text('ŞİFRE', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white)),
                        Spacer(),
                        Text('Şifremi Unuttum?', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white)),
                      ],
                    ),
                    SizedBox(height: size.getHeight(context, 15)),
                    MyTextField(
                      obscureText: true,
                      type: TextInputType.text,
                      color: Colors.white,
                      controller: passController,
                      hint: '',
                      // validator: (givenPass) {
                      //   if (givenPass == null || givenPass.isEmpty) {
                      //     return 'Şifre gerekli';
                      //   }
                      //   if (givenPass != '**') {
                      //     return 'Geçersiz şifre';
                      //   }
                      //   return null;
                      // },
                      validator: (p0) {
                        return null;
                      },
                    ),
                    SizedBox(height: size.getHeight(context, 40)),
                    SizedBox(
                      width: size.getWidth(context, 540),
                      height: size.getHeight(context, 70),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Giriş Yap', style: TextStyle(fontSize: 16, color: Colors.orange)),
                            Icon(Icons.arrow_forward_ios, color: Colors.orange),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.getHeight(context, 35)),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Hesabınız yok mu?', style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white.withOpacity(0.7))),
                        const Text('  Kayıt ol', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
