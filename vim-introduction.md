---
title:
- vim introduction
author:
- gao qiang
---

# 1. four basic mode
     Nomal mode
     Insert mode
     Visual mode
     Visual block mode

# 2. vim grammer
    * <verb> <noun> *
    d w (delete word)
    c w (change word)
    f w (find word)
    t w (to word)

*<command> <in/around>  <noun>*
    d i w (delete in word)
    c i w (change in word)
    d i "
    c i "
        ex:
            I love vim
            I "love hate" vim

# 3. Basic command (part 1)

    h, j, k, l just like the arrow keys
    ˆ beginning of line
    $ end of line (think regex)

    w move forward one word
    b move to beginning of word
    e move to end of word

    d Delete (also cut)
    c Change
    y Yank (copy)

# 3. Basic command (part 2)
    dd Delete the current line
    cc Change current line
    yy Yank current line

    d$ Delete till the end of the line
    cˆ Change till the beginning of the line
    dj Delete the current line and the one below

# 4. Navigation
    search in line (from stupid to smart)
    search in file /

# 5. Buffers
    yank to " 0
    delete to " 1-9
    paste from "

# 6. Marco
    "q" to make a marco
    @ to use a marco

# 7. autocompletion
   ctrl x  ctrl p

# 7. Customized
    set nu
    set rnu
    set list

# 8. Plugin
    NERDTREE
    CommandT
    TrailerTrim


# 9. Q&A


# 10. Tmux introducton
    demo
