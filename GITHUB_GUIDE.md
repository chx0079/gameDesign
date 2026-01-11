# 将项目上传到 GitHub 的完整指南

## 前提条件

### 1. 安装 Git

1. 访问 [Git 官网](https://git-scm.com/download/win) 下载 Windows 版本
2. 运行安装程序，使用默认设置
3. 安装完成后，重启命令行或 Cursor 编辑器

### 2. 创建 GitHub 账户（如果还没有）

1. 访问 [GitHub.com](https://github.com)
2. 注册新账户（如果还没有）

---

## 方法一：使用命令行（推荐）

### 步骤 1：在 GitHub 上创建新仓库

1. 登录 GitHub
2. 点击右上角的 "+" 号，选择 "New repository"
3. 输入仓库名称（例如：`test-website`）
4. 选择 "Public" 或 "Private"
5. **不要**勾选 "Initialize this repository with a README"（因为我们已经有了）
6. 点击 "Create repository"

### 步骤 2：初始化本地 Git 仓库

打开 Cursor 的终端（`` Ctrl+` ``），然后执行以下命令：

```bash
# 初始化 Git 仓库
git init

# 配置 Git 用户信息（如果第一次使用，只需要配置一次）
git config --global user.name "你的用户名"
git config --global user.email "你的邮箱"

# 添加所有文件到 Git
git add .

# 提交文件
git commit -m "Initial commit"

# 添加远程仓库（将 YOUR_USERNAME 和 YOUR_REPO 替换为你的实际值）
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git

# 推送代码到 GitHub
git branch -M main
git push -u origin main
```

**注意**：在执行 `git remote add origin` 时，将 `YOUR_USERNAME` 和 `YOUR_REPO` 替换为：
- `YOUR_USERNAME`：你的 GitHub 用户名
- `YOUR_REPO`：你创建的仓库名称

例如，如果你的 GitHub 用户名是 `zhangsan`，仓库名是 `test-website`，则命令为：
```bash
git remote add origin https://github.com/zhangsan/test-website.git
```

---

## 方法二：使用 GitHub Desktop（图形界面，更简单）

### 步骤 1：下载 GitHub Desktop

1. 访问 [GitHub Desktop 官网](https://desktop.github.com/)
2. 下载并安装

### 步骤 2：登录 GitHub Desktop

1. 打开 GitHub Desktop
2. 登录你的 GitHub 账户

### 步骤 3：添加本地仓库

1. 在 GitHub Desktop 中，点击 "File" > "Add local repository"
2. 选择你的项目文件夹（`C:\Users\woozie\test-website`）
3. 如果提示这不是一个 Git 仓库，点击 "create a repository"

### 步骤 4：发布到 GitHub

1. 点击 "Publish repository" 按钮
2. 输入仓库名称
3. 选择是否公开（Public/Private）
4. 点击 "Publish repository"

---

## 方法三：使用 GitHub 网页上传（最简单但不推荐用于后续开发）

1. 在 GitHub 上创建新仓库
2. 点击 "uploading an existing file"
3. 拖拽所有文件到网页
4. 点击 "Commit changes"

**注意**：这种方法只适合一次性上传，后续更新代码需要使用 Git 命令。

---

## 推送代码后的验证

上传成功后，访问 `https://github.com/YOUR_USERNAME/YOUR_REPO` 应该能看到你的所有文件。

## 后续更新代码

当项目有更改后，使用以下命令更新 GitHub：

```bash
git add .
git commit -m "描述你的更改"
git push
```

## 常见问题

### 问题 1：需要输入用户名和密码

如果使用 HTTPS 方式，GitHub 现在要求使用 Personal Access Token 而不是密码：
1. 访问 GitHub Settings > Developer settings > Personal access tokens > Tokens (classic)
2. 生成新 token，勾选 `repo` 权限
3. 使用 token 作为密码

**更推荐**：使用 GitHub Desktop 或配置 SSH 密钥，可以避免这个问题。

### 问题 2：提示 "fatal: not a git repository"

说明当前目录还不是 Git 仓库，需要先执行 `git init`

### 问题 3：提示 "remote origin already exists"

说明已经添加过远程仓库了，可以使用：
```bash
git remote set-url origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
```
来更新远程仓库地址
