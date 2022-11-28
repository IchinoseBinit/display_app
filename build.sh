echo "Enter your commit message"
read message

echo "Building your app"

flutter build apk --release 

mkdir -p ./gen/

mv ./build/app/outputs/flutter-apk/* ./gen/

git add .
git commit -m "$message"
git push origin main