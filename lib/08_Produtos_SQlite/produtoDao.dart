import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:app/08_Produtos_SQlite/produto.dart';

// Atenção: fazer o import de produto.dart

class ProdutoDao {
  static ProdutoDao? _produtoDao;
  static Database? _database;

  ProdutoDao._createInstance();

  factory ProdutoDao() {
    if (_produtoDao == null) _produtoDao = ProdutoDao._createInstance();
    return _produtoDao!;
  }

  Future<Database> get database async {
    if (_database == null) _database = await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    String _databaseName = 'produtos.db';
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _databaseName);

    var produtosDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return produtosDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute("CREATE TABLE produtos ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "nome TEXT,"
        "preco REAL,"
        "quantidade INTEGER"
        ")");
  }

  void dropTable() async {
    Database db = await database;
    await db.execute("DROP TABLE produtos");
  }

  Future<int> insertProduto(Produto produto) async {
    Database db = await database;
    var resultado = await db.insert(
      'produtos',
      produto.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
    return resultado;
  }

  Future<List<Produto>> getProdutos() async {
    Database db = await database;

    var resultado = await db.query('produtos');

    List<Produto> lista = resultado.isNotEmpty
        ? resultado.map((item) => Produto.fromMap(item)).toList()
        : [];
    return lista;
  }

  Future<Produto?> getProduto(int id) async {
    Database db = await database;

    List maps = await db.query(
      'produtos',
      columns: ['id', 'nome', 'preco', 'quantidade'],
      where: "id = ?",
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Produto.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> updateProduto(Produto produto) async {
    var db = await database;

    int resultado = await db.update(
      'produtos',
      produto.toMap(),
      where: "id = ?",
      whereArgs: [produto.id],
    );
    return resultado;
  }

  Future<int> deleteProduto(int id) async {
    var db = await database;

    int resultado = await db.delete(
      'produtos',
      where: "id = ?",
      whereArgs: [id],
    );
    return resultado;
  }

  Future<int> getCount() async {
    Database db = await database;
    List<Map<String, dynamic>> list =
        await db.rawQuery('SELECT COUNT (*) from produtos');
    int? resultado = Sqflite.firstIntValue(list);
    return resultado!;
  }

  Future close() async {
    Database db = await database;
    db.close();
  }
}
