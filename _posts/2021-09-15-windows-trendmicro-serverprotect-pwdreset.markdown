---
layout: post
title: 趨勢科技 ServerProtect 密碼重設
date:   2021-09-15 15:02 +8
description: 密碼重設方法
toc: false
share: true
comments: true
tags: Windows TrendMicro AntiVirus
---

# 注意
本文為 Windows 平台運行 ServerProtect 的密碼重設方法，請務必詳細閱讀下列內容，並且自行檢查是否符合您的需求。

# 解決方法
1. 開啟 `regedit` 登錄編輯程式
若 OS 為 64 位元，循 `HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\ServerProtect\CurrentVersion\Agent`，
若OS 為 32 位元，循 `HKEY_LOCAL_MACHINE\SOFTWARE\TrendMicro\ServerProtect\CurrentVersion\Agent`
2. 將其 `AgentPassword` 的值刪除。
3. 這樣密碼即會變更為預設密碼：`VPROTECT`。

# 心得
這種密碼系統也太脆弱吧！
這樣豈不任何人都可恣意 Bypass 密碼驗證了嗎？

# 參考資料
- 趨勢科技客服人員
- [ServerProtect 密碼重設](http://www.trend.com.tw/solutionbank/2/details.asp?id=29979)