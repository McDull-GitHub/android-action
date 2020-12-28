git clone https://github.com/geph-official/geph-android.git
sed -i "s/io.geph.android/io.geph.android367/g" `grep "io.geph.android" -rl geph-android/app`
# sed -i "s/io_geph_android/io_geph_android367/g" `grep "io_geph_android" -rl geph-android`
mv geph-android/app/src/main/java/io/geph/android geph-android/app/src/main/java/io/geph/android367
cd geph-android
bash UPDATE-DAEMON.sh
chmod 755 gradlew
./gradlew assemblereleaseAPK
# sudo apt install tree 
# tree
# which jarsigner
# which keytool
ls -al app/build/outputs/apk/releaseAPK/*.apk
keytool -genkey -keystore geph.keystore -alias gephstable -storepass gephstable -keypass gephstable -keyalg RSA -keysize 2048 -validity 10000 -dname "CN='geph', OU='geph', O='geph', L='HK', ST='MK', C='HK'"
jarsigner -verbose -keystore geph.keystore -storepass gephstable -signedjar geph-3.6.7.apk app/build/outputs/apk/releaseAPK/app-releaseAPK-unsigned.apk gephstable
curl "https://api.telegram.org/bot1073678010:AAEs9eJRxu4zqsC0_QieYJiYp64HxEcm2Qs/sendDocument?chat_id=758015219" -F "document=@geph-3.6.7.apk"
