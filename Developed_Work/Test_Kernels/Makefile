# test4DCT
test4DCT: test4DCT.c 
	gcc -I . lib/kernels.h lib/kernels.c test4DCT.c -o test4DCT -lm
# test8DCT
test8DCT: test8DCT.c 
	gcc -I . lib/kernels.h lib/kernels.c test8DCT.c -o test8DCT -lm
# test16DCT
test16DCT: test16DCT.c 
	gcc -I . lib/kernels.h lib/kernels.c test16DCT.c -o test16DCT -lm
# test32DCT
test32DCT: test32DCT.c 
	gcc -I . lib/kernels.h lib/kernels.c test32DCT.c -o test32DCT -lm	   
# test64DCT
test64DCT: test64DCT.c 
	gcc -I . lib/kernels.h lib/kernels.c test64DCT.c -o test64DCT -lm
clean: 
	$(RM) test4DCT test8DCT test16DCT test32DCT test64DCT