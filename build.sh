rm -rf out
rm -rf zip
git clone https://github.com/arter97/arm64-gcc ~/toolchain
export ARCH=arm64
export CROSS_COMPILE=~/toolchain/bin/aarch64-elf-
mkdir out
make O=out clean
make O=out mrproper
make -C $(pwd) O=out Fox_ysl_defconfig
make -j32 -C $(pwd) O=out
git clone https://github.com/ItsVixano/AnyKernel3 -b ysl-aosp zip
cp -r out/arch/arm64/boot/Image.gz-dtb zip/
cd zip
mv Image.gz-dtb zImage
zip -r Fox_kernel_V4-oc.zip *
