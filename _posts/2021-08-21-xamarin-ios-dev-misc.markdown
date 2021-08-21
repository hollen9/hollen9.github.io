---
layout: post
title: Xamarin iOS 常見問題
date:   2021-08-21 15:57
description: 個人向 Xamarin iOS 在編譯、部署時會遇到的各種問題
toc: false
share: true
comments: true
tags: Xamarin iOS Development VisualStudio 
---

# 學習筆記

## Testflight
1. 由於每次上傳到商店可能都會遇到不可預期的狀況 (被蘋果擺了一道)，所以最好提前 APP 過期一周前，就先上傳新的版本!
2. 只要 Testflight APP 沒有過期，就可以沿用原本的版本號，只要 Build Number 累加就好，這樣使用者連重載 App 都不用，你這邊當然也不用等蘋果審核。
3. 審核所花十日大約為兩~三天。

## Visual Studio 2019 (Windows) + macOS on VMWare Workstation Pro
#### Q: 上傳一直寫 `"altool" exited with code 1.`?
有可能是APP特定密碼錯，或是 SDK 過期了，所以要更新 XCode 和 Visual Studio。
Visual Studio 沒辦法看到確切的錯誤，若想知道確切錯誤需要到 macOS 的 XCode > Windows > Orgnizer 自己去 Upload。
最後一個畫面會寫原因。

#### Q: Provisioning Profile 不見了? 不是有訂閱的就可以用 Automatic 嗎?
刪除 `%localappdata%\Temp\Xamarin\XMA` 資料夾，重開 VS。

#### Q: 在 MACOS 中也無法 Upload to store, 說現在開始要新的 SDK?!
恭喜你，你要當作砍掉重練──請透過目前的 macOS 去下載新版作業系統的 dmg，然後直接在 macOS 中轉換為 iso 檔。請不要用 Windows 的 dmg2iso，那個我試過失敗。
不要去載網路上的 VMWARE IMG，那個是給完全沒有 macOS 的人先近來載作業系統的，實際用起來 Bug 會很多，或是很卡。而且不能更新所以乾脆載官方純淨最新版不好嗎?
OS 搞定後，請下載最新的 XCode。然後更新 Windows 這邊的 Visual Studio (VS 版本號和 XCode 是有相依性的，一但升級就不可以降級，網路上也找不到細部歷史版本提供下載喔!)。
然後自己看一下微軟的教學，大致上就是要產生新的 Provisioning Profile 和 Certificate。VS 和 XCODE 都要手動下載一下，看有沒有呈現在清單上。MACOS 重開機，VS 重開，刪 XMA 資料夾。

#### Q: `%localappdata%\Temp\Xamarin\XMA` 無法刪除，檔案使用中?
用工作管理員結束掉 Broker 和 IOS 啥的，自己用 Process Hacker 2 搜尋 XMA 一目了然。

#### Q: iOS Release Build 很久!?
冷靜~ 等十分鐘再回來。Debug 會比較快是正常的，可能是因為 CPU 指令集不同，ARM 比 X86 慢很正常。

#### Q: Upload To Store 顯示空的 Profile 和 Certificate
MacOS 產生的 Certificate 是和作業系統綁定的，所以請上蘋果的 Developer Account 產生新的 Profile 和 Certificate。
新產生的 Profile，要自己開 XCode 進設定選項下載 Profile，Visual Studio 這邊也要進設定選項下載。

#### Q: Authenticate Service not available.
A1: 太頻繁操作，被蘋果鎖定一小時。
A2: 進 Developer Account 看是不是要接受新的使用條款，沒接受也會顯示這個訊息。

#### Q: MacOS 產生了新的 Certificate 之後，VS 這邊顯示 Not in keychain?
就是說得那樣，沒有在 MacOS 的鑰匙圈，所以請從 Certificate 創建頁面末 Download 然後自己點兩下匯入到 Login 的 Keychain。不要放進 System 或 iCloud。

#### Q: 奇怪啊我已經放進 Login 了，那個 Certificate 沒有顯示 Valid 而是顯示紅字錯誤耶?
Developer Relations Intermediate Certificate 可能過期了，蘋果有時候會更新這個。所以自己到
<https://www.apple.com/certificateauthority/AppleWWDRCAG3.cer> 下載，然後一樣點兩下匯入，然後再重新操作產生 Certificate 的步驟。
參考: <https://developer.apple.com/forums/thread/662300>

#### Q: 奇怪明明可以連線至 MacOS ，可是 Build 或 Archive 或 Distribute 的時候就給我顯示無法連線至 macOS?
刪除 `%localappdata%\Temp\Xamarin\XMA` 資料夾，重開 VS 和 macOS。