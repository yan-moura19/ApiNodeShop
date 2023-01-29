import 'dart:js';

import 'package:nodeshop_front/pages/carrinho_page.dart';
import 'package:nodeshop_front/pages/login_page.dart';
import 'package:nodeshop_front/pages/produtos_page.dart';

var routes = {
  '/login': (context) => LoginScreen(),
  '/produtos': (context) => ProdutosPage(nomeUser: null),
  '/carrinho': (context) => CarrinhoPage(carrinho: [],nomeUser: 'context',string: null,)
  };