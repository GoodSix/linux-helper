shells_dir=('ubuntu');

readme=`echo -e "Ubuntu下通过apt快速部署环境的一种实现方式\r
\r## Error\r
\r### bash: add-apt-repository: command not found\r
\\\`curl -o- https://shell.if-she.com/ubuntu/add-apt-repository | bash\\\`
\r\r\r\r
"`

for shell_dir in $shells_dir; do
    shells=`ls $shell_dir`;
    readme+='# '$shell_dir;
    for shell in $shells; do
        hint=`cat $shell_dir/$shell | head -2 | tail -1`;
        if [[ ${hint:0:1} == '#' ]]; then
            # echo $shell;
            readme+=`echo -e "\r\r- ${hint:1}  \r\\\`curl -o- https://shell.if-she.com/$shell_dir/$shell | bash\\\`"`
        fi
    done
done

echo $readme > README.md