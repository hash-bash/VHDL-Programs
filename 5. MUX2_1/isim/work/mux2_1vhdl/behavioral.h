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

#ifndef H_Work_mux2_1vhdl_behavioral_H
#define H_Work_mux2_1vhdl_behavioral_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_mux2_1vhdl_behavioral: public HSim__s6 {
public:

    HSim__s1 SE[4];

    Work_mux2_1vhdl_behavioral(const char * name);
    ~Work_mux2_1vhdl_behavioral();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_mux2_1vhdl_behavioral(const char *name);

#endif
