# q-quit
q-quit - q to smart quit.

q-quit remapps the q key to a smart close utility, allowing
the user to quickly close window, quickfix list, etc. The original
functionality of q key, which is related to macro recording, is
remapped to `<leader>q`.

## Features

* quickly close window, quickfix list, etc.

## Installation

Using [Vim-plug](https://github.com/junegunn/vim-plug), you can install using:

	Plug 'HustLion/q-quit'

## Options

If you need to use q to close the last and only window, set this option
to 1, otherwise set it to 0:

    let g:q_quit_close_when_only_one_window = 1

## TODO

* [ ] explain window, ft options
* [ ] test for nvim, gvim

## Credits

The ideas and original code of q-quit originated from SpaceVim <https://github.com/liuchengxu/space-vim>.