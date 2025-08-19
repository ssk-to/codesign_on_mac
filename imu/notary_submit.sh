filename=$1
EXT="${filename##*.}"
echo Filenme: $1

if [ "${EXT}" = "zip" ]; then
  xcrun notarytool submit $1 --keychain-profile "notarytool_for_imucalib" --wait
else
  echo "Error; Not zip file!"
fi
