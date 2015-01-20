" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

function! Vlog_always_template(clean)
    if a:clean == 1
        let s:sensitivity_list = inputdialog("sensitivity_list:")
    else
        if !exists('s:sensitivity_list')
            let s:sensitivity_list = inputdialog("sensitivity_list:")
        endif
    endif
    let current_line = line(".")
    let process_statement =  "always @(" . s:sensitivity_list . ")\n"
    let process_statement .= "begin\n"
    let process_statement .= "if () begin\n"
    let process_statement .= "end\n"
    let process_statement .= "else if () begin\n"
    let process_statement .= "end\n"
    let process_statement .= "end\n\n"
    "let @z = process_statement
    "normal! "zp
    silent put = process_statement
    execute "normal! V" . current_line . "G=3jf)"
endfunction

function! Vlog_translate_vhdl_object_declaration()
    let l_match = matchlist(getline(line('.')), '\(\a\+\)\s*\(\h\+\)\s*:\s*\(\h\+\)\(.*\);')
    let index = 1

    if !empty(l_match)
        let range = "\t\t\t\t\t"
        while l_match[index] != ""
            if index == 2
                let identifier = l_match[index]
            endif
            if index == 4
                let range = substitute(l_match[index], '(\(.\+\) downto \(.\+\))', '[\1:\2]', '')
            endif
            let index = index + 1
        endwhile
        silent put = 'wire ' . range . \"\t\t\t\t\t\t\t\t\t\t\t\" . identifier . ';'
        normal! $bhv45|d
        normal! V=
    endif
endfunction
