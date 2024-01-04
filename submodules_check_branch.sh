T=vim/pack/plugins/$1
for d in $(ls -1 $T);
do
  (
  cd "$T/$d/" &&
  echo "$d" &&
  # git branch && git symbolic-ref --short HEAD
  printf "%s %s\n" "$(git branch)" "$(git symbolic-ref --short HEAD)"
  )
done
