string=''; for i in {0..31}; do string+=$(printf "%x" $(($RANDOM%16)) ); done; echo $string
echo $string

git checkout -b $string

mkdir -p temp

echo $string > temp/$string

git status

git add .

git commit -m "Adding a test file to new_branch"

git push -u origin $string
