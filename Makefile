1_cipher: 1_cipher.c
	@gcc -o 1_cipher -lm 1_cipher.c

2_freqs: 2_freqs.c
	@gcc -o 2_freqs 2_freqs.c

3_magic_squares: 3_magic_squares.c
	@gcc -o 3_magic_squares 3_magic_squares.c

clean:
	@rm 1_cipher 2_freqs 3_magic_squares

test: 1_cipher 2_freqs 3_magic_squares 
	@bash tests.sh
