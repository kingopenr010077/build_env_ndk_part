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