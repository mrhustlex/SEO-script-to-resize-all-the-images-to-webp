for f in *;
do
if [[ $f != *.sh ]]; then
  mv "$f" $(uuidgen | tr 'A-Z' 'a-z' | tr -d '\n'| cut -c1-8)."${f##*.}";
  fi
done

mkdir 10x;
mkdir 30x;
mkdir 50x;
for f in *
do
  IFS=''
  set -f
  # uuid=$(uuidgen | tr 'A-Z' 'a-z' | tr -d '\n'| cut -c1-8)
	# echo "convert - ${f%.*} to"
  if [[ $f != *.sh ]]; then
  cwebp -q 10 $(printf %q "$f") -o 10x/${f%.*}.webp
  cwebp -q 30 $(printf %q "$f") -o 30x/${f%.*}.webp
	cwebp -q 50 $(printf %q "$f") -o 50x/${f%.*}.webp
  fi
done
