#define __STDC_WANT_IEC_60559_EXT__
#include <fenv.h>

static inline typeof(FE_DFL_ENV) fe_dfl_env()
{
    return FE_DFL_ENV;
}