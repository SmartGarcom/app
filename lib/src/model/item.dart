
class Item {
  String cod;
  String nome;
  String descricao;
  double valor;
  String imagem;
  double avaliacao;
  int qtdAvaliacoes;

  CategoriaItem categoria;

  Item(this.categoria, this.cod, this.nome, this.descricao, this.valor, this.imagem,
      this.avaliacao, this.qtdAvaliacoes);

  @override
  String toString() {
    return "$cod - $nome";
  }
}

class CategoriaItem {
  int id;
  String nome;
  String imagem;
  double avaliacao;

  CategoriaItem([this.id, this.nome, this.imagem, this.avaliacao]);

}
