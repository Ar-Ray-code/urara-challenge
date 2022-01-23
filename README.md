# urara-challenge（ウララ検出チャレンジ）
ハルウララ（ウマ娘）のテスト結果とその証拠になるDockerfileです。

![urara_challenge](images_for_readme\urara_challenge.png)

### ニコニコ動画

[ウマ娘はAI的に馬？人間？の検証（ハルウララのシニア有馬記念1着攻略解説あり）-ニコニコ動画](https://nico.ms/sm39930385)



## 検証環境

- [darknet-YOLOv4-csp](https://github.com/Ar-Ray-code/darknet/tree/export-video)：改造しているためリンクはAr-Ray-codeのリポジトリに飛びます。
- [YOLOX-x](https://github.com/Megvii-BaseDetection/YOLOX)
- [yolov5](https://github.com/ultralytics/yolov5)
- ウィニングライブ（対象のキャラクターはセンターであること）
- レース（対象のキャラクターは1着であること）

## コンピュータ

※検出率の実験であるため、コンピュータ性能に左右されません。

- CPU：Intel Core i9 12900KF
- GPU：NVIDIA GeForce RTX 2080Ti
- RAM：64GB

## YOLOv4-scpのDockerfileの実行

おまたせました！Dockerfileが使えるようになりました。

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

全て。[動画提供についてはこちらから](https://github.com/Ar-Ray-code/urara-challenge/wiki/動画のレギュレーション)。

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
- [x] 涙ひかって明日になれ！
- [x] ユメヲカケル！
- [x] BLAZE
- [x] Never Looking Back
- [x] WINnin’5 -ウイニング☆ファイヴ-
- [x] ぴょいっと♪はれるや！
  

</details>

<details><summary>対象レース</summary>

芝・ダート・右回り・左回りなどの条件を確認中

- [x] ?
  

</details>

## Run Dockerfile

（12月22日）動きます。NVIDIA RTX Graphics Boardを使用してください。

```bash
docker build . -t urarachallenge
docker run --rm \
	--runtime nvidia \
	-e DISPLAY=$DISPLAY \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	--mount type=bind,source=$(pwd)/target-dir,target=/workspace/target-dir \
	yolov4csp /bin/bash ./target-dir/darknet-ros-docker.bash
```

## 検出例（画像をクリックでYouTubeのリンクに飛びます）

### UNLIMITED IMPACT

検出結果：未

 [![UNLIMITED IMPACT](http://img.youtube.com/vi/AvsvLLgowQg/0.jpg)](https://www.youtube.com/watch?v=AvsvLLgowQg)

### うまぴょい伝説

[![うまぴょい伝説](http://img.youtube.com/vi/Ol8nYpTHX4c/0.jpg)](https://www.youtube.com/watch?v=Ol8nYpTHX4c)

### ユメヲカケル!

[![ユメヲカケル!](http://img.youtube.com/vi/DvbPyekjQq8/0.jpg)](https://www.youtube.com/watch?v=DvbPyekjQq8)



## 検出結果

- Dockerfileの作成と特定のキャラクター追跡ができ次第取り組みます。2022年以降になりそうです。

### GradCAM

yolov5+pytorch-grad-camの組み合わせによる解析結果。以下の画像はアウトプットを手動合成したものになります。

参考リポジトリ：https://github.com/pooya-mohammadi/yolov5-gradcam

![heatmap06-uma](images_for_readme/heatmap-yolov5/heatmap.png)



## 貢献について

気になる箇所やモデルについての検証結果やリクエストなどがあれば歓迎します。

issue欄や[Twitter](https://twitter.com/Ray255Ar)などで教えてください。

## ライセンス

このプロジェクトはCC4.0ライセンスのBY-NCに基づいて改変・再配布が可能です。利用は非営利目的に限定されます。
