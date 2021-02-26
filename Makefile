ARCH=-gencode arch=compute_60,code=compute_60 -gencode arch=compute_60,code=sm_60
OPTIONS=-O3 -use_fast_math

all:  proj

proj: src/*
	nvcc -g $(ARCH) $(OPTIONS) -w -std=c++11 -o proj \
		src/proj.cu \
		--compiler-options "-fopenmp" \
		-lcusparse -lnvToolsExt \
		-Isrc/ 

clean:
	rm -f proj
