" Ununtu's default PHP config doesn't set comment correctly
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://

" When entering a curly brace, auto complete in a tom-friendly manner
:imap { {}<left><cr><cr><bs><up><end>
