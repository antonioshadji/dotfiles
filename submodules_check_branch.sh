T=vim/pack/plugins/opt
for d in $(ls -1 $T);
do
  (
  cd $T/$d/ &&
  echo "$d" &&
  git branch && git symbolic-ref --short HEAD
  )
done
