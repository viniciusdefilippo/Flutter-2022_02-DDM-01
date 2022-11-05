class Produto {
  int? id;
  String? nome;
  double? preco;
  int? quantidade;

  Produto(this.id, this.nome, this.preco, this.quantidade);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'nome': nome,
      'preco': preco,
      'quantidade': quantidade,
    };
    return map;
  }

  Produto.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nome = map['nome'];
    preco = map['preco'];
    quantidade = map['quantidade'];
  }

  @override
  String toString() {
    return "Produto => (id: $id, nome: $nome, preco: $preco, quantidade: $quantidade)";
  }
}
