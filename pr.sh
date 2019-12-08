string=''; for i in {0..31}; do string+=$(printf "%x" $(($RANDOM%16)) ); done; echo $string
echo $string

git checkout -b $string

echo $string > $string

git status

git add $string

git commit -m "Adding a test file to new_branch"

git push -u origin $string
