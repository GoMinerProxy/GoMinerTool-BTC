#!/bin/bash
[[ $(id -u) != 0 ]] && echo -e "请在Root用户下运行安装该脚本" && exit 1

cmd="apt-get"
if [[ $(command -v apt-get) || $(command -v yum) ]] && [[ $(command -v systemctl) ]]; then
    if [[ $(command -v yum) ]]; then
        cmd="yum"
    fi
else
    echo "这个安装脚本不支持你的系统" && exit 1
fi


install(){
    if [ -d "/root/gominertool-btc" ]; then
        echo -e "检测到您已安装GoMinerTool-BTC，请勿重复安装，如您确认您未安装请使用rm -rf /root/gominertool-btc指令" && exit 1
    fi
    if screen -list | grep -q "gominertool-btc"; then
        echo -e "检测到您的GoMinerTool-BTC已启动，请勿重复安装" && exit 1
    fi

    $cmd update -y
    $cmd install wget screen -y
    
    mkdir /root/gominertool-btc
    wget https://cdn.jsdelivr.net/gh/GoMinerProxy/GoMinerTool-BTC@main/scripts/run.sh -O /root/gominertool-btc/run.sh --no-check-certificate
    chmod 777 /root/gominertool-btc/run.sh
    wget https://cdn.jsdelivr.net/gh/GoMinerProxy/GoMinerTool-BTC@main/others/cert.tar.gz -O /root/gominertool-btc/cert.tar.gz --no-check-certificate
    tar -zxvf /root/gominertool-btc/cert.tar.gz -C /root/gominertool-btc
    
    wget https://cdn.jsdelivr.net/gh/GoMinerProxy/GoMinerTool-BTC@main/release/GoMinerTool-BTC_v1.1.0_linux_amd64.tar.gz -O /root/GoMinerTool-BTC_v1.1.0_linux_amd64.tar.gz --no-check-certificate -O /root/GoMinerTool-BTC_v1.1.0_linux_amd64.tar.gz --no-check-certificate
    tar -zxvf /root/GoMinerTool-BTC_v1.1.0_linux_amd64.tar.gz -C /root/gominertool-btc
    chmod 777 /root/gominertool-btc/GoMinerTool-BTC

    screen -dmS gominertool-btc
    sleep 0.2s
    screen -r gominertool-btc -p 0 -X stuff "cd /root/gominertool-btc"
    screen -r gominertool-btc -p 0 -X stuff $'\n'
    screen -r gominertool-btc -p 0 -X stuff "./run.sh"
    screen -r gominertool-btc -p 0 -X stuff $'\n'

    sleep 4s
    echo "GoMinerTool-BTC V1.1.0-Beta已经安装到/root/gominertool-btc"
    cat /root/gominertool-btc/pwd.txt
    echo ""
    echo "您可以使用指令screen -r gominertool-btc查看程式端口和密码"
}


uninstall(){
    read -p "您确认您是否删除GoMinerTool-BTC)[yes/no]：" flag
    if [ -z $flag ];then
         echo "您未正确输入" && exit 1
    else
        if [ "$flag" = "yes" -o "$flag" = "ye" -o "$flag" = "y" ];then
            screen -X -S gominertool-btc quit
            rm -rf /root/gominertool-btc
            echo "GoMinerTool-BTC已成功从您的伺服器上卸载"
        fi
    fi
}


update(){
    wget https://cdn.jsdelivr.net/gh/GoMinerProxy/GoMinerTool-BTC@main/release/GoMinerTool-BTC_v1.1.0_linux_amd64.tar.gz -O /root/GoMinerTool-BTC_v1.1.0_linux_amd64.tar.gz --no-check-certificate -O /root/GoMinerTool-BTC_v1.1.0_linux_amd64.tar.gz --no-check-certificate

    if screen -list | grep -q "gominertool-btc"; then
        screen -X -S gominertool-btc quit
    fi
    rm -rf /root/gominertool-btc/GoMinerTool-BTC

    tar -zxvf /root/GoMinerTool_v1.1.0-Beta_linux_amd64.tar.gz -C /root/gominertool-btc
    chmod 777 /root/gominertool-btc/GoMinerTool-BTC

    screen -dmS gominertool-btc
    sleep 0.2s
    screen -r gominertool-btc -p 0 -X stuff "cd /root/gominertool-btc"
    screen -r gominertool-btc -p 0 -X stuff $'\n'
    screen -r gominertool-btc -p 0 -X stuff "./run.sh"
    screen -r gominertool-btc -p 0 -X stuff $'\n'

    sleep 4s
    echo "GoMinerTool-BTC 已经更新至V1.1.0-BTC版本并启动"
    cat /root/gominertool-btc/pwd.txt
    echo ""
    echo "您可以使用指令screen -r gominertool-btc查看程式输出"
}


