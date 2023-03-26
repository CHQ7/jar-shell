
<h1 align="center" style="margin: 30px 0 30px; font-weight: bold;">
jar-shell
</h1>
<h4 align="center">Linux下的shell脚本，可以针对java可执行jar文件进行启动，停止，重启等操作
</h4>

## 使用方式

```sh
./脚本名称 [start|stop|restart|status]
```
## 参数说明

- `start` - 启动Java程序
- `stop` - 停止Java程序
- `restart` - 重启Java程序
- `status` - 检查Java程序运行状态

## 安装要求

- 已安装Java环境

## 使用前准备

1. 这里是列表文本将脚本复制到需要启动Java程序的目录下
2. 这里是列表文本这里是列表文本确保Java程序已经被打包成.jar文件并保存在该目录下

## 示例

启动Java程序：

```sh
./脚本名称 start
```

停止Java程序：

```sh
./脚本名称 stop
```

重启Java程序：

```sh
./脚本名称 restart
```

检查Java程序运行状态：

```sh
./脚本名称 status
```

## 可能存在的问题

- Java环境未安装
- Java程序未被正确打包成.jar文件

## 如何贡献

非常欢迎你的加入！[提一个 Issue](https://gitee.com/cdchiconysquare/csms/issues) 或者提交一个 Pull Request。

**Pull Request:**

1. Fork 代码!
2. 创建自己的分支: `git checkout -b feat/xxxx`
3. 提交你的修改: `git commit -am 'feat(function): add xxxxx'`
4. 推送您的分支: `git push origin feat/xxxx`
5. 提交`pull request`

## Git 贡献提交规范

- 参考 [vue](https://github.com/vuejs/vue/blob/dev/.github/COMMIT_CONVENTION.md) 规范 ([Angular](https://github.com/conventional-changelog/conventional-changelog/tree/master/packages/conventional-changelog-angular))

    - `feat` 增加新功能
    - `fix` 修复问题/BUG
    - `style` 代码风格相关无影响运行结果的
    - `perf` 优化/性能提升
    - `refactor` 重构
    - `revert` 撤销修改
    - `test` 测试相关
    - `docs` 文档/注释
    - `chore` 依赖更新/脚手架配置修改等
    - `workflow` 工作流改进
    - `ci` 持续集成
    - `types` 类型定义文件更改
    - `wip` 开发中





