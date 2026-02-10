/*
 * Riccardo Antonello (riccardo.antonello@unipd.it)
 * 
 * December 09, 2025
 *
 * Dept. of Information Engineering, University of Padova 
 *
 */

#include "mex.h"
#include "lib/cobs.h"

/* MEX function entry point */
void mexFunction(int nlhs, mxArray *plhs[],
                 int nrhs, const mxArray *prhs[])
{
    uint8_T *src, *dst;
    uint8_T src_len;

    /* Check for proper number of input and output arguments */    
    if (nrhs != 1) {
        mexErrMsgIdAndTxt( "cobsEncode:invalidNumInputs",
                "One input argument required.");
    }
    if (nlhs > 1){
        mexErrMsgIdAndTxt( "cobsEncode:maxlhs",
                "Too many output arguments.");
    }

    /* Check data type of input argument */
    if (!(mxIsClass(prhs[0], "uint8"))) {
        mexErrMsgIdAndTxt( "cobsEncode:invalidInputType",
                "Input array must be of type uint8.");
    }
    
    /* Get the number of elements in the input argument */
    src_len = mxGetNumberOfElements(prhs[0]);
    
    /* Create matrix for the return argument */
    plhs[0] = mxCreateNumericMatrix(1, src_len+1, mxUINT8_CLASS, mxREAL);
    
    /*  get pointers to input and output arrays */
    src = (uint8_T *)mxGetData(prhs[0]);
    dst = (uint8_T *)mxGetData(plhs[0]);
    
    /*  perform COBS encoding */
    cobsEncode(src, src_len, dst);

}




