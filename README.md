# urara-challenge（ウララ検出チャレンジ）
ハルウララ（ウマ娘）のテスト結果とその証拠になるDockerfileです。

※現時点ではドキュメントの編集が中心なのでDockerファイルを使うことはおすすめしません。

![](images_for_readme/urara-example.png)

## 検証環境

- [darknet-YOLOv4-csp](https://github.com/Ar-Ray-code/darknet/tree/export-video)：改造しているためリンクはAr-Ray-codeのリポジトリに飛びます。
- [YOLOX-x](https://github.com/Megvii-BaseDetection/YOLOX)
- ウィニングライブ（対象のキャラクターはセンターであること）
- レース（対象のキャラクターは1着であること）

## コンピュータ

<del>※検出率の実験であるため、コンピュータ性能に左右されません。</del>

おまたせました！Dockerfileが使えます。

- CPU：Intel Core i9 12900KF
- GPU：NVIDIA GeForce RTX 2080Ti
- RAM：64GB

## YOLOv4-scpのDockerfileの実行

※NVIDIA-Dockerの最新版を使用してください。

```
git clone https://github.com/Ar-Ray-code/urara-challenge.git
cd urara-challenge/
wget https://raw.githubusercontent.com/AlexeyAB/darknet/master/cfg/yolov4-csp.cfg
wget https://github.com/AlexeyAB/darknet/releases/download/darknet_yolo_v4_pre/yolov4-csp.weights
bash run-darknet-docker.bash
```

## 対象

 <details><summary>対象キャラ</summary>

※取得済のもののみ表示
 
- ハルウララ（頑張って勝負服を手に入れま<del>す</del>した）
- サクラバクシンオー
- ゴールドシップ
- ダイワスカーレット
- ウォッカ
- グラスワンダー（星3）
- エルコンドルパサー
- エアグルーヴ
- マヤノトップガン
- スーパークリーク
- メジロライアン
- アグネスタキオン
- マチカネフクキタル
- ナイスネイチャ
- キングヘイロー
- トウカイテイオー（通常衣装）
- マルゼンスキー

</details>

<details><summary>対象ライブ</summary>

※既に取得済のものにxを付けています

現在、対象ライブを検討中

- [x] Make Debut!
- [x] ENDLESS DREAM!!
- [x] 彩 Phantasia
- [x] winnning the soul
- [x] 本能スピード
- [x] [UNLIMITED IMPACT](https://www.youtube.com/watch?v=AvsvLLgowQg)
- [x] NEXT FRONTIER
- [x] Special Record!
- [x] [うまぴょい伝説](https://youtu.be/Ol8nYpTHX4c)
- [x] はじまりのSignal
- [x] ささやかな祈り
- [ ] 涙ひかって明日になれ！
- [x] ユメヲカケル！
- [ ] BLAZE
- [ ] Never Looking Back
- [x] WINnin’5 -ウイニング☆ファイヴ-
- [x] ぴょいっと♪はれるや！
  
</details>
 
<details><summary>対象レース</summary>

芝・ダート・右回り・左回りなどの条件を確認中

- [x] ?
  
</details>
 
## Run Dockerfile

以下のDockerfileはでは動きません。（12/17日時点）

```bash
docker build . -t urarachallenge
docker run --rm -it \
  --runtime nvidia \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $VIDEO_MP4_PATH:/workspace/target.mp4 \
  -v $VIDEO_CSV_PATH:/workspace/target.csv \
  urarachallenge /bin/bash ./challenge.bash
```

## 検出例（画像をクリックでYouTubeのリンクに飛びます）

### UNLIMITED IMPACT

検出結果：未

 [![UNLIMITED IMPACT](http://img.youtube.com/vi/AvsvLLgowQg/0.jpg)](https://www.youtube.com/watch?v=AvsvLLgowQg)
 
### うまぴょい伝説

[![うまぴょい伝説](http://img.youtube.com/vi/Ol8nYpTHX4c/0.jpg)](https://www.youtube.com/watch?v=Ol8nYpTHX4c)

収集予定（Make Debut!）

- [x] ハルウララ

<!-- ### スピカ（アニメ）

- [ ] スペシャルウィーク
- [ ] サイレンススズカ
- [x] トウカイテイオー
- [ ] メジロマックイーン
- [ ] ウォッカ
- [ ] ダイワスカーレット

- [ ] セイウンスカイ
- [x] グラスワンダー
- [x] マルゼンスキー
- [ ] エルコンドルパサー
- [ ] オグリキャップ
- [ ] ライスシャワー
- [ ] ミホノブルボン
- [ ] その他星3...
 -->
## 検出結果

- Dockerfileの作成と特定のキャラクター追跡ができ次第取り組みます。2022年以降になりそうです。

## 貢献について

気になる箇所やモデルについての検証結果やリクエストなどがあれば歓迎します。

issue欄や[Twitter](https://twitter.com/Ray255Ar)などで教えてください。
