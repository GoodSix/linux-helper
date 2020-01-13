#!/bin/bash

# 扫描可用命令


file='command.md'
scan() {
    for item in `ls $1`; do
        if [[ -d $1 ]]; then
            scan $1/$item;
        elif [[ ${item:0-2} == 'sh' ]]; then
            description=`tac $item | head -1`;
			if [[ ${description:0:1} == '#' ]]; then
				item=${item##*/}
				echo '    '${item:0:-3} >> $file
				echo '        + '${description:2} >> $file
				group=`dirname $1`;
				echo "        + ${group:2}" >> $file;
				echo '' >> $file
			fi
        fi
    done
}
echo '# 可用命令' > $file
echo '介绍、适用环境' >> $file
echo '' >> $file
scan `dirname $BASH_SOURCE`