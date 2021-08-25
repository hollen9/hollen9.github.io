---
layout: post
title: 利用 Google Maps Javascript 匯入 KML 檔案自動畫圖
date:   2021-08-24 17:41 +8
description: 如何不自己讀取資料，直接利用 KmlLayer 呈現。以及可能會碰到的問題。
toc: false
share: true
comments: true
tags: GoogleMaps Javascript Development
---

# 程式碼
{% gist 2ef737876d60d1fdd60af820254316f7 %}

# 可能問題
## 線條粗細和在 Google My Maps 或 Google Earth 上看到的不一樣! 怎麼變那麼粗?
需要手動在 KML 檔案中，自行針對每項 `<LineStyle></LineStyle>` 加入 `<width>0.001</width>`
0.001 可自行改成所需的值。
Tip: 尋找與取代 `</LineStyle>` 為 `<width>0.001</width></LineStyle>`