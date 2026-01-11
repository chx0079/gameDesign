# 上传项目到 GitHub 仓库的说明

## 目标仓库
https://github.com/chx0079/gameDesign

## 快速开始

### 方法一：使用提供的 PowerShell 脚本（推荐）

1. **安装 Git**（如果还没有安装）
   - 访问 https://git-scm.com/download/win
   - 下载并安装，使用默认设置
   - 安装完成后重启 Cursor

2. **配置 Git 用户信息**（首次使用需要）
   ```powershell
   git config --global user.name "你的名字"
   git config --global user.email "你的邮箱"
   ```

3. **运行上传脚本**
   - 在 Cursor 终端中执行：
   ```powershell
   .\upload-to-github.ps1
   ```

### 方法二：手动执行命令

如果脚本无法运行，可以手动执行以下命令：

```powershell
# 1. 进入项目目录
cd c:\Users\woozie\test-website

# 2. 初始化 Git 仓库（如果还没有）
git init

# 3. 配置 Git 用户信息（首次使用需要）
git config --global user.name "你的名字"
git config --global user.email "你的邮箱"

# 4. 添加所有文件
git add .

# 5. 提交更改
git commit -m "Initial commit: 上传项目到 GitHub"

# 6. 添加远程仓库
git remote add origin https://github.com/chx0079/gameDesign.git

# 如果已经添加过远程仓库，使用以下命令更新：
# git remote set-url origin https://github.com/chx0079/gameDesign.git

# 7. 设置主分支
git branch -M main

# 8. 推送到 GitHub
git push -u origin main
```

## 认证问题

GitHub 现在要求使用 **Personal Access Token** 而不是密码进行认证。

### 创建 Personal Access Token

1. 访问 https://github.com/settings/tokens
2. 点击 "Generate new token" > "Generate new token (classic)"
3. 输入 token 名称（例如：`gameDesign-upload`）
4. 选择过期时间
5. **重要**：勾选 `repo` 权限（完整仓库访问权限）
6. 点击 "Generate token"
7. **复制 token**（只显示一次，请保存好）

### 使用 Token

当 Git 提示输入密码时，使用你创建的 Personal Access Token 而不是 GitHub 密码。

## 验证上传

上传成功后，访问 https://github.com/chx0079/gameDesign 应该能看到你的所有文件。

## 后续更新

当项目有更改后，使用以下命令更新 GitHub：

```powershell
git add .
git commit -m "描述你的更改"
git push
```

## 常见问题

### 问题 1：提示 "git 不是内部或外部命令"
- **解决**：需要先安装 Git，访问 https://git-scm.com/download/win

### 问题 2：提示 "remote origin already exists"
- **解决**：使用 `git remote set-url origin https://github.com/chx0079/gameDesign.git` 更新远程地址

### 问题 3：提示认证失败
- **解决**：使用 Personal Access Token 而不是密码，参考上面的"认证问题"部分

### 问题 4：PowerShell 脚本无法执行
- **解决**：可能需要设置执行策略，在管理员 PowerShell 中运行：
  ```powershell
  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
  ```
