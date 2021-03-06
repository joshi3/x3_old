echo $1
rootdirectory="$PWD"
# ---------------------------------

dirs="bionic hardware/interfaces frameworks/av system/core"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying $dir patches..."
	git apply $rootdirectory/device/leeco/x3/patches/$dir/*.patch
	echo " "
done

# -----------------------------------
echo "Changing to build directory..."
cd $rootdirectory
