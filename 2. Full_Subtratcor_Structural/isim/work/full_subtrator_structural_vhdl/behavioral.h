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

#ifndef H_Work_full_subtrator_structural_vhdl_behavioral_H
#define H_Work_full_subtrator_structural_vhdl_behavioral_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_full_subtrator_structural_vhdl_behavioral: public HSim__s6 {
public:

    HSim__s1 SE[5];

    HSim__s1 SA[5];
  char t9;
    Work_full_subtrator_structural_vhdl_behavioral(const char * name);
    ~Work_full_subtrator_structural_vhdl_behavioral();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
    void ConvFunc0(HSim__s2 * drv, const char * src, int noOfBytes, const HSimConstraints * srcConstraints);
    void ConvFunc1(HSim__s2 * drv, const char * src, int noOfBytes, const HSimConstraints * srcConstraints);
};



HSim__s6 *createWork_full_subtrator_structural_vhdl_behavioral(const char *name);

#endif
