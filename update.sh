

rm -rf docs/*

hugo

cd docs

git add --all

git commit -m 'update'

git push origin master

cd ..



