import mods.modularmachinery.RecipeBuilder;
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "dream_energy_core_make",
    "me_mythic_assembler",
    // inputs
    [
        <draconicevolution:energy_storage_core>*1,
        <actuallyadditions:item_misc:19>*64,
        <contenttweaker:terrasteel_crystal>*32,
        <extrabotany:material:7>*64,
        <extrabotany:spiritfuel>*640,
        <contenttweaker:bloodmaster_block>*1024,
        <contenttweaker:spinel_ring>*256
    ],
    // fluid inputs
    [
        <liquid:eternal_dragon_fire>*32768000
    ],
    // outputs
    [<modularmachinery:dream_energy_core_factory_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    4000,
    2560000000,
    0
);
<modularmachinery:dream_energy_core_factory_controller>.addTooltip(format.gold("用于存储能量"));
<modularmachinery:dream_energy_core_factory_controller>.addTooltip(format.gold("用智能数据接口来确定输入/输出速度"));
<modularmachinery:dream_energy_core_factory_controller>.addTooltip(format.gold("最大可存储9.2E+18RF"));
import mods.modularmachinery.RecipeBuilder;
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "dream_energy_core_make",
    "me_mythic_assembler",
    // inputs
    [
        <draconicevolution:energy_storage_core>*1,
        <actuallyadditions:item_misc:19>*64,
        <contenttweaker:terrasteel_crystal>*32,
        <extrabotany:material:7>*64,
        <extrabotany:spiritfuel>*640,
        <contenttweaker:bloodmaster_block>*1024,
        <contenttweaker:spinel_ring>*256
    ],
    // fluid inputs
    [
        <liquid:eternal_dragon_fire>*32768000
    ],
    // outputs
    [<modularmachinery:dream_energy_core_factory_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    4000,
    2560000000,
    0
);
<modularmachinery:dream_energy_core_factory_controller>.addTooltip(format.gold("用于存储能量"));
<modularmachinery:dream_energy_core_factory_controller>.addTooltip(format.gold("用智能数据接口来确定输入/输出速度"));
<modularmachinery:dream_energy_core_factory_controller>.addTooltip(format.gold("最大可存储9.2E+18RF"));
<modularmachinery:dream_energy_core_factory_controller>.addTooltip(format.green("感谢Hikari_Nova的授权！"));