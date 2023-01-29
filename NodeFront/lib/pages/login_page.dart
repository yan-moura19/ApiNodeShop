import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nodeshop_front/pages/produtos_page.dart';
import 'package:nodeshop_front/widgets/app_text.dart';
import 'package:nodeshop_front/widgets/app_title.dart';
import 'package:nodeshop_front/widgets/input_text.dart';

class LoginScreen extends StatelessWidget{
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 8, 39, 87),
      body: SafeArea(
        child: Padding(padding: EdgeInsets.all(24),
         child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 800,maxWidth: 500),
          
          child: Container(
            width: double.infinity,
            height: 415,
            padding: EdgeInsets.all(48),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 73, 75, 80).withOpacity(0.5),
              borderRadius: BorderRadius.all(Radius.circular(24)),

            ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTitle('LOGIN'),
              SizedBox(height: 20,),
              TextField(
                controller: _tLogin,
                style:  GoogleFonts.inter(
                  fontSize: 16,
                   color: Colors.white
                   ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                                        ) ,
                  contentPadding: EdgeInsets.symmetric(horizontal: 14,vertical: 12),
                  
                  labelText: 'Usuario',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.2)
                   ),
                   ),
              SizedBox(height: 20,),
              

              
              TextField(
                obscureText: true,
                controller: _tSenha,
                style:  GoogleFonts.inter(
                  fontSize: 16,
                   color: Colors.white
                   ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                                        ) ,
                  contentPadding: EdgeInsets.symmetric(horizontal: 14,vertical: 12),
                  
                  labelText: 'Senha',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                  
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.2)
                   ),
                   ),
              SizedBox(height: 20,),
              

              SizedBox(
                width: double.infinity,
                child:TextButton(
                onPressed: () {
                  if(_tSenha.text == 'admin'){
                    Navigator.push(context, MaterialPageRoute(
            builder: (context) => ProdutosPage(nomeUser: _tLogin.text),
          ),);

                  }
                  
                  
                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20),
                  textStyle: TextStyle(
                    fontSize: 16, height: 1.2),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))
                ),
                child: Text('Entrar')),
                ),
                SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText('Não tem uma conta? '),
                  SizedBox(height: 5,),
                  AppText('Criar conta', color: Colors.blue,),

                ],
              ),
              
            ],
          )
          
              )
         )
         )
         )
      )
      
    );
  }
}



