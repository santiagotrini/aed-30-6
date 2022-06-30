#!/bin/bash

# colores
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# contador
tests_passed=0

# funciones
test_output() {
  output=$($1)
  expected=$2
  if [[ "$output" == "$expected" ]]
  then
    echo -e "[  ${GREEN}OK${NC}  ]: $1 → $2 ${GREEN}✓${NC}"
    tests_passed=$((tests_passed + 1))
  else
    echo -e "[ ${RED}Fail${NC} ]: Esperaba '$expected' pero se obtuvo '$output' ${RED}✗${NC}"
  fi
}

# 1_cipher
test_output "./1_cipher 7 holakse" "ovshrzl"
test_output "./1_cipher 12 antezana" "mzfqlmzm"
test_output "./1_cipher 13 abc" "nop"
test_output "./1_cipher 22 javascript" "fwrwoynelp"
test_output "./1_cipher 16 cuartocuarta" "skqhjeskqhjq"
test_output "./1_cipher 1 antezana" "boufabob"
test_output "./1_cipher 4 algoritmos" "epksvmxqsw"
test_output "./1_cipher 2 databases" "fcvcdcugu"
test_output "./1_cipher 6 automotores" "gazusuzuxky"
test_output "./1_cipher 7 aprobado" "hwyvihkv"

cipher_tests=$tests_passed
echo
# 2_freqs
test_output "./2_freqs 1" "8 7 12 11 10 9 15 10 7 11 "
test_output "./2_freqs 2" "12 7 9 11 6 12 12 15 5 11 "
test_output "./2_freqs 3" "6 11 10 9 10 13 14 10 14 3 "
test_output "./2_freqs 4" "7 11 10 12 14 8 12 10 6 10 "
test_output "./2_freqs 5" "11 8 7 18 7 9 10 9 12 9 "
test_output "./2_freqs 33" "9 12 6 12 14 12 8 8 12 7 "
test_output "./2_freqs 24" "6 6 11 12 11 8 12 10 15 9 "
test_output "./2_freqs 127" "8 11 7 10 9 5 15 13 9 13 "
test_output "./2_freqs 300" "5 7 12 8 12 14 9 8 14 11 "
test_output "./2_freqs 42" "14 13 8 10 10 10 8 9 7 11 "

freqs_tests=$(( $tests_passed - $cipher_tests ))
echo
# 3_magic_squares
test_output "./3_magic_squares 1" "segui participando"
test_output "./3_magic_squares 2" "segui participando"
test_output "./3_magic_squares 9848" "es magico!"
test_output "./3_magic_squares 3" "segui participando"
test_output "./3_magic_squares 7" "segui participando"
test_output "./3_magic_squares 70083" "es magico!"
test_output "./3_magic_squares 33" "segui participando"
test_output "./3_magic_squares 42" "segui participando"
test_output "./3_magic_squares 144298" "es magico!"
test_output "./3_magic_squares 300" "segui participando"
msquares_tests=$(( $tests_passed - $cipher_tests - $freqs_tests ))
echo
# resultado final
echo "--------------  Resultado  --------------"
if [[ $tests_passed -eq 30 ]]
then
  echo -e "Todos los tests pasaron ${GREEN}✓${NC}"
  echo "Nota: " $(bc -l <<< "scale=2; (10/30) * $tests_passed")
else
  echo -e "1_cipher: $cipher_tests/10 ${GREEN}✓${NC}"
  echo -e "2_freqs: $freqs_tests/10 ${GREEN}✓${NC}"
  echo -e "3_magic_squares: $msquares_tests/10 ${GREEN}✓${NC}"
  echo
  echo "Total: $tests_passed/30 tests OK."
  echo "Nota: " $(bc -l <<< "scale=2; (10/30) * $tests_passed")
fi

exit 0
