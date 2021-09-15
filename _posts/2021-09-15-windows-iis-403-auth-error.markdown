---
layout: post
title: Windows IIS 8 網站莫名 403.3 驗證錯誤
date:   2021-09-15 11:49 +8
description: Windows 資料夾權限調整。
toc: false
share: true
comments: true
tags: IIS Windows
---

# 注意
本文為 Windows 的 IIS 8 及更新版本的解決方案。

# 檢查問題
1. 創建一個新的網站，並建立簡單的 helloWorld.html 檔案，如果是在子目錄，記得要轉成「網站應用程式」。
2. 該資料夾權限給予 Everyone 權限「Full Control」。
3. 若如此能解決問題，則確立為權限設定問題。

# 主要解決方法
1. 在 wwwroot 或是該網站根目錄，給予 `IIS_IUSRS` 群組 Read 和 Write 權限。
2. 執行命令 `iisreset /restart`，這將重新啟動 IIS，以讓新權限設定生效。
3. 在不同電腦上，瀏覽剛剛設定的網站，檢查是否可以正常顯示。若不行，則採取替代方法如下。

# 替代解決方法
1. 在 wwwroot 或是該網站根目錄，給予 `IIS AppPool\MyApplicationPoolName` 群組 Read 和 Write 權限。
※此處 MyApplicationPoolName 應該是該網站的應用程式池名稱。
2. 切換至 Internet Information Services (IIS) Manager，點選該網站。
3. 右側面板點選 IIS 分類底下的 "Authentication"。
4. 在 "Authentication" 下面的 "Anoymous Authentication" 選項，確保為 "Enable"。
5. 對其點右鍵，選擇 "Edit..."。
6. 預設選項應該為 "Specific user": "IUsr"，我們切換為第二項 "Application pool identity"。
7. 執行命令 `iisreset /restart`，這將重新啟動 IIS，以讓新權限設定生效。
8. 在不同電腦上，瀏覽剛剛設定的網站，檢查是否可以正常顯示。我到這邊就解決問題了。

# 參考資料
- [IIS_IUSRS and IUSR permissions in IIS8](https://stackoverflow.com/questions/14934006/iis-iusrs-and-iusr-permissions-in-iis8)
- [Error message 401.3: You do not have permission to view this directory or page using the credentials you supplied (access denied due to Access Control Lists)](https://techras.wordpress.com/2016/03/09/error-message-401-3-you-do-not-have-permission-to-view-this-directory-or-page-using-the-credentials-you-supplied-access-denied-due-to-access-control-lists/)