#!/bin/bash
# chkconfig: 2345 85 15
# description:auto_run


# 设置颜色常量
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 检查脚本是否以root身份运行
if [ "$(id -u)" -ne 0 ]; then
    echo -e "${RED}Error: This script must be run as root.${NC}"
    exit 1
fi

# 检查Java环境
if ! command -v java > /dev/null; then
    echo -e "${RED}Error: Java environment not found.${NC}"
    exit 1
fi

# 获取程序目录
APP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# 获取程序文件名，支持多个符合条件的文件
APP_NAME=$(ls "$APP_DIR"/*.jar 2>/dev/null | xargs -n1 basename | grep '\.jar$' | head -n 1)

# 检查是否存在程序文件
if [ -z "$APP_NAME" ]; then
    echo -e "${RED}Error: No jar files found in $APP_DIR${NC}"
    exit 1
fi

# 检查是否存在多个程序文件
if [ $(ls "$APP_DIR"/*.jar 2>/dev/null | wc -l) -gt 1 ]; then
    echo -e "${RED}Error: Multiple jar files found in $APP_DIR${NC}"
    echo -e "${YELLOW}Tip: $(ls "$APP_DIR"/*.jar | xargs -n1 basename)${NC}"
    exit 1
fi

# 检查程序是否在运行
is_running() {
    pid=$(ps -ef | grep "$APP_NAME" | grep -v grep | awk '{print $2}')
    if [ -z "$pid" ]; then
        return 1
    else
        return 0
    fi
}

# 启动程序
start() {
    is_running && { echo -e "${YELLOW}Warning: $APP_NAME is already running. (pid=$pid)${NC}"; return; }
    nohup java -jar "$APP_NAME" > /dev/null 2>&1 &
    echo -e "${GREEN}$APP_NAME start success.${NC}"
}

# 停止程序
stop() {
    is_running || { echo -e "${YELLOW}Warning: $APP_NAME is not running.${NC}"; return; }
    kill -9 "$pid"
    echo -e "${GREEN}$APP_NAME stop success.${NC}"
}


# 输出运行状态
status() {
    if is_running; then
        echo -e "${GREEN}Running: $APP_NAME (pid=$pid)${NC}"
    else
        echo -e "${YELLOW}Stopped: $APP_NAME${NC}"
    fi
}


# 重启程序
restart() {
    stop
    start
}

# 根据输入参数，选择执行对应方法，不输入则执行使用说明
case "$1" in
    start)
        start;;
    stop)
        stop;;
    status)
        status;;
    restart)
        restart;;
    *)
        echo -e "${YELLOW}Usage: $(basename "$0") [start|stop|restart|status]${NC}"
        exit 1;;
esac