start(){
    if screen -list | grep -q "gominertool-btc"; then
        echo -e "检测到您的GoMinerTool-BTC已启动，请勿重复启动" && exit 1
    fi
    
    screen -dmS gominertool-btc
    sleep 0.2s
    screen -r gominertool-btc -p 0 -X stuff "cd /root/gominertool-btc"
    screen -r gominertool-btc -p 0 -X stuff $'\n'
    screen -r gominertool-btc -p 0 -X stuff "./run.sh"
    screen -r gominertool-btc -p 0 -X stuff $'\n'
    
    echo "GoMinerTool-BTC已启动"
    echo "您可以使用指令screen -r gominertool-btc查看程式输出"
}


restart(){
    if screen -list | grep -q "gominertool-btc"; then
        screen -X -S gominertool-btc quit
    fi
    
   screen -dmS gominertool-btc
    sleep 0.2s
    screen -r gominertool-btc -p 0 -X stuff "cd /root/gominertool-btc"
    screen -r gominertool-btc -p 0 -X stuff $'\n'
    screen -r gominertool-btc -p 0 -X stuff "./run.sh"
    screen -r gominertool-btc -p 0 -X stuff $'\n'

    echo "GoMinerTool-BTC 已经重新启动"
    echo "您可以使用指令screen -r gominertool-btc查看程式输出"
}


stop(){
    screen -X -S gominertool-btc quit
    echo "GoMinerTool-BTC 已停止"
}


change_limit(){
    if grep -q "1000000" "/etc/profile"; then
        echo -n "您的系统连接数限制可能已修改，当前连接限制："
        ulimit -n
        exit
    fi

    cat >> /etc/sysctl.conf <<-EOF
fs.file-max = 1000000
fs.inotify.max_user_instances = 8192

net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_fin_timeout = 30
net.ipv4.tcp_tw_reuse = 1
net.ipv4.ip_local_port_range = 1024 65000
net.ipv4.tcp_max_syn_backlog = 16384
net.ipv4.tcp_max_tw_buckets = 6000
net.ipv4.route.gc_timeout = 100

net.ipv4.tcp_syn_retries = 1
net.ipv4.tcp_synack_retries = 1
net.core.somaxconn = 32768
net.core.netdev_max_backlog = 32768
net.ipv4.tcp_timestamps = 0
net.ipv4.tcp_max_orphans = 32768

# forward ipv4
# net.ipv4.ip_forward = 1
EOF

    cat >> /etc/security/limits.conf <<-EOF
*               soft    nofile          1000000
*               hard    nofile          1000000
EOF

    echo "ulimit -SHn 1000000" >> /etc/profile
    source /etc/profile

    echo "系统连接数限制已修改，手动reboot重启下系统即可生效"
}


check_limit(){
    echo -n "您的系统当前连接限制："
    ulimit -n
}


echo "======================================================="
echo "GoMinerTool-BTC 一键脚本，脚本默认安装到/root/gominertool-btc"
echo "                                   脚本版本：V1.1.0"
echo "  1、安  装"
echo "  2、卸  载"
echo "  3、更  新"
echo "  4、启  动"
echo "  5、重  启"
echo "  6、停  止"
echo "  7、一键解除Linux连接数限制(需手动重启系统生效)"
echo "  8、查看当前系统连接数限制"
echo "======================================================="
read -p "$(echo -e "请选择[1-8]：")" choose
case $choose in
    1)
        install
        ;;
    2)
        uninstall
        ;;
    3)
        update
        ;;
    4)
        start
        ;;
    5)
        restart
        ;;
    6)
        stop
        ;;
    7)
        change_limit
        ;;
    8)
        check_limit
        ;;
    *)
        echo "请输入正确的数字！"
        ;;
esac