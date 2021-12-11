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
cd YOLOX/
python3 tools/demo.py video -n yolox-x -c ./yolox_x.pth --path ./video.mp4 --conf 0.25 --nms 0.45 --tsize 640 --save_result --device gpu
```

## 対象（既に取得済のものにxを付けています）

 <details><summary>対象キャラ</summary>
  
- [x] サクラバクシンオー
- [x] ハルウララ
  
</details>

<details><summary>対象ライブ</summary>
  
- [x] Make Debut!
- [ ] ENDLESS DREAM!!
- [ ] 彩 Phantasia
- [ ] winnning the soul
- [ ] 本能スピード
- [ ] UNLIMITED IMPACT
- [ ] NEXT FRONTIER
- [ ] Special Record!
- [ ] うまぴょい伝説 
- [ ] はじまりのSignal
- [ ] ささやかな祈り
- [ ] 涙ひかって明日になれ！
- [ ] ユメヲカケル！
- [ ] BLAZE
- [ ] Never Looking Back
- [ ] WINnin’5 -ウイニング☆ファイヴ-
  
</details>
 
<details><summary>対象レース</summary>
  
- [x] ?
  
</details>
 
## 
