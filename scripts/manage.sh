#!/bin/bash
[[ $(id -u) != 0 ]] && echo -e "請在Root用戶下運行安裝該腳本" && exit 1

cmd="apt-get"
if [[ $(command -v apt-get) || $(command -v yum) ]] && [[ $(command -v systemctl) ]]; then
    if [[ $(command -v yum) ]]; then
        cmd="yum"
    fi
else
    echo "這個安裝腳本不支持你的系統" && exit 1
fi


install(){
    if [ -d "/root/gominertool-btc" ]; then
        echo -e "檢測到您已安裝GoMinerTool-BTC，請勿重複安裝，如您確認您未安裝請使用rm -rf /root/gominertool-btc指令" && exit 1
    fi
    if screen -list | grep -q "gominertool-btc"; then
        echo -e "檢測到您的GoMinerTool-BTC已啟動，請勿重複安裝" && exit 1
    fi

    $cmd update -y
    $cmd install wget screen -y
    
    mkdir /root/gominertool-btc
    wget https://raw.githubusercontent.com/GoMinerProxy/GoMinerTool-BTC/main/scripts/run.sh -O /root/gominertool-btc/run.sh --no-check-certificate
    chmod 777 /root/gominertool-btc/run.sh
    wget https://raw.githubusercontent.com/GoMinerProxy/GoMinerTool-BTC/main/other/cert.tar.gz -O /root/gominertool-btc/cert.tar.gz --no-check-certificate
    tar -zxvf /root/gominertool-btc/cert.tar.gz -C /root/gominertool-btc
    
    wget https://github.com/GoMinerProxy/GoMinerTool-BTC/releases/download/1.1.1/GoMinerTool-BTC_v1.1.1_linux_amd64.tar.gz -O /root/GoMinerTool-BTC_v1.1.1_linux_amd64.tar.gz --no-check-certificate
    tar -zxvf /root/GoMinerTool-BTC_v1.1.1_linux_amd64.tar.gz -C /root/gominertool-btc
    chmod 777 /root/gominertool-btc/GoMinerTool-BTC

    screen -dmS gominertool-btc
    sleep 0.2s
    screen -r gominertool-btc -p 0 -X stuff "cd /root/gominertool-btc"
    screen -r gominertool-btc -p 0 -X stuff $'\n'
    screen -r gominertool-btc -p 0 -X stuff "./run.sh"
    screen -r gominertool-btc -p 0 -X stuff $'\n'

    sleep 4s
    echo "GoMinerTool-BTC V1.1.1已經安裝到/root/gominertool-btc"
    cat /root/gominertool-btc/pwd.txt
    echo ""
    echo "您可以使用指令screen -r gominertool-btc查看程式端口和密碼"
}


uninstall(){
    read -p "您確認您是否刪除GoMinerTool-BTC)[yes/no]：" flag
    if [ -z $flag ];then
         echo "您未正確輸入" && exit 1
    else
        if [ "$flag" = "yes" -o "$flag" = "ye" -o "$flag" = "y" ];then
            screen -X -S gominertool-btc quit
            rm -rf /root/gominertool-btc
            echo "GoMinerTool-BTC已成功從您的伺服器上卸載"
        fi
    fi
}


update(){
    wget https://github.com/GoMinerProxy/GoMinerTool-BTC/releases/download/1.1.1/GoMinerTool-BTC_v1.1.1_linux_amd64.tar.gz -O /root/GoMinerTool-BTC_v1.1.1_linux_amd64.tar.gz --no-check-certificate

    if screen -list | grep -q "gominertool-btc"; then
        screen -X -S gominertool-btc quit
    fi
    rm -rf /root/gominertool-btc/GoMinerTool-BTC

    tar -zxvf /root/GoMinerTool-BTC_v1.1.1_linux_amd64.tar.gz -C /root/gominertool-btc
    chmod 777 /root/gominertool-btc/GoMinerTool-BTC

    screen -dmS gominertool-btc
    sleep 0.2s
    screen -r gominertool-btc -p 0 -X stuff "cd /root/gominertool-btc"
    screen -r gominertool-btc -p 0 -X stuff $'\n'
    screen -r gominertool-btc -p 0 -X stuff "./run.sh"
    screen -r gominertool-btc -p 0 -X stuff $'\n'

    sleep 4s
    echo "GoMinerTool-BTC 已經更新至V1.1.1版本並啟動"
    cat /root/gominertool-btc/pwd.txt
    echo ""
    echo "您可以使用指令screen -r gominertool-btc查看程式輸出"
}


start(){
    if screen -list | grep -q "gominertool-btc"; then
        echo -e "檢測到您的GoMinerTool-BTC已啟動，請勿重複啟動" && exit 1
    fi
    
    screen -dmS gominertool-btc
    sleep 0.2s
    screen -r gominertool-btc -p 0 -X stuff "cd /root/gominertool-btc"
    screen -r gominertool-btc -p 0 -X stuff $'\n'
    screen -r gominertool-btc -p 0 -X stuff "./run.sh"
    screen -r gominertool-btc -p 0 -X stuff $'\n'
    
    echo "GoMinerTool-BTC已啟動"
    echo "您可以使用指令screen -r gominertool-btc查看程式輸出"
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

    echo "GoMinerTool-BTC 已經重新啟動"
    echo "您可以使用指令screen -r gominertool-btc查看程式輸出"
}


stop(){
    screen -X -S gominertool-btc quit
    echo "GoMinerTool-BTC 已停止"
}


change_limit(){
    if grep -q "1000000" "/etc/profile"; then
        echo -n "您的系統連接數限制可能已修改，當前連接限制："
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

    echo "系統連接數限制已修改，手動reboot重啟下系統即可生效"
}


check_limit(){
    echo -n "您的系統當前連接限制："
    ulimit -n
}


echo "======================================================="
echo "GoMinerTool-BTC 一鍵腳本，脚本默认安装到/root/gominertool-btc"
echo "                                   腳本版本：V1.1.1"
echo "  1、安  装"
echo "  2、卸  载"
echo "  3、更  新"
echo "  4、启  动"
echo "  5、重  启"
echo "  6、停  止"
echo "  7、一鍵解除Linux連接數限制(需手動重啟系統生效)"
echo "  8、查看當前系統連接數限制"
echo "======================================================="
read -p "$(echo -e "請選擇[1-8]：")" choose
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
        echo "請輸入正確的數字！"
        ;;
esac