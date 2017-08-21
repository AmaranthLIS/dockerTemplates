pstree 32567
pstree -p 32567

pstree -p 32567| perl -ne 'print "$_\n" foreach /\((\d+)\)/g;'
pstree -p 32567| perl -ne '`kill -9 $_` foreach /\((\d+)\)/g;'

pstree -p 32567| perl -ne 'print "$1\n" while /\((\d+)\)/g;'
pstree -p 32567| perl -ne '`kill -9 $1` while /\((\d+)\)/g;'
