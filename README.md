# urara-challenge
ハルウララ（ウマ娘）のテスト結果とその証拠になるDockerfileです。

※現時点ではドキュメントの編集が中心なのでDockerファイルを使うことはおすすめしません。

![](images_for_readme/urara-example.png)

## 検証環境

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
bash yolov4-scp.bash
```

## 対象

 <details><summary>対象キャラ</summary>

※取得済のもののみ表示
 
- ハルウララ（頑張って勝負服を手に入れます）
- サクラバクシンオー
- ゴールドシップ
- ダイワスカーレット
- ウォッカ
- グラスワンダー
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

## 貢献について

気になる箇所やモデルについての検証結果やリクエストなどがあれば歓迎します。

issue欄や[Twitter](https://twitter.com/Ray255Ar)などで教えてください。
