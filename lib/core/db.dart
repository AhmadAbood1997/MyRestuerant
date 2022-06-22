import 'package:dartz/dartz.dart';
import 'error/exceptions.dart';
import 'error/failures.dart';
import '../features/category&products/data/models/product_model.dart';
import '../features/category&products/domain/entities/product.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class BDataHelper {
  static BDataHelper? _bDataHelper;

  BDataHelper._createInstance();

  static Database? _database;

  String productTable = 'productTable';
  String columnproductId = 'productId';
  String columncategoryId = 'categoryId';
  String columnTitle = 'title';
  String columnRate = 'rate';
  String columnPeriod = 'period';
  String columnLevel = 'level';

  factory BDataHelper() {
    if (_bDataHelper == null) {
      _bDataHelper = BDataHelper._createInstance();
    }
    return _bDataHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDataBase();
    }

    return _database!;
  }

  Future<Database> initDataBase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}resturant.db';
    var imageDataBase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return imageDataBase;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $productTable($columnproductId INTEGER PRIMARY KEY AUTOINCREMENT , $columncategoryId INTEGER,$columnTitle TEXT,$columnRate INTEGER,$columnPeriod TEXT,$columnLevel TEXT)');

    await db.rawInsert(
        'INSERT INTO $productTable ($columnproductId,$columncategoryId, $columnTitle,$columnRate,$columnPeriod,$columnLevel) VALUES(1,1,"Pizza",4,"30","Hard")');
    await db.rawInsert(
        'INSERT INTO $productTable ($columnproductId,$columncategoryId, $columnTitle,$columnRate,$columnPeriod,$columnLevel) VALUES(2,1,"Pasta",3,"16","Normal")');
    await db.rawInsert(
        'INSERT INTO $productTable ($columnproductId,$columncategoryId, $columnTitle,$columnRate,$columnPeriod,$columnLevel) VALUES(3,1,"Peef",5,"45","Hard")');
    await db.rawInsert(
        'INSERT INTO $productTable ($columnproductId,$columncategoryId, $columnTitle,$columnRate,$columnPeriod,$columnLevel) VALUES(4,1,"Potato",4,"35","Easy")');
    await db.rawInsert(
        'INSERT INTO $productTable ($columnproductId,$columncategoryId, $columnTitle,$columnRate,$columnPeriod,$columnLevel) VALUES(5,1,"Crispy",2,"24","Hard")');
    await db.rawInsert(
        'INSERT INTO $productTable ($columnproductId,$columncategoryId, $columnTitle,$columnRate,$columnPeriod,$columnLevel) VALUES(6,1,"Zenger",1,"18","Easy")');
  }

  Future<List<Map<String, dynamic>>> getProductMapList() async {
    Database db = await this.database;
    var result = await db.query(productTable);
    return result;
  }

  Future<Either<Failure, Unit>> insertProduct(ProductModel product) async {
    Database db = await this.database;
    var result = db.insert(productTable, product.toMap());
    if (await result == 1) {
      try {
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<int> updateProduct(ProductModel product) async {
    Database db = await this.database;
    var result = db.update(productTable, product.toMap(),
        where: '$columnproductId=?', whereArgs: [product.productId]);
    print("update");
    return result;
  }

  Future<Either<Failure, Unit>> deleteProduct(String id) async {
    Database db = await this.database;
    int result = await db.rawDelete(
        'DELETE FROM $productTable WHERE $columnproductId=  "$id"  ');
    if (await result == 1) {
      try {
        return Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> value =
        await db.rawQuery('SELECT COUNT (*) FROM $productTable');
    int? result = Sqflite.firstIntValue(value);
    return result!;
  }

  fromMapObject(Map<String, dynamic> map) {
    Product product = Product(
        categoryId: map['categoryId'],
        title: map['title'],
        rate: map['rate'],
        period: map['period'],
        productId: map['productId'],
        level: map['level']);

    return product;
  }

  Future<List<Product>> getProductList() async {
    var productMapList = await getProductMapList();
    int count = productMapList.length;
    List<Product> productList = [];
    for (int i = 0; i < count; i++) {
      productList.add(fromMapObject(productMapList[i]));
    }
    return productList;
  }
}
