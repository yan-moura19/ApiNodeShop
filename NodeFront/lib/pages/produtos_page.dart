import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:nodeshop_front/pages/carrinho_page.dart';
import 'package:nodeshop_front/widgets/app_text.dart';


class ProdutosPage extends StatelessWidget {
   ProdutosPage({super.key, required this.nomeUser});
   final String? nomeUser;

  
  @override
  Widget build(BuildContext context) {
    var carrinho = [];
    
    
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Olá ${nomeUser}'),
        backgroundColor: Color.fromARGB(255, 8, 39, 87),
        actions: [
          
        IconButton(onPressed: () => {Navigator.push(context, MaterialPageRoute(
            builder: (context) => CarrinhoPage(carrinho: carrinho, nomeUser: '${nomeUser}',string: nomeUser) ,
          ),)}, icon: const Icon(Icons.shopping_cart)),
        SizedBox(width: 30,),
        
        
        ],
      ),
      
      body: Container(
        child: FutureBuilder<dynamic>(
          future: getProdutos(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var produto = snapshot.data![index];
                return Card( child: ListTile(
                  
                  onTap: (() {
                    print("tap on product");
                  }) ,
                  leading: CircleAvatar(backgroundImage: NetworkImage(produto['imagem'])
                  ),
                  title: Text(produto['nome']),
                  subtitle:  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Text('Categoria: '),
                                Text(produto['categoria']),
                                

                              ],
                              
                            ),
                            Row(
                              children: [
                                Text('Preco: '),
                                Text(produto['preco']),

                              ],
                             mainAxisAlignment: MainAxisAlignment.end,
                            )

                          ],
                          mainAxisAlignment: MainAxisAlignment.end,
                        ),
                       
                      SizedBox(width: 20),
                      TextButton(
                        
                        onPressed: () {
                          carrinho.add(produto);
                          
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
                        child: Text('Adicionar ao carrinho')),


                      
                      
                      

                    ],
                    
                    
                    
                  ),
                 
                  
                )
                );

              });

            }else if(snapshot.hasError){
              return Center(child: Text('${snapshot.error}'));

            }
            return const Center(child: CircularProgressIndicator(),);
            
          },
      )
      ),
        
      
      
    );
  }
  

  getProdutos() async{
    var url = Uri.parse('http://616d6bdb6dacbb001794ca17.mockapi.io/devnology/brazilian_provider');
    var response = await http.get(url);
    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }else{
      throw Exception('Não foi possivel pegar os produtos');
    }
  }
}