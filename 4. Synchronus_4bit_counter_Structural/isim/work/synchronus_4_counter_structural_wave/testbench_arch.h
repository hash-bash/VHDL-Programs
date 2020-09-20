////////////////////////////////////////////////////////////////////////////////
//   ____  ____   
//  /   /\/   /  
// /___/  \  /   
// \   \   \/  
//  \   \        Copyright (c) 2003-2004 Xilinx, Inc.
//  /   /        All Right Reserved. 
// /---/   /\     
// \   \  /  \  
//  \___\/\___\
////////////////////////////////////////////////////////////////////////////////

#ifndef H_Work_synchronus_4_counter_structural_wave_testbench_arch_H
#define H_Work_synchronus_4_counter_structural_wave_testbench_arch_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_synchronus_4_counter_structural_wave_testbench_arch: public HSim__s6 {
public:


HSim__s4 Vz;
HSimAccessVar VC;
HSim__s4 CG;
HSim__s4 CK;
HSim__s4 CN;
    HSim__s1 SA[3];
    Work_synchronus_4_counter_structural_wave_testbench_arch(const char * name);
    ~Work_synchronus_4_counter_structural_wave_testbench_arch();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_synchronus_4_counter_structural_wave_testbench_arch(const char *name);

#endif
