import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;

MachineModifier.setInternalParallelism("machine_mana_pool", 256);
<modularmachinery:machine_mana_pool_controller>.addTooltip(format.gold("内置额外256并行！"));
function Machine_Mana_Pool_Recipe_Builder(
    fusiontype as string,
    recipeName as string,
    inputs as crafttweaker.item.IIngredient[],
    inputChances as double[],          // 对应原始 inputs 的概率
    outputs as crafttweaker.item.IIngredient[],
    outputChances as double[]          // 对应 outputs 的概率
) as void {
    // 固定参数（可根据需要调整或作为参数传入）
    val Mana_Input = 8000;
    val Process_Time = 30;
    val MACHINE_NAME = "machine_mana_pool";
    scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK_Chance_With_Mana(
        recipeName,
        MACHINE_NAME,
        //
        inputs,
        inputChances,
        //
        [],
        [],
        //
        outputs,
        outputChances,
        //
        [],
        [],
        Process_Time,
        Mana_Input,
        0
    );   
}
// 炼造催化配方 (conjuration)
val conjuration_recipes = [
    [<aoa3:skeletal_ingot> * 4, <botania:storage> * 4],
    [<aoa3:lyon_ingot> * 4, <botania:storage> * 8],
    [<aoa3:elecanium_ingot> * 4, <botania:storage> * 12],
    [<ore:ingotChaos>*4, <botania:storage> * 16],
    [<aoa3:shyrestone_ingot> * 4, <botania:storage> * 20],
    [<divinerpg:eden_gem> * 4, <botania:storage:3> * 4],
    [<divinerpg:wildwood_gem> * 4, <botania:storage:3> * 8],
    [<divinerpg:apalachia_gem> * 4, <botania:storage:3> * 12],
    [<divinerpg:skythern_gem> * 4, <botania:storage:3> * 16],
    [<divinerpg:mortum_gem> * 4, <botania:storage:3> * 20]
];
for k, recipe in conjuration_recipes {
    Machine_Mana_Pool_Recipe_Builder(
        "conjuration",
        "mana_pool_auto_craft_conjuration_" + k,
        [<botania:conjurationcatalyst>*1,recipe[0]],
        [0.0],
        [recipe[1]],
        []
    );
}
// 炼金催化配方 (alchemy)
val alchemy_recipes = [
    [<contenttweaker:divine_star> * 4, <botania:manaresource:1> * 40],
    [<contenttweaker:eden_star> * 4, <botania:manaresource:1> * 80],
    [<contenttweaker:wildwood_star> * 4, <botania:manaresource:1> * 120],
    [<contenttweaker:apalachia_star> * 4, <botania:manaresource:1> * 160],
    [<contenttweaker:skythern_star> * 4, <botania:manaresource:1> * 200],
    [<contenttweaker:mortum_star> * 4, <botania:manaresource:1> * 240],
    [<contenttweaker:dense_diamond_powder> * 4, <botania:manaresource:23> * 16],
    [<contenttweaker:recursive_powder> * 4, <botania:manaresource:23> * 128],
    [<contenttweaker:flying_gunpowder> * 4, <botania:manaresource:23> * 128],
    [<ore:dustOgerite> * 4, <botania:manaresource:23> * 192],
    [<contenttweaker:endergenic_sediment> * 4, <botania:quartz:1> * 192],
    [<contenttweaker:terrasteel_infused_stone> * 4, <botania:manaresource:4> * 256],
    [<aoa3:gardencia_stone> * 4, <contenttweaker:ytterbium_dust> * 4]
];
for j, recipe in alchemy_recipes {
    Machine_Mana_Pool_Recipe_Builder(
        "alchemy",
        "mana_pool_auto_craft_alchemy_" + j,
        [<botania:alchemycatalyst>*1,recipe[0]],
        [0.0],
        [recipe[1]],
        []
    );
}
// 普通灌注配方 (infusion)
val infusion_recipes = [
    [<ebwizardry:magic_crystal> * 4, <ebwizardry:magic_crystal:5> * 4],
    [<contenttweaker:willful_naquadah_chunk> * 4, <contenttweaker:cracked_naquadah_chunk> * 4],
    [<contenttweaker:material_part:76> * 4, <contenttweaker:rhenium_catalyst> * 4],
    [<contenttweaker:material_part:82> * 4, <contenttweaker:myrmitite_catalyst> * 4],
    [<contenttweaker:depleted_apothecary_fissile_alloy> * 4, <contenttweaker:apothecary_fissile_dust> * 16],
    [<aoa3:void_scales> * 4, <contenttweaker:mystical_gem> * 48],
    [<ore:ingotIron>*16,<botania:manaresource>*16],
    [<minecraft:glass>*16,<botania:managlass>*16],
    [<ore:itemCoal>*16,<extrabotany:nightmarefuel>*16],
    [<minecraft:iron_block>*16,<botania:storage>*16],
    [<minecraft:ender_pearl>*16,<botania:manaresource:1>*16],
    [<minecraft:redstone>*16,<botania:manaresource:23>*16],
    [<minecraft:string>*16,<botania:manaresource:16>*16],
    [<minecraft:diamond_block>*16,<botania:storage:3>*16]
];

for i, recipe in infusion_recipes {
    Machine_Mana_Pool_Recipe_Builder(
        "none",
        "mana_pool_auto_craft_" + i,
        [recipe[0]],
        [],
        [recipe[1]],
        []
    );
}
// 次元催化配方 (dimensioncatalyst)
val dimensioncatalyst_recipes = [
    [<minecraft:nether_star>*16,<minecraft:totem_of_undying>*16],
    [<extrabotany:flyingboat:1>*4,<minecraft:elytra>*4],
];
for k, recipe in dimensioncatalyst_recipes {
    Machine_Mana_Pool_Recipe_Builder(
        "dimensioncatalyst",
        "mana_pool_auto_craft_dimension_" + k,
        [<extrabotany:dimensioncatalyst>*1,recipe[0]],
        [0.0],
        [recipe[1]],
        []
    );
}