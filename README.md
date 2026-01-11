# 测试网站

一个简单的静态网站，用于 Zeabur 部署测试。

## 部署到 Zeabur

1. 将代码推送到 GitHub/GitLab/Bitbucket 等 Git 仓库
2. 登录 [Zeabur](https://zeabur.com)
3. 点击 "New Project"
4. 选择你的 Git 仓库
5. Zeabur 会自动检测到这是一个静态网站并部署
6. 如果自动检测失败，手动选择 "Static Site" 类型

## 本地运行

```bash
npm install
npm start
```

然后在浏览器打开 http://localhost:3000
