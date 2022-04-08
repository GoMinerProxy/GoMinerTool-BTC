#### 當前版本：{BUILD_VERSION}({BUILD_DATE})
#### 最新版本：[V1.1.0_BTC(2022-04-08)](https://github.com/GoMinerProxy/GoMinerTool-BTC/releases/tag/1.1.0) - [[歷史更新日誌]](https://github.com/GoMinerProxy/GoMinerTool-BTC/releases)
#### 聯繫我們：[Telegram 討論群組(歡迎向我們提出建議)](https://t.me/+afVqEXnxtQAyNWNh)、[GitHub](https://github.com/GoMinerProxy/GoMinerTool-BTC)
#### V1.1.0更新內容：此次版本為大版本更新，推薦用戶更新。
- 同步更新ETHASH版本最近兩個月内更新的内容 (快速響應、前置模式、Doh等)
- 修復數個在代碼重構過程中發現的BUG，提高程式穩定性
- 完美兼容F2pool Poolin BTC.com等礦池 (AntPool暫不支持，後續再做兼容)
- 更新精準抽水算法，適配跨礦池抽水、動態難度礦池 (後續將同步至ETHASH版本)
- 針對BTC協議不提交本地算力，更新算力估算算法
- 完美兼容螞蟻、神馬等多種品牌礦機
#### 注意：因BTC.COM礦池自身設定，不同綫路之間的挖礦錢包名不通用，請注意區別。
----
#### 掉綫原因參考表：
- EOF: 客戶端主動發出的下綫請求
- i/o timeout: 長時間未收到客戶端的提交
- reset bt peer: TCP連接被重置，可能是綫路波動丟包或阻斷
