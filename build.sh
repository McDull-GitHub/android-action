git clone https://github.com/geph-official/geph-android.git
cd geph-android
bash UPDATE-DAEMON.sh
chmod 755 gradlew
sed -i "s/io.geph.android/io.geph.android367/g" app/src/main/AndroidManifest.xml
./gradlew assemblereleaseAPK
apt install tree 
tree
