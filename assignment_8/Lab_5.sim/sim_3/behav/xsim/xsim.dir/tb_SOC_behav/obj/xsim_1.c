/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_375(char*, char *);
extern void vlog_simple_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_895(char*, char *);
extern void execute_896(char*, char *);
extern void execute_897(char*, char *);
extern void execute_889(char*, char *);
extern void execute_890(char*, char *);
extern void execute_891(char*, char *);
extern void execute_892(char*, char *);
extern void execute_893(char*, char *);
extern void execute_4(char*, char *);
extern void execute_5(char*, char *);
extern void execute_380(char*, char *);
extern void execute_7(char*, char *);
extern void execute_9(char*, char *);
extern void execute_381(char*, char *);
extern void execute_14(char*, char *);
extern void execute_382(char*, char *);
extern void execute_16(char*, char *);
extern void execute_383(char*, char *);
extern void execute_384(char*, char *);
extern void execute_394(char*, char *);
extern void execute_395(char*, char *);
extern void execute_397(char*, char *);
extern void execute_399(char*, char *);
extern void execute_400(char*, char *);
extern void execute_401(char*, char *);
extern void execute_402(char*, char *);
extern void execute_406(char*, char *);
extern void execute_407(char*, char *);
extern void execute_409(char*, char *);
extern void execute_410(char*, char *);
extern void execute_411(char*, char *);
extern void execute_412(char*, char *);
extern void execute_413(char*, char *);
extern void execute_414(char*, char *);
extern void execute_415(char*, char *);
extern void execute_416(char*, char *);
extern void execute_417(char*, char *);
extern void execute_418(char*, char *);
extern void execute_419(char*, char *);
extern void execute_420(char*, char *);
extern void execute_421(char*, char *);
extern void execute_422(char*, char *);
extern void execute_423(char*, char *);
extern void execute_424(char*, char *);
extern void execute_425(char*, char *);
extern void execute_426(char*, char *);
extern void execute_427(char*, char *);
extern void execute_428(char*, char *);
extern void execute_429(char*, char *);
extern void execute_430(char*, char *);
extern void execute_431(char*, char *);
extern void execute_432(char*, char *);
extern void execute_433(char*, char *);
extern void execute_434(char*, char *);
extern void execute_435(char*, char *);
extern void execute_436(char*, char *);
extern void execute_437(char*, char *);
extern void execute_438(char*, char *);
extern void execute_439(char*, char *);
extern void execute_440(char*, char *);
extern void execute_441(char*, char *);
extern void execute_442(char*, char *);
extern void execute_443(char*, char *);
extern void execute_444(char*, char *);
extern void execute_445(char*, char *);
extern void execute_446(char*, char *);
extern void execute_447(char*, char *);
extern void execute_448(char*, char *);
extern void execute_449(char*, char *);
extern void execute_450(char*, char *);
extern void execute_451(char*, char *);
extern void execute_452(char*, char *);
extern void execute_385(char*, char *);
extern void execute_22(char*, char *);
extern void execute_23(char*, char *);
extern void execute_388(char*, char *);
extern void execute_26(char*, char *);
extern void execute_27(char*, char *);
extern void execute_29(char*, char *);
extern void execute_30(char*, char *);
extern void execute_389(char*, char *);
extern void execute_390(char*, char *);
extern void execute_391(char*, char *);
extern void execute_396(char*, char *);
extern void execute_36(char*, char *);
extern void execute_37(char*, char *);
extern void execute_39(char*, char *);
extern void execute_41(char*, char *);
extern void execute_46(char*, char *);
extern void execute_404(char*, char *);
extern void execute_48(char*, char *);
extern void execute_49(char*, char *);
extern void execute_405(char*, char *);
extern void execute_51(char*, char *);
extern void execute_52(char*, char *);
extern void execute_57(char*, char *);
extern void execute_453(char*, char *);
extern void execute_454(char*, char *);
extern void execute_455(char*, char *);
extern void execute_456(char*, char *);
extern void execute_457(char*, char *);
extern void execute_459(char*, char *);
extern void execute_460(char*, char *);
extern void execute_461(char*, char *);
extern void execute_462(char*, char *);
extern void execute_463(char*, char *);
extern void execute_464(char*, char *);
extern void execute_465(char*, char *);
extern void execute_466(char*, char *);
extern void execute_467(char*, char *);
extern void execute_469(char*, char *);
extern void execute_470(char*, char *);
extern void execute_471(char*, char *);
extern void execute_472(char*, char *);
extern void execute_473(char*, char *);
extern void execute_60(char*, char *);
extern void execute_62(char*, char *);
extern void execute_63(char*, char *);
extern void execute_475(char*, char *);
extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_877(char*, char *);
extern void execute_878(char*, char *);
extern void execute_879(char*, char *);
extern void execute_880(char*, char *);
extern void execute_881(char*, char *);
extern void execute_882(char*, char *);
extern void execute_883(char*, char *);
extern void execute_884(char*, char *);
extern void execute_885(char*, char *);
extern void execute_886(char*, char *);
extern void execute_887(char*, char *);
extern void execute_888(char*, char *);
extern void execute_71(char*, char *);
extern void execute_73(char*, char *);
extern void execute_74(char*, char *);
extern void execute_79(char*, char *);
extern void execute_80(char*, char *);
extern void execute_83(char*, char *);
extern void execute_84(char*, char *);
extern void execute_85(char*, char *);
extern void execute_476(char*, char *);
extern void execute_870(char*, char *);
extern void execute_871(char*, char *);
extern void execute_872(char*, char *);
extern void execute_873(char*, char *);
extern void execute_874(char*, char *);
extern void execute_875(char*, char *);
extern void execute_89(char*, char *);
extern void execute_91(char*, char *);
extern void execute_92(char*, char *);
extern void execute_479(char*, char *);
extern void execute_480(char*, char *);
extern void execute_481(char*, char *);
extern void execute_482(char*, char *);
extern void execute_483(char*, char *);
extern void execute_868(char*, char *);
extern void execute_496(char*, char *);
extern void execute_497(char*, char *);
extern void execute_498(char*, char *);
extern void execute_499(char*, char *);
extern void execute_484(char*, char *);
extern void execute_485(char*, char *);
extern void execute_101(char*, char *);
extern void execute_492(char*, char *);
extern void execute_364(char*, char *);
extern void execute_365(char*, char *);
extern void execute_377(char*, char *);
extern void execute_378(char*, char *);
extern void execute_379(char*, char *);
extern void execute_898(char*, char *);
extern void execute_899(char*, char *);
extern void execute_900(char*, char *);
extern void execute_901(char*, char *);
extern void execute_902(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[177] = {(funcp)execute_375, (funcp)vlog_simple_process_execute_0_fast_no_reg_no_agg, (funcp)execute_895, (funcp)execute_896, (funcp)execute_897, (funcp)execute_889, (funcp)execute_890, (funcp)execute_891, (funcp)execute_892, (funcp)execute_893, (funcp)execute_4, (funcp)execute_5, (funcp)execute_380, (funcp)execute_7, (funcp)execute_9, (funcp)execute_381, (funcp)execute_14, (funcp)execute_382, (funcp)execute_16, (funcp)execute_383, (funcp)execute_384, (funcp)execute_394, (funcp)execute_395, (funcp)execute_397, (funcp)execute_399, (funcp)execute_400, (funcp)execute_401, (funcp)execute_402, (funcp)execute_406, (funcp)execute_407, (funcp)execute_409, (funcp)execute_410, (funcp)execute_411, (funcp)execute_412, (funcp)execute_413, (funcp)execute_414, (funcp)execute_415, (funcp)execute_416, (funcp)execute_417, (funcp)execute_418, (funcp)execute_419, (funcp)execute_420, (funcp)execute_421, (funcp)execute_422, (funcp)execute_423, (funcp)execute_424, (funcp)execute_425, (funcp)execute_426, (funcp)execute_427, (funcp)execute_428, (funcp)execute_429, (funcp)execute_430, (funcp)execute_431, (funcp)execute_432, (funcp)execute_433, (funcp)execute_434, (funcp)execute_435, (funcp)execute_436, (funcp)execute_437, (funcp)execute_438, (funcp)execute_439, (funcp)execute_440, (funcp)execute_441, (funcp)execute_442, (funcp)execute_443, (funcp)execute_444, (funcp)execute_445, (funcp)execute_446, (funcp)execute_447, (funcp)execute_448, (funcp)execute_449, (funcp)execute_450, (funcp)execute_451, (funcp)execute_452, (funcp)execute_385, (funcp)execute_22, (funcp)execute_23, (funcp)execute_388, (funcp)execute_26, (funcp)execute_27, (funcp)execute_29, (funcp)execute_30, (funcp)execute_389, (funcp)execute_390, (funcp)execute_391, (funcp)execute_396, (funcp)execute_36, (funcp)execute_37, (funcp)execute_39, (funcp)execute_41, (funcp)execute_46, (funcp)execute_404, (funcp)execute_48, (funcp)execute_49, (funcp)execute_405, (funcp)execute_51, (funcp)execute_52, (funcp)execute_57, (funcp)execute_453, (funcp)execute_454, (funcp)execute_455, (funcp)execute_456, (funcp)execute_457, (funcp)execute_459, (funcp)execute_460, (funcp)execute_461, (funcp)execute_462, (funcp)execute_463, (funcp)execute_464, (funcp)execute_465, (funcp)execute_466, (funcp)execute_467, (funcp)execute_469, (funcp)execute_470, (funcp)execute_471, (funcp)execute_472, (funcp)execute_473, (funcp)execute_60, (funcp)execute_62, (funcp)execute_63, (funcp)execute_475, (funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_877, (funcp)execute_878, (funcp)execute_879, (funcp)execute_880, (funcp)execute_881, (funcp)execute_882, (funcp)execute_883, (funcp)execute_884, (funcp)execute_885, (funcp)execute_886, (funcp)execute_887, (funcp)execute_888, (funcp)execute_71, (funcp)execute_73, (funcp)execute_74, (funcp)execute_79, (funcp)execute_80, (funcp)execute_83, (funcp)execute_84, (funcp)execute_85, (funcp)execute_476, (funcp)execute_870, (funcp)execute_871, (funcp)execute_872, (funcp)execute_873, (funcp)execute_874, (funcp)execute_875, (funcp)execute_89, (funcp)execute_91, (funcp)execute_92, (funcp)execute_479, (funcp)execute_480, (funcp)execute_481, (funcp)execute_482, (funcp)execute_483, (funcp)execute_868, (funcp)execute_496, (funcp)execute_497, (funcp)execute_498, (funcp)execute_499, (funcp)execute_484, (funcp)execute_485, (funcp)execute_101, (funcp)execute_492, (funcp)execute_364, (funcp)execute_365, (funcp)execute_377, (funcp)execute_378, (funcp)execute_379, (funcp)execute_898, (funcp)execute_899, (funcp)execute_900, (funcp)execute_901, (funcp)execute_902, (funcp)vlog_transfunc_eventcallback};
const int NumRelocateId= 177;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/tb_SOC_behav/xsim.reloc",  (void **)funcTab, 177);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/tb_SOC_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void wrapper_func_0(char *dp)

{

}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/tb_SOC_behav/xsim.reloc");
	wrapper_func_0(dp);

	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/tb_SOC_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/tb_SOC_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/tb_SOC_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
