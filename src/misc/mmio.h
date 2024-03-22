/* Copyright 2013-2015. The Regents of the University of California.
 * All rights reserved. Use of this source code is governed by
 * a BSD-style license which can be found in the LICENSE file.
 */

#include "misc/cppwrap.h"

#include <stddef.h>
extern _Bool mpi_shared_files;
extern void init_cfl_loop_desc(int D, const long loop_dims[__VLA(D)], long start_dims[__VLA(D)], unsigned long flags, int omp_threads, int index);
extern void set_cfl_loop_index(long index);
extern long get_cfl_loop_index(void);
extern _Bool cfl_loop_desc_active(void);
extern _Bool cfl_loop_omp(void);
extern long cfl_loop_worker_id(void);
extern long cfl_loop_num_workers(void);
extern long cfl_loop_desc_total(void);
extern long calc_size_cfl_loop(int D, const long dims[__VLA(D)], size_t size);

extern void* private_raw(size_t* size, const char* name);
extern void unmap_raw(const void* data, size_t size);

#ifndef MEMONLY_CFL
extern _Complex float* shared_cfl(int D, const long dims[__VLA(D)], const char* name);
extern _Complex float* private_cfl(int D, const long dims[__VLA(D)], const char* name);
#endif /* !MEMONLY_CFL */
extern void unmap_cfl(int D, const long dims[__VLA(D)], const _Complex float* x);

extern _Complex float* anon_cfl(const char* name, int D, const long dims[__VLA(D)]);
extern _Complex float* create_cfl(const char* name, int D, const long dimensions[__VLA(D)]);
extern _Complex float* load_cfl(const char* name, int D, long dimensions[__VLA(D)]);
extern _Complex float* load_shared_cfl(const char* name, int D, long dimensions[__VLA(D)]);

extern void create_multi_cfl(const char* name, int N, int D[__VLA(N)], const long* dimensions[__VLA(N)], _Complex float* args[__VLA(N)]);
extern int load_multi_cfl(const char* name, int N_max, int D_max, int D[__VLA(N_max)], long dimensions[__VLA(N_max)][D_max], _Complex float* args[__VLA(N_max)]);
extern void unmap_multi_cfl(int N, int D[__VLA(N)], const long* dimensions[__VLA(N)], _Complex float* args[__VLA(N)]);

extern float* create_coo(const char* name, int D, const long dimensions[__VLA(D)]);
extern float* load_coo(const char* name, int D, long dimensions[__VLA(D)]);
extern _Complex float* create_zcoo(const char* name, int D, const long dimensions[__VLA(D)]);
extern _Complex float* load_zcoo(const char* name, int D, long dimensions[__VLA(D)]);
extern _Complex float* create_zra(const char* name, int D, const long dims[__VLA(D)]);
extern _Complex float* load_zra(const char* name, int D, long dims[__VLA(D)]);
extern _Complex float* create_zshm(const char* name, int D, const long dims[__VLA(D)]);
extern _Complex float* load_zshm(const char* name, int D, long dims[__VLA(D)]);


#include "misc/cppwrap.h"
