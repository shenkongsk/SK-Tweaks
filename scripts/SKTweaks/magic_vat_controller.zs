import mods.modularmachinery.RecipeBuilder;

scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "magic_vat_controller_make",
    "me_mythic_assembler",
    // inputs
    [
        <enderio:item_material:55>*64,
        <contenttweaker:dark_soul_machine_chassis>*16,
        <enderio:block_vat>*16,
        <techreborn:machine_frame:2>*256,
        <botania:manaresource>*4096,
        <techreborn:part:1>*64,
        <ore:itemSkull>*8


    ],
    // fluid inputs
    [],
    // outputs
    [<modularmachinery:magic_vat_factory_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    1000, // 50 秒
    1600000,
    0
);