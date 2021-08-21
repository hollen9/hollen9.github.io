---
layout: post
title: Jekyll tips
date:   2021-08-21 17:41
description: 個人向 Jekyll 的各種狀況
toc: false
share: true
comments: true
tags: jekyll development
---

# 編譯問題
`ffi-1.11.1-x64-mingw32 requires ruby version < 2.7.dev, >= 2.2, which is incompatible with the current version, ruby 2.7.4p191`
我 2019 年使用 Ruby 2.5，2021 年我換到另一台電腦並且改用 Ruby 2.7.4，結果原本專案執行 `bundle exec jekyll serve` 無法部署。

解法: 運行 `bundle update` 看能否解決問題