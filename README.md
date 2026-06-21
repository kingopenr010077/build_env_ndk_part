# build_env_ndk_part

Android NDK 29.0.14206865 离线构建环境分片包

## 说明

本仓库包含 Android NDK r29 (29.0.14206865) 的完整压缩包，因单个文件超过 100MB 限制，拆分为 8 个分片（aa-ah）。

合并后可得到完整的 NDK 压缩包（约 748MB）。

## 文件列表

| 文件 | 大小 |
|---|---|
| ndk-full.tar.gz.aa | 95MB |
| ndk-full.tar.gz.ab | 95MB |
| ndk-full.tar.gz.ac | 95MB |
| ndk-full.tar.gz.ad | 95MB |
| ndk-full.tar.gz.ae | 95MB |
| ndk-full.tar.gz.af | 95MB |
| ndk-full.tar.gz.ag | 95MB |
| ndk-full.tar.gz.ah | 83MB |

## 还原方法

```bash
# 1. 克隆本仓库
git clone https://github.com/kingopenr010077/build_env_ndk_part.git
cd build_env_ndk_part

# 2. 合并分片
cat ndk-full.tar.gz.* > ndk-full.tar.gz

# 3. 验证完整性
gzip -t ndk-full.tar.gz && echo "校验通过" || echo "校验失败"

# 4. 解压
tar xzf ndk-full.tar.gz

# 5. 设置环境变量
export ANDROID_NDK_HOME=$PWD/29.0.14206865
export PATH=$ANDROID_NDK_HOME:$PATH

# 6. 验证
ls $ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin/clang
```

## 一键还原脚本

```bash
#!/bin/bash
# restore.sh - 一键还原 NDK

echo "合并 NDK 分片中..."
cat ndk-full.tar.gz.* > ndk-full.tar.gz

echo "验证完整性..."
gzip -t ndk-full.tar.gz
if [ $? -ne 0 ]; then
    echo "❌ 文件校验失败！请重新克隆"
    exit 1
fi

echo "✅ 校验通过"
echo "解压中..."
tar xzf ndk-full.tar.gz

echo ""
echo "=== NDK 还原完成 ==="
echo "NDK 版本: 29.0.14206865"
echo "解压路径: $PWD/29.0.14206865"
echo ""
echo "请设置环境变量："
echo "  export ANDROID_NDK_HOME=$PWD/29.0.14206865"
echo "  export PATH=\$ANDROID_NDK_HOME:\$PATH"
```

## 相关仓库

- [build_env_android-part1](https://github.com/kingopenr010077/build_env_android-part1) - 离线构建环境 - 第一部分
- [build_env_android_part2](https://github.com/kingopenr010077/build_env_android_part2) - 离线构建环境 - 第二部分
- [build_env_base](https://github.com/kingopenr010077/build_env_base) - 方案A的 LFS 版
- [build_env_ndk](https://github.com/kingopenr010077/build_env_ndk) - NDK 的 LFS 版