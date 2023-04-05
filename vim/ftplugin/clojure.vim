" vim-iced https://liquidz.github.io/vim-iced/
let g:iced_enable_default_key_mappings = v:true

let g:iced_enable_clj_kondo_analysis = v:true
let g:iced_enable_clj_kondo_local_analysis = v:true

aug MyClojureSetting
  au!
  au VimEnter * IcedConnect
aug END
