#loader crafttweaker reloadable
import mods.modularmachinery.RecipeBuilder;
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "blood_abyss_altar_controller_make",
    "creation_altar",
    // inputs
    [
        <modularmachinery:small_blood_abyss_altar_controller>*64,
        <bloodarsenal:blood_diamond:2>*512,
        <bloodmagic:decorative_brick:1>*4096,
        <aoa3:bloodstone_block>*204800,
        <nuclearcraft:turbine_wall>*512,
        <contenttweaker:dream_cluster>*256,
        <avaritia:block_resource:2>*64,
        <contenttweaker:mythic_excavation_computer>*128,
        <contenttweaker:mythic_excavation_engine>*128,
        <contenttweaker:mythic_excavation_reactor>*128,
        <extendedcrafting:singularity_ultimate>*8,
        <avaritia:resource:5>*1024

    ],
    // fluid inputs
    [
        <liquid:lifeessence>*1000000000,
        <liquid:liquidcoralium>*50000000,
        <liquid:unholy_radioactive_mix>*1000000
    ],
    // outputs
    [<modularmachinery:blood_abyss_altar_factory_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    120000, //
    10240000,
    0
);
scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "small_blood_abyss_altar_controller_make",
    "me_mythic_assembler",
    // inputs
    [
        <bloodmagic:decorative_brick:1>*64,
        <aoa3:bloodstone_block>*128,
        <divinerpg:eden_block>*32,
        <contenttweaker:vibranium_servo>*16,
        <contenttweaker:highly_advanced_machine_casing>*256

    ],
    // fluid inputs
    [
        <liquid:lifeessence>*2000000,
        <liquid:liquidcoralium>*50000,
    ],
    // outputs
    [<modularmachinery:small_blood_abyss_altar_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    4000, //
    5120000,
    0
);