# Bloody Maple's Grace :maple_leaf: 血腥玛普丽的恩典

[TOC]

## Introduction

This project is intended to host various AHK scripts that Mornrain writes in reply to Maple's feature requests. The aim of these scripts is to facilitate Maple's user experience of Windows OS, as well as boosting productivity. Mornrain may benefit from this project after sharpening his AHK script writing skill and gaining massive enhancement of his capability to search for tech solutions.

The project name originates from Maple, whose Chinese name consists of 枫, which is quite poetic character and translated to English word "Maple". He is prefixed "Bloody" for conceptually "enslaving" Mornrain to endless script writing job. He is also a cross-dressing lover, hence the project name also references and pays a tribute to *Bloody Mary*, an inspiring female antagonist and horror movie subcultural icon.

Mornrain and Maple are at present studying as BSc. in Computer Science in CUHK, Hong Kong. Interested recruit teams are free to contact.



## Utilization

1. 微信聊天记录to印象笔记
2. 方向键迁移至 home row
3. Add more functionalities to enhance and exploit `Capslock` key, who occupies position of strategic significance.



## Feature Request [TODO]

Following are more features requested by Maple that are not yet implemented:

1. Improve 微信聊天记录to印象笔记 functionality. AHK native API only allows manipulation of clipboard content after disposal of style information and hence the degradation to plain text. Try to exploit third-party library WinClip to retain and manipulate style.

2. 除了当前光标处在输入框模式（即光标从平常的箭头 arrow 变成一个竖条 beam）的所有其他模式下，1输出F1，2输出F2，以此类推，-输出F11，+输出F12；

   - 按下Fn+A之后，以上AHK脚本功能disabled，再次按下Fn+A之后，脚本功能恢复enabled;

3. A cheat script to spoil Overcooked 2.

   - Incorporate the two main operation keys into one key.

4. A grace-quit wrapper of Windows' native hibernate function. 

   - Do all the 休眠之前的收尾dirty work: Chrome内执行扩展 Session Buddy 的 Save current session，然后执行扩展 The Great Suspender 把所有的标签页 suspend, ......最后才休眠；

5. Complete of `makefile` to implement:
   - Cascade all scripts under the project and output a unified script, which is further compiled to package a ultimate executable that could be put into final usage. Don't forget to delete the unified script under `clean` target.

   - Wrap AHK compilation function and provide a clean interface to compiling (and running) specific script. This functionality is useful for testing and debugging specific script. A good interface may look like this: `$ make c ScriptName.ahk`.




## Limitation & Warning

- Due to WeChat client's limitation, 微信聊天记录to印象笔记 functionality can't handle the unlikely situation where conversation engagers' name is non-trivial, or when conversation contains like-structured sub-conversation, such as storytelling, ~~which sounds like what Maple occasionally does~~.



## License

This project is currently licensed under terms of [WTF2](./LICENSE) license. You are free to contribute, fork, modify or redistribute.