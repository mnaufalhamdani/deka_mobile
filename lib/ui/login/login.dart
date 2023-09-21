// ignore_for_file: prefer_const_constructors

import 'package:deka_mobile/core/data/bloc_state.dart';
import 'package:deka_mobile/extensions/constants.dart';
import 'package:deka_mobile/models/domain/login_domain.dart';
import 'package:deka_mobile/ui/dashboard/dashboard.dart';
import 'package:deka_mobile/ui/login/bloc/remote/remote_login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/di.dart';
import '../../resource/colors.dart';
import '../../resource/showSnackbarMessage.dart';

class Login extends StatefulWidget {
  static const nameRoute = 'Login';
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginDomain = LoginDomain();
  final _formKey = GlobalKey<FormState>();
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteLoginBloc>(
        create: (context) =>
        get()..onEvent(GetLogin(NIK_EXAMPLE, "dk")),
        child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    _buildBody(),
                  ]
              ),
        ))
    );
  }

  _buildHeader() {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        color: colorPrimary,
        image: DecorationImage(
          image: AssetImage("assets/images/img_background_factory.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              colorPrimary.withOpacity(0.6), BlendMode.multiply),
        ),
      ),
      child: Column(
        children: [
          Image.asset("assets/images/img_logo_apps.png", fit: BoxFit.cover, height: 220),
          Container(decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25)
            ),
            color: Colors.white,
          ), height: 30,)
        ]
      ),
    );
  }

  _buildBody() {
    return Builder(builder:
        (context) => BlocBuilder<RemoteLoginBloc, BaseBlocState>(
            builder: (_, state) {
            if (state is BaseResponseLoading) {
              isLoading = true;
            }
            if (state is BaseResponseError) {
              isLoading = false;
              WidgetsBinding.instance.addPostFrameCallback((_) =>
                  showSnackBarMessage(
                      context,
                      TypeMessage.ERROR,
                      state.error.message!,
                      DurationMessage.LENGTH_SHORT)
              );
            }
            if (state is LoginResponseDone) {
              isLoading = false;
              WidgetsBinding.instance.addPostFrameCallback((_) =>
                Navigator.of(context).pushNamedAndRemoveUntil(Dashboard.nameRoute, (Route<dynamic> route) => false)
              );
            }

          return Form(key: _formKey, child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Transform.translate(offset: Offset(20, 0),
                    child: Text("Selamat Datang!",
                        style: TextStyle(
                            color: colorText,
                            fontWeight: FontWeight.w800,
                            fontSize: 22)
                    )
                ),
                Transform.translate(offset: Offset(20, -5),
                    child: Text(varGreetingLogin,
                        style: TextStyle(
                            color: colorText,
                            fontSize: 12)
                    )
                ),
                Padding(padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      style: TextStyle(fontSize: 15),
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return "Isian ini masih kosong";
                        }
                        loginDomain.username = value;
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: varUsername,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: colorPrimary)),
                        contentPadding: EdgeInsets.only(left: 20, right: 20),
                        prefixIcon: Icon(Icons.person_outline),
                        prefixIconColor: Colors.black54,
                        filled: true,
                        fillColor: Colors.black12,
                      ),
                    )
                ),
                Padding(padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(fontSize: 15),
                      obscureText: true,
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return "Isian ini masih kosong";
                        }
                        loginDomain.password = value;
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: varPassword,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: colorPrimary)),
                          contentPadding: EdgeInsets.only(left: 20, right: 20),
                          prefixIcon: Icon(Icons.lock_outline),
                          prefixIconColor: Colors.black54,
                          filled: true,
                          fillColor: Colors.black12
                      ),
                    )
                ),
                Padding(padding: EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: (){},
                          child: Text("Reset Password", style: TextStyle(color: colorText)),
                        )
                    )
                ),//Button Reset
                Padding(padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: isLoading ? Container(
                          padding: const EdgeInsets.all(2.0),
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                          ),
                        ) : const Icon(Icons.login),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<RemoteLoginBloc>(context, listen: false).add(GetLogin(loginDomain.username.toString(), loginDomain.password.toString()));
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(
                                colorPrimaryDark),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                        20)))),
                        label: Text("L O G I N",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w800
                            )),
                      ),
                    )
                ),//Button Login
                Padding(padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: const [
                        Expanded(child: Divider(color: Colors.black87)),
                        Text("   Atau   "),
                        Expanded(child: Divider(color: Colors.black87)),
                      ],
                    )
                ),
                Padding(padding: EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: (){},
                          child: Text("Daftar Sekarang ?", style: TextStyle(
                              color: colorText,
                              fontWeight: FontWeight.w800)
                          ),
                        )
                    )
                ),//Button Register
                Container(
                    alignment: Alignment.center,
                    child: Text("v18.09.23.0001",
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 10)
                    )
                ),
              ]
          ));
        }
    ));
  }
}
