# urara-test
ハルウララ（ウマ娘）のテスト結果とその証拠になるDockerfileです。

## 検証環境

- [YOLOX-x](https://github.com/Megvii-BaseDetection/YOLOX)
- ウィニングライブ（対象のキャラクターはセンターであること）
- レース（対象のキャラクターは1着であること）

## コンピュータ

※検出率の実験であるため、コンピュータ性能に左右されません。

- CPU：Intel Core i9 12900KF
- GPU：NVIDIA GeForce RTX 2080Ti
- RAM：64GB

## 実行コマンド

```
git clone https://github.com/Megvii-BaseDetection/YOLOX.git
cd YOLOX/
pip3 install -U pip && pip3 install -r requirements.txt
pip3 install -v -e . 
pip3 install cython; pip3 install 'git+https://github.com/cocodataset/cocoapi.git#subdirectory=PythonAPI'

python3 tools/demo.py video -n yolox-x -c ./yolox_x.pth --path ./video.mp4 --conf 0.25 --nms 0.45 --tsize 640 --save_result --device gpu
```

## 対象

 <details><summary>対象キャラ</summary>

※取得済のもののみ表示・星3なし
 
- ハルウララ  
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

</details>

<details><summary>対象ライブ</summary>

※既に取得済のものにxを付けています

- [x] Make Debut!
- [x] ENDLESS DREAM!!
- [x] 彩 Phantasia
- [x] winnning the soul
- [x] 本能スピード
- [x] UNLIMITED IMPACT
- [x] NEXT FRONTIER
- [x] Special Record!
- [x] うまぴょい伝説 
- [ ] はじまりのSignal
- [ ] ささやかな祈り
- [ ] 涙ひかって明日になれ！
- [ ] ユメヲカケル！
- [ ] BLAZE
- [ ] Never Looking Back
- [ ] WINnin’5 -ウイニング☆ファイヴ-
- [x] ぴょいっと♪はれるや！
  
</details>
 
<details><summary>対象レース</summary>

主にG1を対象とする。

- [x] ?
  
</details>
 
## 
