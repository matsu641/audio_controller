#  DE1-SoC ボード向けオーディオコントローラー
---

## 概要
大学の授業のプロジェクトとして、DE1-SoCボードを使用して、オーディオの音量調整、画面の色変更、音の切り替えを行うことができるオーディオプレーヤーを作りました。 
ボード上のKEYやスイッチを用いて各機能を操作します。

---

## 主な機能

- **音量調整**：ボード上のボタン（KEY）で音量を増減
- **HEX表示**：再生中のトーンの長さを表示
- **画面の色変更**：スイッチ操作で画面の色を変更
- **トーン切り替え**：スイッチで異なるトーンを選択・再生

---

## ハードウェア構成

### 必要な機材：

- DE1-SoCボード  
- ヘッドホンまたはスピーカー  
- モニター（画面表示用）

### 入力：

- **KEY0〜KEY3**：音量・トーン制御  
- **SW0〜SW3**：トーン選択・画面色変更

---

## 使い方

1. DE1-SoCボードの電源を入れる
2. 以下の操作を実行：
   - `KEY0`：音量を上げる  
   - `KEY1`：音量を下げる  
   - `SW0〜SW3`：画面の色を変更、トーンを切り替える
3. スピーカーからの音と画面の変化を確認する

---

##  セットアップ方法

1. Quartusでプロジェクトを開く  
2. 必要なピン割り当てを設定し、コンパイル  
3. DE1-SoCボードにアップロードして動作確認



---
In English
---


# Audio Controller Project for DE1-SoC Board

# Overview
This project uses the DE1-SoC board to control audio volume, change screen colors, and switch audio tones. The KEYs and switches on the board are used to interact with these features.

## Main Features
- Volume Control: Adjust the audio volume using the board’s buttons.
- Display duration of tone on HEX
- Screen Color Change: Change the screen’s color using the switches.
- Tone Switching: Select different audio tones by using the switches.

## Hardware Setup

Required:
- DE1-SoC Board  
- Headphones or speakers  
- Monitor (for screen color changes)

Inputs:
- KEY0–KEY3: For volume and tone control  
- SW0–SW3: For tone selection and screen color changes  

# How to Use
1. Power on the DE1-SoC board.
2. Use the buttons and switches to control:
   - KEY0: Increase the volume  
   - KEY1: Decrease the volume  
   - SW0–SW3: Change the screen color  
3. Listen to the sound output and watch the screen change.

# How to Set Up
1. Open the project in Quartus.
2. Set up the required pin assignments and compile the project.
3. Upload it to the DE1-SoC board and test its functionality.
