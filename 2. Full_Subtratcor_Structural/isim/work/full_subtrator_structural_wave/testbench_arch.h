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

#ifndef H_Work_full_subtrator_structural_wave_testbench_arch_H
#define H_Work_full_subtrator_structural_wave_testbench_arch_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_full_subtrator_structural_wave_testbench_arch: public HSim__s6 {
public:


HSim__s4 Vy;
HSimAccessVar VB;
HSim__s4 CF;
HSim__s4 CJ;
HSim__s4 CM;
    HSim__s1 SA[5];
    Work_full_subtrator_structural_wave_testbench_arch(const char * name);
    ~Work_full_subtrator_structural_wave_testbench_arch();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_full_subtrator_structural_wave_testbench_arch(const char *name);

#endif
