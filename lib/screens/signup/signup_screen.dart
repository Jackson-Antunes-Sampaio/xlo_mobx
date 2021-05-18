import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/screens/signup/components/field_title.dart';
import 'package:xlo_mobx/stores/signup_store.dart';

class SignUpScreen extends StatelessWidget {

  final SignupStore signupStore = SignupStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastro"),
          centerTitle: true,
        ),
        body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FieldTitle("Apelido", "Como Aparecerá em seus anúncios."),
                          Observer(builder: (_){
                            return TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Exemplo: Jackson A.",
                                  isDense: true,
                                  errorText: signupStore.nameError
                              ),
                              onChanged: signupStore.setName,
                            );
                          }),
                          SizedBox(
                            height: 16,
                          ),
                          FieldTitle(
                              "E-mail", "Enviaremos um e-mail de confirmação."),
                          Observer(builder: (_){
                            return TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Exemplo: jack@gmail.com",
                                  isDense: true,
                                  errorText: signupStore.emailError
                              ),
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              onChanged: signupStore.setEmail,
                            );
                          }),
                          SizedBox(
                            height: 16,
                          ),
                          FieldTitle("Celular", "Proteja sua conta."),
                          Observer(builder: (_){
                            return TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "(99) 9999-9999",
                                  isDense: true,
                                  errorText: signupStore.phoneError
                              ),
                              keyboardType: TextInputType.phone,
                              onChanged: signupStore.setPhone,
                              inputFormatters: [
                                //WhitelistingTextInputFormatter.digitsOnly
                                FilteringTextInputFormatter.digitsOnly,
                                TelefoneInputFormatter()
                              ],

                            );
                          }),
                          SizedBox(
                            height: 16,
                          ),
                          FieldTitle("Senha",
                              "Use letras, números e caracteres especiais."),
                          Observer(builder: (_){
                            return TextField(
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  isDense: true,
                                  errorText: signupStore.pass1Error
                              ),
                              obscureText: true,
                              onChanged: signupStore.setPass1,
                            );
                          }),
                          SizedBox(
                            height: 16,
                          ),
                          FieldTitle("Confirma senha", "Repita a senha."),
                          Observer(builder: (_){
                            return TextField(
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  isDense: true,
                                  errorText: signupStore.pass2Error
                              ),
                              obscureText: true,
                              onChanged: signupStore.setPass2,
                            );
                          }),
                          Observer(builder: (_){
                            return Container(
                              height: 40,
                              margin: EdgeInsets.only(bottom: 12, top: 20),
                              child: RaisedButton(
                                color: Colors.orange,
                                disabledColor: Colors.orange.withAlpha(120),
                                child: Text("Cadastrar"),
                                textColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPressed: signupStore.isFormValid ? () {} : null  ,
                              ),
                            );
                          }),
                          Divider(
                            color: Colors.black,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Já tem uma conta?",
                                  style: TextStyle(fontSize: 16),
                                ),
                                GestureDetector(
                                  onTap: Navigator.of(context).pop,
                                  child: Text(
                                    "ENTRAR",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.purple,
                                        fontSize: 16),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                ),
              ),
            ),
          ),
        );
  }
}
