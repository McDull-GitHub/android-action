git clone https://github.com/geph-official/geph-android.git
sed -i "s/io.geph.android/io.geph.android367/g" `grep "io.geph.android" -rl geph-android`
mv geph-android/app/src/main/java/io/geph/android geph-android/app/src/main/java/io/geph/android367
cd geph-android
bash UPDATE-DAEMON.sh
chmod 755 gradlew
./gradlew assemblereleaseAPK
sudo apt install tree 
tree
ls -al app/build/outputs/apk/releaseApk/*.apk
