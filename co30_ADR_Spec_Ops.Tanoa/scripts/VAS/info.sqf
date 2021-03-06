/*
Author:	ToxaBes
Description: Fill allowed weapons dialog
*/

private ["_display", "_title", "_head", "_ctrl", "_normalFont", "_bigFont"];

disableSerialization;
_display = uiNamespace getVariable['VAS_Info_Dispaly', displayNull];

_title = _display displayCtrl 7778;
_head = _display displayCtrl 7776;
_ctrl = _display displayCtrl 7777;

_normalFont = (safezoneH - 0.42) / 35;
_bigFont = _normalFont * 2.5;
_title ctrlsetfontheight _bigFont;
_head ctrlsetfontheight _normalFont;
_ctrl ctrlsetfontheight _normalFont;

_title ctrlSetText localize "STR_VAS_Info_Title";

_head lnbAddRow ["","Название",                "       Командир","Пулеметчик", "Ракетчик ПТ", "Пехотный Снайпер", "Снайпер","Медик", "Инженер", "Пилот"];

_ctrl lnbAddRow ["","TRG-21 EGLM 5.56 mm",     "             o", "       .",   "       .",    "           .",     "     .", "    o", "     o",  "    ."];
_ctrl lnbAddRow ["","Mk20 EGLM 5.56 mm",       "             o", "       .",   "       .",    "           .",     "     .", "    o", "     o",  "    ."];
_ctrl lnbAddRow ["","SPAR-16 GL 5.56 mm",      "             o", "       .",   "       .",    "           .",     "     .", "    o", "     o",  "    ."];
_ctrl lnbAddRow ["","CAR-95 GL 5.8 mm",        "             o", "       .",   "       .",    "           .",     "     .", "    o", "     o",  "    ."];
_ctrl lnbAddRow ["","Katiba GL 6.5 mm",        "             o", "       .",   "       .",    "           .",     "     .", "    o", "     o",  "    ."];
_ctrl lnbAddRow ["","MX 3GL 6.5 mm",           "             o", "       .",   "       .",    "           .",     "     .", "    o", "     o",  "    ."];
_ctrl lnbAddRow ["","AK-12 GL 7.62 mm",        "             o", "       .",   "       .",    "           .",     "     .", "    o", "     o",  "    ."];
_ctrl lnbAddRow ["","",                        "              ", "        ",   "        ",    "            ",     "      ", "     ", "      ",  "     "];
_ctrl lnbAddRow ["","SPAR-16S 5.56 mm",        "             .", "       o",   "       .",    "           .",     "     .", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","CAR-95-1 5.8mm",          "             .", "       o",   "       .",    "           .",     "     .", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","MX SW 6.5 mm",            "             .", "       o",   "       .",    "           .",     "     .", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","LIM-85 5.56 mm",          "             .", "       o",   "       .",    "           .",     "     .", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","Mk200 6.5 mm",            "             .", "       o",   "       .",    "           .",     "     .", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","Zafir 7.62 mm",           "             .", "       o",   "       .",    "           .",     "     .", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","SPMG .338",               "             .", "       o",   "       .",    "           .",     "     .", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","Navid 9.3 mm",            "             .", "       o",   "       .",    "           .",     "     .", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","",                        "              ", "        ",   "        ",    "            ",     "      ", "     ", "      ",  "     "];
_ctrl lnbAddRow ["","RPG-7",                   "             o", "       .",   "       o",    "           .",     "     .", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","PCML",                    "             o", "       .",   "       o",    "           .",     "     .", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","RPG-42 Alamut",           "             o", "       .",   "       o",    "           .",     "     .", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","",                        "              ", "        ",   "        ",    "            ",     "      ", "     ", "      ",  "     "];
_ctrl lnbAddRow ["","Titan MPRL Compact",      "             .", "       .",   "       o",    "           .",     "     .", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","Titan MPRL Launcher",     "             .", "       .",   "       o",    "           .",     "     .", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","",                        "              ", "        ",   "        ",    "            ",     "      ", "     ", "      ",  "     "];
_ctrl lnbAddRow ["","MXM 6.5 mm",              "             .", "       .",   "       .",    "           o",     "     .", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","CMR-76 6.5 mm",           "             .", "       .",   "       .",    "           o",     "     .", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","Rahim 7.62 mm",           "             .", "       .",   "       .",    "           o",     "     .", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","SPAR-17 7.62 mm",         "             .", "       .",   "       .",    "           o",     "     .", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","Mk14 7.62mm",             "             .", "       .",   "       .",    "           o",     "     .", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","Mk18 ABR 7.62 mm",        "             .", "       .",   "       .",    "           o",     "     .", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","Mk-I EMR 7.62mm",         "             .", "       .",   "       .",    "           o",     "     .", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","MAR-10 .338",             "             .", "       .",   "       .",    "           o",     "     .", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","Cyrus 9.3mm",             "             .", "       .",   "       .",    "           o",     "     .", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","ASP-1 Kir 12.7mm",        "             .", "       .",   "       .",    "           o",     "     .", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","",                        "              ", "        ",   "        ",    "            ",     "      ", "     ", "      ",  "     "];
_ctrl lnbAddRow ["","GM6 Lynx 12.7 mm",        "             .", "       .",   "       .",    "           .",     "     o", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","M320 LRR .408",           "             .", "       .",   "       .",    "           .",     "     o", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","",                        "              ", "        ",   "        ",    "            ",     "      ", "     ", "      ",  "     "];
_ctrl lnbAddRow ["","SDAR 5.56 mm",            "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    ."];
_ctrl lnbAddRow ["","AKS-74U 5.45 mm",         "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    ."];
_ctrl lnbAddRow ["","TRG-20 5.56 mm",          "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    ."];
_ctrl lnbAddRow ["","TRG-21 5.56 mm",          "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    ."];
_ctrl lnbAddRow ["","Mk20C 5.56 mm",           "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    ."];
_ctrl lnbAddRow ["","Mk20 5.56 mm",            "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    ."];
_ctrl lnbAddRow ["","AKM 7.62 mm",             "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    ."];
_ctrl lnbAddRow ["","SPAR-16 5.56 mm",         "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    ."];
_ctrl lnbAddRow ["","CAR-95 5.8 mm",           "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    ."];
_ctrl lnbAddRow ["","Katiba Carbine 6.5 mm",   "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    ."];
_ctrl lnbAddRow ["","Katiba 6.5 mm",           "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    ."];
_ctrl lnbAddRow ["","MXC 6.5 mm",              "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    ."];
_ctrl lnbAddRow ["","MX 6.5 mm",               "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    ."];
_ctrl lnbAddRow ["","Type 115 6.5 mm",         "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    ."];
_ctrl lnbAddRow ["","AK-12 7.62 mm",           "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    ."];
_ctrl lnbAddRow ["","",                        "              ", "        ",   "        ",    "            ",     "      ", "     ", "      ",  "     "];
_ctrl lnbAddRow ["","Protector 9 mm",          "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    o"];
_ctrl lnbAddRow ["","PDW2000 9 mm",            "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    o"];
_ctrl lnbAddRow ["","Sting 9 mm",              "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    o"];
_ctrl lnbAddRow ["","Vermin SMG .45 ACP",      "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    o"];
_ctrl lnbAddRow ["","",                        "              ", "        ",   "        ",    "            ",     "      ", "     ", "      ",  "     "];
_ctrl lnbAddRow ["","ACO",                     "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    o"];
_ctrl lnbAddRow ["","ACO SMG",                 "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    o"];
_ctrl lnbAddRow ["","MK17 Holosight",          "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    o"];
_ctrl lnbAddRow ["","Mk17 Holosight SMG",      "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    o"];
_ctrl lnbAddRow ["","ARCO 2x",                 "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    o"];
_ctrl lnbAddRow ["","RCO 2x",                  "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    o"];
_ctrl lnbAddRow ["","MRCO 2x",                 "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    o"];
_ctrl lnbAddRow ["","ERCO 2x",                 "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    o"];
_ctrl lnbAddRow ["","DMS 2-4x",                "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    o"];
_ctrl lnbAddRow ["","NVS 5x",                  "             o", "       o",   "       o",    "           o",     "     o", "    o", "     o",  "    o"];
_ctrl lnbAddRow ["","MOS 2.5-5x",              "             .", "       .",   "       .",    "           o",     "     o", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","AMS 3-10x",               "             .", "       .",   "       .",    "           o",     "     o", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","Kahlia 5-11x",            "             .", "       .",   "       .",    "           o",     "     o", "    .", "     .",  "    ."];
_ctrl lnbAddRow ["","LRPS 6-25x",              "             .", "       .",   "       .",    "           o",     "     o", "    .", "     .",  "    ."];


_ctrl lnbSetPicture [[0, 0], "\A3\weapons_F\Rifles\TRG20\data\UI\gear_trg21_gl_x_ca.paa"];
_ctrl lnbSetPicture [[1, 0], "\A3\weapons_f_beta\Rifles\MK20\Data\UI\gear_mk20_gl_x_ca.paa"];
_ctrl lnbSetPicture [[2, 0], "\A3\Weapons_F_Exp\Rifles\SPAR_01\Data\UI\arifle_SPAR_01_GL_khk_F_X_CA.paa"];
_ctrl lnbSetPicture [[3, 0], "\A3\Weapons_F_Exp\Rifles\CTAR\Data\UI\icon_arifle_CTAR_GL_blk_F_X_CA.paa"];
_ctrl lnbSetPicture [[4, 0], "\A3\weapons_F\Rifles\khaybar\data\UI\gear_khaybar_gl_x_ca.paa"];
_ctrl lnbSetPicture [[5, 0], "\A3\weapons_F\Rifles\mx\data\UI\gear_mx_rifle_gl_x_ca.paa"];
_ctrl lnbSetPicture [[6, 0], "\A3\Weapons_F_Exp\Rifles\AK12\Data\UI\icon_arifle_AK12_GL_F_X_CA.paa"];

_ctrl lnbSetPicture [[8, 0], "\A3\Weapons_F_Exp\Rifles\SPAR_02\Data\UI\arifle_SPAR_02_blk_F_X_CA.paa"];
_ctrl lnbSetPicture [[9, 0], "\A3\Weapons_F_Exp\Rifles\CTARS\Data\UI\icon_arifle_CTARS_blk_F_X_CA.paa"];
_ctrl lnbSetPicture [[10, 0], "\A3\weapons_F\Rifles\mx\data\UI\gear_mx_lmg_x_ca.paa"];
_ctrl lnbSetPicture [[11, 0], "\A3\Weapons_F_Exp\Machineguns\LMG_03\Data\UI\icon_LMG_03_F_X_CA.paa"];
_ctrl lnbSetPicture [[12, 0], "\A3\weapons_F\Machineguns\m200\data\UI\gear_m200_x_ca.paa"];
_ctrl lnbSetPicture [[13, 0], "\A3\weapons_f_beta\Machineguns\Zafir\Data\UI\gear_zafir_x_ca.paa"];
_ctrl lnbSetPicture [[14, 0], "\A3\Weapons_F_Mark\Machineguns\MMG_02\Data\UI\gear_MMG_02_sand_X_co.paa"];
_ctrl lnbSetPicture [[15, 0], "\A3\Weapons_F_Mark\Machineguns\MMG_01\Data\UI\gear_MMG_01_tan_X_co.paa"];

_ctrl lnbSetPicture [[17, 0], "\A3\Weapons_F_Exp\Launchers\RPG7\Data\UI\icon_launch_RPG7_F_X_CA.paa"];
_ctrl lnbSetPicture [[18, 0], "\A3\weapons_F\launchers\nlaw\data\UI\gear_nlaw_ca.paa"];
_ctrl lnbSetPicture [[19, 0], "\A3\weapons_F\launchers\rpg32\data\UI\gear_rpg32_x_ca.paa"];

_ctrl lnbSetPicture [[21, 0], "\A3\weapons_f_beta\Launchers\Titan\data\UI\gear_titan_short_ca.paa"];
_ctrl lnbSetPicture [[22, 0], "\A3\weapons_f_beta\Launchers\Titan\data\UI\gear_titan_ca.paa"];

_ctrl lnbSetPicture [[24, 0], "\A3\weapons_F\Rifles\mx\data\UI\gear_mx_dmr_x_ca.paa"];
_ctrl lnbSetPicture [[25, 0], "\A3\Weapons_F_Exp\LongRangeRifles\DMR_07\Data\UI\icon_srifle_DMR_07_blk_F_X_CA.paa"];
_ctrl lnbSetPicture [[26, 0], "\A3\weapons_f_epa\LongRangeRifles\DMR_01\data\UI\gear_dmr_01_x_ca.paa"];
_ctrl lnbSetPicture [[27, 0], "\A3\Weapons_F_Exp\Rifles\SPAR_03\Data\UI\arifle_SPAR_03_khk_F_X_CA.paa"];
_ctrl lnbSetPicture [[28, 0], "\A3\Weapons_F_Mark\LongRangeRifles\DMR_06\Data\UI\gear_DMR_06_camo_X_CA.paa"];
_ctrl lnbSetPicture [[29, 0], "\A3\weapons_F\longrangerifles\ebr\data\UI\gear_ebr_x_ca.paa"];
_ctrl lnbSetPicture [[30, 0], "\A3\Weapons_F_Mark\LongRangeRifles\DMR_03\Data\UI\gear_DMR_03_tan_X_CA.paa"];
_ctrl lnbSetPicture [[31, 0], "\A3\Weapons_F_Mark\LongRangeRifles\DMR_02\Data\UI\gear_DMR_02_camo_X_CA.paa"];
_ctrl lnbSetPicture [[32, 0], "\A3\Weapons_F_Mark\LongRangeRifles\DMR_05\Data\UI\gear_DMR_05_sniper_X_CA.paa"];
_ctrl lnbSetPicture [[33, 0], "\A3\Weapons_F_Mark\LongRangeRifles\DMR_04\Data\UI\gear_DMR_04_Tan_X_CA.paa"];

_ctrl lnbSetPicture [[35, 0], "\A3\weapons_f_bootcamp\LongRangeRifles\GM6_camo\data\UI\gear_gm6_x_ca.paa"];
_ctrl lnbSetPicture [[36, 0], "\A3\weapons_f_bootcamp\LongRangeRifles\M320_camo\Data\UI\gear_m320_lrr_x_ca.paa"];

_ctrl lnbSetPicture [[38, 0], "\A3\weapons_F\Rifles\sdar\data\UI\gear_sdar_x_ca.paa"];
_ctrl lnbSetPicture [[39, 0], "\A3\Weapons_F_Exp\Rifles\AKS\Data\UI\arifle_AKS_F_X_CA.paa"];
_ctrl lnbSetPicture [[40, 0], "\A3\weapons_F\Rifles\TRG20\data\UI\gear_trg20_x_ca.paa"];
_ctrl lnbSetPicture [[41, 0], "\A3\weapons_F\Rifles\TRG20\data\UI\gear_trg21_x_ca.paa"];
_ctrl lnbSetPicture [[42, 0], "\A3\weapons_f_beta\Rifles\MK20\Data\UI\gear_mk20_c_x_ca.paa"];
_ctrl lnbSetPicture [[43, 0], "\A3\weapons_f_beta\Rifles\MK20\Data\UI\gear_mk20_x_ca.paa"];
_ctrl lnbSetPicture [[44, 0], "\A3\Weapons_F_Exp\Rifles\AKM\Data\UI\arifle_AKM_F_X_CA.paa"];
_ctrl lnbSetPicture [[45, 0], "\A3\Weapons_F_Exp\Rifles\SPAR_01\Data\UI\arifle_SPAR_01_khk_F_X_CA.paa"];
_ctrl lnbSetPicture [[46, 0], "\A3\Weapons_F_Exp\Rifles\CTAR\Data\UI\icon_arifle_CTAR_blk_F_X_CA.paa"];
_ctrl lnbSetPicture [[47, 0], "\A3\weapons_F\Rifles\khaybar\data\UI\gear_khaybarc_x_ca.paa"];
_ctrl lnbSetPicture [[48, 0], "\A3\weapons_F\Rifles\khaybar\data\UI\gear_khaybar_x_ca.paa"];
_ctrl lnbSetPicture [[49, 0], "\A3\weapons_F\Rifles\mx\data\UI\gear_mx_cqc_x_ca.paa"];
_ctrl lnbSetPicture [[50, 0], "\A3\weapons_F\Rifles\mx\data\UI\gear_mx_rifle_x_ca.paa"];
_ctrl lnbSetPicture [[51, 0], "\A3\Weapons_F_Exp\Rifles\ARX\Data\UI\arifle_ARX_blk_F_X_CA.paa"];
_ctrl lnbSetPicture [[52, 0], "\A3\Weapons_F_Exp\Rifles\AK12\Data\UI\icon_arifle_AK12_F_X_CA.paa"];

_ctrl lnbSetPicture [[54, 0], "\A3\Weapons_F_Exp\SMGs\SMG_05\Data\UI\icon_SMG_05_F_X_CA.paa"];
_ctrl lnbSetPicture [[55, 0], "\A3\weapons_f_gamma\SMGs\pdw2000\data\UI\gear_pdw2x_x_ca.paa"];
_ctrl lnbSetPicture [[56, 0], "\A3\weapons_f_beta\SMGs\SMG_02\Data\UI\gear_smg_02_x_ca.paa"];
_ctrl lnbSetPicture [[57, 0], "\A3\weapons_f_beta\SMGs\SMG_01\data\UI\gear_smg_01_x_ca.paa"];

_ctrl lnbSetPicture [[59, 0], "\A3\weapons_F\Data\UI\gear_acco_aco_CA.paa"];
_ctrl lnbSetPicture [[60, 0], "\A3\weapons_F\Data\UI\gear_acco_aco_CA.paa"];
_ctrl lnbSetPicture [[61, 0], "\A3\weapons_F\Data\UI\gear_acco_EOTxps3_CA.paa"];
_ctrl lnbSetPicture [[62, 0], "\A3\weapons_F\Data\UI\gear_acco_EOTxps3_CA.paa"];
_ctrl lnbSetPicture [[63, 0], "\A3\weapons_F\Data\UI\gear_acco_Arco_CA.paa"];
_ctrl lnbSetPicture [[64, 0], "\A3\weapons_F\Data\UI\gear_acco_hamr_CA.paa"];
_ctrl lnbSetPicture [[65, 0], "\A3\weapons_F_beta\Data\UI\gear_acco_MRCO_CA.paa"];
_ctrl lnbSetPicture [[66, 0], "\A3\Weapons_F_Exp\Acc\Data\UI\icon_optic_ERCO_khk_F_ca.paa"];
_ctrl lnbSetPicture [[67, 0], "\A3\weapons_f_epa\Acc\data\UI\gear_acco_dms_ca.paa"];
_ctrl lnbSetPicture [[68, 0], "\A3\weapons_F\Data\UI\gear_acco_NVS_CA.paa"];
_ctrl lnbSetPicture [[69, 0], "\A3\weapons_F\Data\UI\gear_acco_Sniper_CA.paa"];
_ctrl lnbSetPicture [[70, 0], "\A3\Weapons_F_Mark\Data\UI\gear_acco_ams_blk_CA.paa"];
_ctrl lnbSetPicture [[71, 0], "\A3\Weapons_F_Mark\Data\UI\gear_acco_khs_blk_CA.paa"];
_ctrl lnbSetPicture [[72, 0], "\A3\Weapons_F_EPB\Acc\Data\UI\gear_acco_sniper02_CA.paa"];

VAS_blur = ppEffectCreate ["DynamicBlur", 401];
VAS_blur ppEffectEnable true;
VAS_blur ppEffectAdjust [1.5];
VAS_blur ppEffectCommit 0;
