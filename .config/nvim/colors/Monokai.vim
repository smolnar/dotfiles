" Vim color file
" Converted from Textmate theme Monokai using Coloration v0.3.2 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Monokai"

hi Cursor ctermfg=235 ctermbg=231 cterm=NONE
hi Visual ctermfg=NONE ctermbg=59 cterm=NONE
hi CursorLine ctermfg=NONE ctermbg=235 cterm=NONE
hi CursorColumn ctermfg=NONE ctermbg=235 cterm=NONE
hi ColorColumn ctermfg=NONE ctermbg=235 cterm=NONE
hi LineNr ctermfg=102 ctermbg=237 cterm=NONE
hi VertSplit ctermfg=241 ctermbg=241 cterm=NONE
hi MatchParen ctermfg=231 ctermbg=NONE cterm=bold
hi StatusLine ctermfg=231 ctermbg=241 cterm=bold
hi StatusLineNC ctermfg=231 ctermbg=241 cterm=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE
hi PmenuSel ctermfg=NONE ctermbg=59 cterm=NONE
hi IncSearch ctermfg=235 ctermbg=186 cterm=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline
hi Directory ctermfg=141 ctermbg=NONE cterm=NONE
hi Folded ctermfg=242 ctermbg=235 cterm=NONE

hi Normal ctermfg=231 ctermbg=235 cterm=NONE
hi Boolean ctermfg=141 ctermbg=NONE cterm=NONE
hi Character ctermfg=141 ctermbg=NONE cterm=NONE
hi Comment ctermfg=242 ctermbg=NONE cterm=NONE
hi Conditional ctermfg=203 ctermbg=NONE cterm=NONE
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE
hi Define ctermfg=203 ctermbg=NONE cterm=NONE
hi DiffAdd ctermfg=148 ctermbg=64 cterm=bold
hi DiffDelete ctermfg=203 ctermbg=NONE cterm=NONE
hi DiffRemoved ctermfg=203 ctermbg=NONE cterm=NONE
hi DiffChange ctermfg=148 ctermbg=23 cterm=NONE
hi DiffText ctermfg=231 ctermbg=24 cterm=bold
hi ErrorMsg ctermfg=231 ctermbg=203 cterm=NONE
hi WarningMsg ctermfg=231 ctermbg=203 cterm=NONE
hi Float ctermfg=141 ctermbg=NONE cterm=NONE
hi Function ctermfg=148 ctermbg=NONE cterm=NONE
hi Identifier ctermfg=81 ctermbg=NONE cterm=NONE
hi Keyword ctermfg=203 ctermbg=NONE cterm=NONE
hi Label ctermfg=186 ctermbg=NONE cterm=NONE
hi NonText ctermfg=59 ctermbg=236 cterm=NONE
hi Number ctermfg=141 ctermbg=NONE cterm=NONE
hi Operator ctermfg=203 ctermbg=NONE cterm=NONE
hi PreProc ctermfg=203 ctermbg=NONE cterm=NONE
hi Special ctermfg=231 ctermbg=NONE cterm=NONE
hi SpecialKey ctermfg=59 ctermbg=237 cterm=NONE
hi Statement ctermfg=203 ctermbg=NONE cterm=NONE
hi StorageClass ctermfg=81 ctermbg=NONE cterm=NONE
hi String ctermfg=186 ctermbg=NONE cterm=NONE
hi Tag ctermfg=203 ctermbg=NONE cterm=NONE
hi Title ctermfg=231 ctermbg=NONE cterm=bold
hi Todo ctermfg=95 ctermbg=NONE cterm=inverse,bold
hi Type ctermfg=NONE ctermbg=NONE cterm=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline

