# back up vimrc into github 

cp ~/.vimrc ./vimrc
git add ./vimrc
git commit -m"backup vimrc $(date)"
git push origin master
