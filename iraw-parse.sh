#!/bin/bash
cnt=0
begin=0

file=$1
file="${file%'.iraw'}"

for i in `grep -abo JFIF "$file.iraw"; echo 99999999;`
do
    (( end = "${i%':JFIF'} - 6" ))
    (( size = $end - $begin ))
    dd if="$file.iraw" of="$file.$cnt.jpg" bs=1 skip=$begin count=$size
    begin=$end
    (( cnt = 1 + $cnt ))
done