src_dir=$(pwd)
for i in 1 2 4 6
do
	cp $src_dir/common/crt.S $src_dir/crt_aux.S
	sed 's/  li a1, 1#NCORES-param/  li a1, '"$i"'#NCORES-param/' <$src_dir/crt_aux.S >$src_dir/common/crt.S
	make NCORES=$i copy 
	#sleep 5
	mv $src_dir/crt_aux.S $src_dir/common/crt.S
done
