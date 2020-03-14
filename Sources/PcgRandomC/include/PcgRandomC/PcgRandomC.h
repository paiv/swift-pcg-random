#pragma once
#include <stdint.h>


struct pcg_random_s;
typedef struct pcg_random_s* pcg_random_t;


pcg_random_t
pcg_random(uint64_t seed);


void
pcg_random_free(pcg_random_t state);


uint64_t
pcg_random_next(pcg_random_t state);
