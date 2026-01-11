# 上传项目到 GitHub 的 PowerShell 脚本
# 目标仓库: https://github.com/chx0079/gameDesign

Write-Host "开始上传项目到 GitHub..." -ForegroundColor Green

# 检查 Git 是否安装
try {
    $gitVersion = git --version 2>&1
    Write-Host "Git 已安装: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "错误: 未检测到 Git！" -ForegroundColor Red
    Write-Host "请先安装 Git: https://git-scm.com/download/win" -ForegroundColor Yellow
    Write-Host "安装完成后，请重新运行此脚本。" -ForegroundColor Yellow
    exit 1
}

# 切换到项目目录
$projectPath = "c:\Users\woozie\test-website"
Set-Location $projectPath

# 检查是否已经是 Git 仓库
if (Test-Path ".git") {
    Write-Host "检测到现有 Git 仓库" -ForegroundColor Yellow
} else {
    Write-Host "初始化 Git 仓库..." -ForegroundColor Cyan
    git init
}

# 添加所有文件
Write-Host "添加文件到 Git..." -ForegroundColor Cyan
git add .

# 检查是否有未提交的更改
$status = git status --porcelain
if ($status) {
    Write-Host "提交更改..." -ForegroundColor Cyan
    git commit -m "Initial commit: 上传项目到 GitHub"
} else {
    Write-Host "没有需要提交的更改" -ForegroundColor Yellow
}

# 设置远程仓库
$remoteUrl = "https://github.com/chx0079/gameDesign.git"
Write-Host "设置远程仓库: $remoteUrl" -ForegroundColor Cyan

# 检查是否已有 origin 远程仓库
$existingRemote = git remote get-url origin 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "更新现有远程仓库地址..." -ForegroundColor Yellow
    git remote set-url origin $remoteUrl
} else {
    Write-Host "添加新的远程仓库..." -ForegroundColor Cyan
    git remote add origin $remoteUrl
}

# 设置主分支为 main
Write-Host "设置主分支为 main..." -ForegroundColor Cyan
git branch -M main

# 推送到 GitHub
Write-Host "推送到 GitHub..." -ForegroundColor Cyan
Write-Host "注意: 如果这是第一次推送，可能需要输入 GitHub 用户名和 Personal Access Token" -ForegroundColor Yellow
Write-Host "如果遇到认证问题，请访问: https://github.com/settings/tokens 创建 Personal Access Token" -ForegroundColor Yellow

git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n上传成功！" -ForegroundColor Green
    Write-Host "访问 https://github.com/chx0079/gameDesign 查看你的代码" -ForegroundColor Green
} else {
    Write-Host "`n推送失败，请检查错误信息" -ForegroundColor Red
    Write-Host "常见问题:" -ForegroundColor Yellow
    Write-Host "1. 需要配置 Git 用户信息: git config --global user.name '你的名字'" -ForegroundColor Yellow
    Write-Host "2. 需要配置 Git 邮箱: git config --global user.email '你的邮箱'" -ForegroundColor Yellow
    Write-Host "3. 需要 GitHub Personal Access Token (不是密码)" -ForegroundColor Yellow
}
