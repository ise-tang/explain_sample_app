# README

MySQL の実行計画やインデックスを学ぶためのサンプルアプリ

## データセットアップ

大量のデータをインサートするのでMySQLの設定を変更します。

```sql
mysql -uroot -p

SET GLOBAL max_allowed_packet=524288000;
```

その後
```bash
$ bin/rails db:seed
$ bin/rails db:data_for_explain
```
