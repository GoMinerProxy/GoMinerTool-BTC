<h1 align="center">
  <br>
  <img src="https://raw.githubusercontent.com/GoMinerProxy/GoMinerTool-BTC/main/images/logo.png" width="350"/>
</h1>

<h4 align="center">基於GoLang的高性能多線程BTC礦池轉發中繼代理工具. </h4>
<h4 align="center">ETH/ETC轉發請進(https://github.com/GoMinerProxy/GoMinerProxy)</h4>
<h4 align="center">BTC暫時只建議BTC.COM/F2pool/Poolin用戶使用，其他礦池請等待後續開發 </h4>
<p align="center">
  <a>
    <img src="https://img.shields.io/badge/Release-1.1.1_BTC-orgin.svg" alt="travis">
  </a>
  <a>
    <img src="https://img.shields.io/badge/Last_Update-2022_04_21-orgin.svg" alt="travis">
  </a>
  <a>
    <img src="https://img.shields.io/badge/Language-GoLang-green.svg" alt="travis">
  </a>
  <a>
    <img src="https://img.shields.io/badge/License-Apache-green.svg" alt="travis">
  </a>
</p>

<p align="center">
  <a href="https://github.com/GoMinerProxy/GoMinerTool-BTC/blob/main/README_zh-cn.md">简体介绍</a> •
  <a href="https://gominerproxy.github.io/zh_hk/">文檔(繁體中文)</a> •
  <a href="https://gominerproxy.github.io/zh_cn/">文档(简体中文)</a> •
  <a href="https://t.me/+afVqEXnxtQAyNWNh">Telegram 討論群组</a> •
  <a href="https://t.me/go_minerproxy">Telegram 通知頻道</a>
</p>


## :sparkles: 特性

* :cloud: 礦池轉發：支持BTC的中繼代理，方便統一管理
* :zap: 超高性能：採用高效率的GoLang語言編寫，並對多線程進行優化
* 💻 自定義抽水：支持中繼平台自定義抽水比例進行抽水，方便賺取服務器維護成本
* 📚 多種抽水算法：用戶可自選各種抽水算法，防止算力出現週期函數或心跳圖的情況
* 💾 安全穩定：支持TCP、SSL等方式，並對CC攻擊編寫一定的策略進行防護
* :gear: 獨家前置代理模式：支持中轉伺服器到礦池端的加密與混淆
* :outbox_tray: 批量轉發：一個軟件即可開啟對多個礦池的轉發，無需開啟多個進程
* :card_file_box: 熱修改：配置均可網頁後台上熱修改，無需再修改繁瑣配置文件再重啟
* :art: 精美後台：後台網頁功能全面、統計豐富、黑暗模式、多語言支持
* :eye_speech_bubble: 完善社區支持：Telegram 群組內可幫助處理解決遇到的各類問題，歡迎提出反饋建議
* :rocket: 開箱即用：All-In-One 打包，一鍵搭建運行，一鍵配置
* :family_woman_girl_boy: 多系統支持：Windows Linux MacOS均可支持使用，無需額外環境等
* :gear: 專業團隊：擁有豐富區塊鏈開發的工作經驗，多名開發人員來自香港科技大學名校
* :link: 快速響應：可選擇開啟，偽裝低延遲(用戶內核延遲處顯示的延遲為礦機到中轉服務器的延遲)、清理無效提交
* 🌈 ... ...

## :hammer_and_wrench: 部署

最新軟件版本請見：<a href="https://github.com/GoMinerProxy/GoMinerTool-BTC/releases">Github Release</a></br>
Windows 直接下載適用於您目標機器操作系統、CPU架構的主程序，直接運行即可。
</br>
Linux 可按照下述指令運行，請注意下載鏈接需要適用於您目標機器操作系統、CPU架構。

### Linux一鍵管理脚本(自帶崩潰重啟，但無開機自啟)
```shell
# 海外伺服器可用
bash <(curl -s -L https://raw.githubusercontent.com/GoMinerProxy/GoMinerTool-BTC/main/scripts/manage.sh)
# 大陆伺服器可用
bash <(curl -s -L https://cdn.jsdelivr.net/gh/GoMinerProxy/GoMinerTool-BTC@main/scripts/manage_zh.sh)
```
```shell
# 再次SSH链接可以使用下述指令查看输出
screen -r gominertool-btc
```
以上為最簡單的部署示例，您可以參考 [文檔 - 快速開始](https://gominerproxy.github.io/zh_hk/) 進行更為完善的部署。 

## :alembic: 技术栈

* [Go](https://golang.org/) + [Gin](https://github.com/gin-gonic/gin)
* [NodeJs](https://nodejs.org/) + [GitBook](https://www.gitbook.com/)
* [Vue.JS](https://vuejs.org/) + [vue-element](https://panjiachen.github.io/vue-element-admin-site/)

## :scroll: 開發抽水
* 恆定0.3%