" Ruby & Rails
hi rubyClass ctermfg=203 ctermbg=NONE cterm=NONE
hi rubyFunction ctermfg=148 ctermbg=NONE cterm=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE
hi rubySymbol ctermfg=141 ctermbg=NONE cterm=NONE
hi rubyConstant ctermfg=81 ctermbg=NONE cterm=NONE
hi rubyStringDelimiter ctermfg=186 ctermbg=NONE cterm=NONE
hi rubyBlockParameter ctermfg=208 ctermbg=NONE cterm=NONE
hi rubyInstanceVariable ctermfg=NONE ctermbg=NONE cterm=NONE
hi rubyGlobalVariable ctermfg=NONE ctermbg=NONE cterm=NONE
hi rubyRegexp ctermfg=186 ctermbg=NONE cterm=NONE
hi rubyRegexpDelimiter ctermfg=186 ctermbg=NONE cterm=NONE
hi rubyInclude ctermfg=203 ctermbg=NONE cterm=NONE
hi rubyVisibilityModifiers ctermfg=203 ctermbg=NONE cterm=NONE
hi rubyAttribute ctermfg=203 ctermbg=NONE cterm=NONE
hi rubyAssertion ctermfg=81 ctermbg=NONE cterm=NONE
hi rubyEscape ctermfg=141 ctermbg=NONE cterm=NONE
hi rubyControl ctermfg=203 ctermbg=NONE cterm=NONE
hi rubyClassVariable ctermfg=NONE ctermbg=NONE cterm=NONE
hi rubyOperator ctermfg=203 ctermbg=NONE cterm=NONE
hi rubyException ctermfg=203 ctermbg=NONE cterm=NONE
hi rubyExceptionHandler ctermfg=203 ctermbg=NONE cterm=NONE
hi rubyPseudoVariable ctermfg=NONE ctermbg=NONE cterm=NONE
hi rubyEntity ctermfg=81 ctermbg=NONE cterm=NONE
hi rubyEntities ctermfg=81 ctermbg=NONE cterm=NONE
hi rubyCallback ctermfg=81 ctermbg=NONE cterm=NONE
hi rubyValidation ctermfg=81 ctermbg=NONE cterm=NONE
hi rubyMacro ctermfg=81 ctermbg=NONE cterm=NONE
hi rubyResponse ctermfg=81 ctermbg=NONE cterm=NONE
hi rubyUrlHelper ctermfg=81 ctermbg=NONE cterm=NONE
hi rubyHelper ctermfg=81 ctermbg=NONE cterm=NONE
hi rubySchema ctermfg=81 ctermbg=NONE cterm=NONE
hi rubyRoute ctermfg=81 ctermbg=NONE cterm=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE
hi erubyComment ctermfg=95 ctermbg=NONE cterm=NONE
hi erubyRailsMethod ctermfg=81 ctermbg=NONE cterm=NONE

" HTML
hi htmlTag ctermfg=NONE ctermbg=NONE cterm=NONE
hi htmlEndTag ctermfg=NONE ctermbg=NONE cterm=NONE
hi htmlTagName ctermfg=NONE ctermbg=NONE cterm=NONE
hi htmlArg ctermfg=NONE ctermbg=NONE cterm=NONE
hi htmlSpecialChar ctermfg=141 ctermbg=NONE cterm=NONE

" JavaScript
hi javaScriptFunction ctermfg=81 ctermbg=NONE cterm=NONE
hi javaScriptRailsFunction ctermfg=81 ctermbg=NONE cterm=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE

" YAML
hi yamlKey ctermfg=203 ctermbg=NONE cterm=NONE
hi yamlAnchor ctermfg=NONE ctermbg=NONE cterm=NONE
hi yamlAlias ctermfg=NONE ctermbg=NONE cterm=NONE
hi yamlDocumentHeader ctermfg=186 ctermbg=NONE cterm=NONE

" CSS
hi cssURL ctermfg=208 ctermbg=NONE cterm=NONE
hi cssFunctionName ctermfg=81 ctermbg=NONE cterm=NONE
hi cssColor ctermfg=141 ctermbg=NONE cterm=NONE
hi cssPseudoClassId ctermfg=148 ctermbg=NONE cterm=NONE
hi cssClassName ctermfg=148 ctermbg=NONE cterm=NONE
hi cssValueLength ctermfg=141 ctermbg=NONE cterm=NONE
hi cssCommonAttr ctermfg=81 ctermbg=NONE cterm=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE

" Neomake
hi NeomakeMessageSign ctermfg=81 ctermbg=242 cterm=NONE
hi NeomakeInfoSign ctermfg=81 ctermbg=242 cterm=NONE
hi NeomakeErrorSign ctermfg=203 ctermbg=242 cterm=NONE
hi NeomakeWarningSign ctermfg=186 ctermbg=242 cterm=NONE
hi NeomakeMessage ctermfg=81 ctermbg=NONE cterm=NONE
hi NeomakeInfo ctermfg=81 ctermbg=NONE cterm=NONE
hi NeomakeError ctermfg=203 ctermbg=NONE cterm=NONE
hi NeomakeWarning ctermfg=186 ctermbg=NONE cterm=NONE
