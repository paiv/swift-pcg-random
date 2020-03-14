#include "pcg_random.hpp"
extern "C" {
#include "PcgRandomC/PcgRandomC.h"
}


struct pcg_random_s {
    pcg64 pcg;
};


pcg_random_s*
pcg_random(uint64_t seed) {
    pcg_random_s* state = new pcg_random_s;
    state->pcg = pcg64(seed);
    return state;
}


void
pcg_random_free(pcg_random_s* state) {
    delete state;
}


uint64_t
pcg_random_next(pcg_random_s* state) {
    return state->pcg();
}
