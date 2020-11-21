#! bin/bash

# ——————————————————————————shell快捷键——————————————————————————
# 将个人shell配置重写，如果全局文件存在，则引入全局配置
cat <<EOF> ~/.vimrc
set nu "显示行号
set ruler
set scrolloff=3   " 光标移动到buffer的顶部和底部时保持3行距离 
syntax enable "自动检测语法
syntax on "自动语法高亮
colorscheme desert "设定配色方案
set guifont=Consolas:h12:cANSI "英文字体
set guifontwide=SimSun-ExtB:h12:cGB2312 "设置文字宽度
set tabstop=4 "表示Tab代表4个空格的宽度
set expandtab "表示Tab自动转换成空格（不推荐代码中包含制表符）
set autoindent "表示换行后自动缩进
set autoread "当文件在外部被修改时，自动重新读取
set history=400 "vim记住的历史操作的数量，默认的是20
set nocompatible "使用vim自己的键盘模式,而不是兼容vi的模式
set confirm "处理未保存或者只读文件时,给出提示
set smartindent "智能对齐
set shiftwidth=4 "偏移4个空格
set smarttab

" 显示中文注释（非乱码）
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

set paste "不自动缩进和连续注释

"set cursorcolumn  "高亮显示列
"set cursorline  "高亮显示行

filetype on  "检测文件的类型

set cindent  "（cindent是特别针对 C语言语法自动缩进）
set smartindent  "依据上面的对齐格式，智能的选择对齐方式，对于类似C语言编写上有用
set ai!  " 设置自动缩进（非常好用）
set showmatch  "设置匹配模式，类似当输入一个左括号时会匹配相应的右括号
set ruler  "在编辑过程中，在右下角显示光标位置的状态行

set nobackup   "禁止生成临时文件
filetype on   "侦测文件类型
autocmd InsertLeave * se nocul  " 用浅色高亮当前行
filetype indent on  "为特定文件类型载入相关缩进文件

set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=2             " 短暂跳转到匹配括号的时间
set magic                   " 设置魔术
set autochdir               " 自动切换当前目录为当前文件所在的目录


inoremap { {<CR>}<ESC>O<Tab>

if [ -f /etc/vimrc ]; then
  . /etc/vimrc
fi
EOF