for f in ~/.env_setup
do
   test -s "$f" && source "$f"
done
