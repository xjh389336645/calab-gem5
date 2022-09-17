GEM5=/home/mingkai/Course/calab-gem5/gem5-stable
SRC=/home/mingkai/Course/calab-gem5/benchmark/mm
RESULT_DIR=/home/mingkai/Course/calab-gem5/lab3/result
TARGET=configs/example/se.py

rm -rf ${RESULT_DIR}/*

for REPL in RandomRP NMRURP LIPRP; do
    mkdir -p ${RESULT_DIR}/${REPL}
done

cd $GEM5

for REPL in RandomRP NMRURP LIPRP; do
    for ASSOC in 4 8 16;do
        build/X86/gem5.opt ${TARGET} --cmd=${SRC} --cpu-type=DerivO3CPU \
            --l1d_size=64kB --l1i_size=64kB --l1d_repl=${REPL} --l1d_assoc=${ASSOC} --caches \
            --l2_size=2MB --l2cache --l2_repl=${REPL} \
            --sys-clock=2GHz --cpu-clock=2GHz --mem-type=DDR3_1600_8x8
        cp -r m5out/ ${RESULT_DIR}/${REPL}/ASSOC_${ASSOC}/
    done
done