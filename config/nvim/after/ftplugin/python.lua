-- this file will be loaded after the default python file type file in /usr/local/share/nvim/runtime/
--

-- old config
--   " python configuration {
--   augroup PYTHON
--     au!
--     autocmd FileType python set foldlevel=99
--   augroup END
--
--   nnoremap <buffer> H :<C-u>execute "!pydoc3 " . expand("<cword>")<CR>
--
--   set sections="def class"
--   " }

-- foldlevel({lnum})                                                  *foldlevel()*
-- 		The result is a Number, which is the foldlevel of line {lnum}
-- 		in the current buffer.  For nested folds the deepest level is
-- 		returned.  If there is no fold at line {lnum}, zero is
-- 		returned.  It doesn't matter if the folds are open or closed.
-- 		When used while updating folds (from 'foldexpr') -1 is
-- 		returned for lines where folds are still to be updated and the
-- 		foldlevel is unknown.  As a special case the level of the
-- 		previous line is usually available.
-- 		{lnum} is used like with |getline()|.  Thus "." is the current
-- 		line, "'m" mark m, etc.

-- vim.opt_local.foldlevel = 99

-- 						*'sections'* *'sect'*
-- 'sections' 'sect'	string	(default "SHNHH HUnhsh")
-- 			global
-- 	Specifies the nroff macros that separate sections.  These are pairs of
-- 	two letters (See |object-motions|).  The default makes a section start
-- 	at the nroff macros ".SH", ".NH", ".H", ".HU", ".nh" and ".sh".

vim.opt_local.sections = "def class"
