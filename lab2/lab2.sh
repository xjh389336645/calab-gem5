GEM5=/home/mingkai/Course/calab-gem5/gem5-stable
SRC_DIR=/home/mingkai/Course/calab-gem5/benchmark
RESULT_DIR=/home/mingkai/Course/calab-gem5/lab2/result
TARGET8=configs/example/se.py
TARGET2=configs/example/se_width2.py

# Clean result dir
rm -rf ${RESULT_DIR}/*
for FILE in lfsr merge mm sieve spmv; do
    mkdir -p ${RESULT_DIR}/${FILE}
done

cd $GEM5

for FILE in lfsr merge mm sieve spmv; do
    # config1: O3CPU issue_witdth:8 1GHz L2:No
    # DDR3_1600_8x8 l1i:64kb l1d:64kb
    build/X86/gem5.opt ${TARGET8} --cmd=${SRC_DIR}/${FILE} --cpu-type=DerivO3CPU \
        --l1d_size=64kB --l1i_size=64kB --caches\
        --sys-clock=1GHz --cpu-clock=1GHz --mem-type=DDR3_1600_8x8
    cp -r m5out/ ${RESULT_DIR}/${FILE}/config1/

    # config2: MinorCPU issue_witdth:8 1GHz L2:No
    # DDR3_1600_8x8 l1i:64kb l1d:64kb
    build/X86/gem5.opt ${TARGET8} --cmd=${SRC_DIR}/${FILE} --cpu-type=MinorCPU \
        --l1d_size=64kB --l1i_size=64kB --caches\
        --sys-clock=1GHz --cpu-clock=1GHz --mem-type=DDR3_1600_8x8
    cp -r m5out/ ${RESULT_DIR}/${FILE}/config2/

    # config3: O3CPU issue_witdth:2 1GHz L2:No
    # DDR3_1600_8x8 l1i:64kb l1d:64kb
    build/X86/gem5.opt ${TARGET2} --cmd=${SRC_DIR}/${FILE} --cpu-type=DerivO3CPU \
        --l1d_size=64kB --l1i_size=64kB --caches\
        --sys-clock=1GHz --cpu-clock=1GHz --mem-type=DDR3_1600_8x8
    cp -r m5out/ ${RESULT_DIR}/${FILE}/config3/

    # config4: O3CPU issue_witdth:8 4GHz L2:No
    # DDR3_1600_8x8 l1i:64kb l1d:64kb
    build/X86/gem5.opt ${TARGET8} --cmd=${SRC_DIR}/${FILE} --cpu-type=DerivO3CPU \
        --l1d_size=64kB --l1i_size=64kB --caches\
        --sys-clock=4GHz --cpu-clock=4GHz --mem-type=DDR3_1600_8x8
    cp -r m5out/ ${RESULT_DIR}/${FILE}/config4/

    # config5: O3CPU issue_witdth:8 1GHz L2:256kB
    # DDR3_1600_8x8 l1i:64kb l1d:64kb
    build/X86/gem5.opt ${TARGET8} --cmd=${SRC_DIR}/${FILE} --cpu-type=DerivO3CPU \
        --l1d_size=64kB --l1i_size=64kB --caches --l2_size=256kB --l2cache \
        --sys-clock=1GHz --cpu-clock=1GHz --mem-type=DDR3_1600_8x8
    cp -r m5out/ ${RESULT_DIR}/${FILE}/config5/

    # config6: O3CPU issue_witdth:8 1GHz L2:2MB
    # DDR3_1600_8x8 l1i:64kb l1d:64kb
    build/X86/gem5.opt ${TARGET8} --cmd=${SRC_DIR}/${FILE} --cpu-type=DerivO3CPU \
        --l1d_size=64kB --l1i_size=64kB --caches --l2_size=2MB --l2cache \
        --sys-clock=1GHz --cpu-clock=1GHz --mem-type=DDR3_1600_8x8
    cp -r m5out/ ${RESULT_DIR}/${FILE}/config6/

    # config7: O3CPU issue_witdth:8 1GHz L2:16MB
    # DDR3_1600_8x8 l1i:64kb l1d:64kb
    build/X86/gem5.opt ${TARGET8} --cmd=${SRC_DIR}/${FILE} --cpu-type=DerivO3CPU \
        --l1d_size=64kB --l1i_size=64kB --caches --l2_size=16MB --l2cache \
        --sys-clock=1GHz --cpu-clock=1GHz --mem-type=DDR3_1600_8x8
    cp -r m5out/ ${RESULT_DIR}/${FILE}/config7/
done