import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;

import crafttweaker.world.IWorld;
import crafttweaker.world.IBlockPos;

val MACHINE = "alfheim_portal";
MachineModifier.setMaxThreads("alfheim_portal", 0);
val threadA = FactoryRecipeThread.createCoreThread("§a精灵老王");
val threadB = FactoryRecipeThread.createCoreThread("§b精灵老李");
val threadC = FactoryRecipeThread.createCoreThread("§c精灵老张");
MachineModifier.addCoreThread(MACHINE, threadA);
MachineModifier.addCoreThread(MACHINE, threadB);
MachineModifier.addCoreThread(MACHINE, threadC);
MachineModifier.setInternalParallelism("alfheim_portal", 512);
<modularmachinery:alfheim_portal_factory_controller>.addTooltip(format.gold("内置额外512并行！"));
<modularmachinery:alfheim_portal_factory_controller>.addTooltip(format.gold("有3位精灵愿意和你交易！"));




function alfheim_trade_recipe_builder(
    recipename as string,
    inputs as crafttweaker.item.IIngredient[],
    inputChances as double[],          // 可留空 []
    outputs as crafttweaker.item.IIngredient[],
    outputChances as double[]          // 可留空 []
)as void
{
    var Time_Consume = 40;
    var Energy_Input = 1024000;
    scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK_Chance(
        recipename,
        "alfheim_portal",
        // item inputs - chances
        inputs,
        inputChances,
        // fluid inputs - chances
        [],
        [],
        // outputs - chances
        outputs,
        outputChances,
        // fluid outputs - chances
        [],
        [],
        // time, energy input, energy output
        Time_Consume,
        Energy_Input,
        0
    );
}

//

alfheim_trade_recipe_builder(
    "elementium_trade",
    [
        <botania:manaresource>*8
    ],
    [],
    [
        <botania:manaresource:7>*4
    ],
    []
);
alfheim_trade_recipe_builder(
    "mortum_livingwood_trade",
    [<contenttweaker:mortum_livingwood>*8],
    [],
    [<botania:dreamwood:0>*256],
    []
);

alfheim_trade_recipe_builder(
    "skeletal_ingot_trade",
    [<aoa3:skeletal_ingot>*8],
    [],
    [<botania:storage:2>*8],
    []
);

alfheim_trade_recipe_builder(
    "lyon_ingot_trade",
    [<aoa3:lyon_ingot>*8],
    [],
    [<botania:storage:2>*16],
    []
);

alfheim_trade_recipe_builder(
    "elecanium_ingot_trade",
    [<aoa3:elecanium_ingot>*8],
    [],
    [<botania:storage:2>*24],
    []
);

alfheim_trade_recipe_builder(
    "ingotChaos_trade",
    [<ore:ingotChaos>*8],
    [],
    [<botania:storage:2>*32],
    []
);

alfheim_trade_recipe_builder(
    "shyrestone_ingot_trade",
    [<aoa3:shyrestone_ingot>*8],
    [],
    [<botania:storage:2>*40],
    []
);

// ────────────────────────────────────────────

alfheim_trade_recipe_builder(
    "divine_star_trade",
    [<contenttweaker:divine_star>*8],
    [],
    [<botania:manaresource:8>*80],
    []
);

alfheim_trade_recipe_builder(
    "eden_star_trade",
    [<contenttweaker:eden_star>*8],
    [],
    [<botania:manaresource:8>*160],
    []
);

alfheim_trade_recipe_builder(
    "wildwood_star_trade",
    [<contenttweaker:wildwood_star>*8],
    [],
    [<botania:manaresource:8>*240],
    []
);

alfheim_trade_recipe_builder(
    "apalachia_star_trade",
    [<contenttweaker:apalachia_star>*8],
    [],
    [<botania:manaresource:8>*320],
    []
);

alfheim_trade_recipe_builder(
    "skythern_star_trade",
    [<contenttweaker:skythern_star>*8],
    [],
    [<botania:manaresource:8>*400],
    []
);

alfheim_trade_recipe_builder(
    "mortum_star_trade",
    [<contenttweaker:mortum_star>*8],
    [],
    [<botania:manaresource:8>*480],
    []
);


alfheim_trade_recipe_builder(
    "eden_gem_trade",
    [<divinerpg:eden_gem>*8],
    [],
    [<botania:storage:4>*8],
    []
);

alfheim_trade_recipe_builder(
    "wildwood_gem_trade",
    [<divinerpg:wildwood_gem>*8],
    [],
    [<botania:storage:4>*16],
    []
);

alfheim_trade_recipe_builder(
    "apalachia_gem_trade",
    [<divinerpg:apalachia_gem>*8],
    [],
    [<botania:storage:4>*24],
    []
);

alfheim_trade_recipe_builder(
    "skythern_gem_trade",
    [<divinerpg:skythern_gem>*8],
    [],
    [<botania:storage:4>*32],
    []
);

alfheim_trade_recipe_builder(
    "mortum_gem_trade",
    [<divinerpg:mortum_gem>*8],
    [],
    [<botania:storage:4>*40],
    []
);
alfheim_trade_recipe_builder(
    "endergenic_sediment_trade",
    [<contenttweaker:endergenic_sediment>*8],
    [],
    [<botania:quartz:5>*384],
    []
);

alfheim_trade_recipe_builder(
    "lelyetian_glass_trade",
    [<aoa3:lelyetian_glass>*8],
    [],
    [<botania:elfglass>*128],
    []
);

alfheim_trade_recipe_builder(
    "haven_glass_trade",
    [<aoa3:haven_glass>*8],
    [],
    [<botania:elfglass>*256],
    []
);

// alfheim_trade_recipe_builder(
//     "bread_no",
//     [
//         <minecraft:bread>*8
//     ],
//     [],
//     [
//         <minecraft:tnt>*1
//     ],
//     []
// );

val recipes = [
    [<contenttweaker:manastone_dust>*8, <contenttweaker:lothlorien_dust>*8],
    [<contenttweaker:depleted_silvan_fissile_alloy>*8, <contenttweaker:silvan_fissile_dust>*32],
    [<contenttweaker:infinity_sapling>,<contenttweaker:infinity_leaf>],
    [<contenttweaker:inert_botanic_alchemic_catalyst>*8,<contenttweaker:botanic_alchemic_catalyst>*8],
    [<contenttweaker:compressed_alchemical_ground>*8,<contenttweaker:compressed_alchemical_deposit>*16],
    [<contenttweaker:double_compressed_alchemical_ground>*8,<contenttweaker:double_compressed_alchemical_deposit>*16],
    [<contenttweaker:alchemical_ground>*8,<contenttweaker:alchemical_deposit>*16],
    [<botania:manaresource:1>*64,<botania:manaresource:8>*64],
    [<botania:storage:3>*64,<botania:storage:4>*64],
    [<botania:livingwood>*64,<botania:dreamwood>*64],
    [<botania:storage>*128,<botania:storage:2>*64],
    [<botania:managlass>*64,<botania:elfglass>*64],
    [<contenttweaker:manastone_silt>*8,<contenttweaker:lothlorien_silt>*8]
];

for i, recipe in recipes {
    alfheim_trade_recipe_builder(
        "alfheim_portal_auto_trade_" + i,
        [recipe[0]],
        [],
        [recipe[1]],
        []
    );
}

RecipeBuilder.newBuilder("explosive_recipe", "alfheim_portal", 20, 1, true)
    .addItemInput(<minecraft:bread>)
    .addEnergyPerTickInput(500000)
    .addItemOutput(<erebus:dung>.withTag({display: {Lore: ["§4扔你*面包呢"], Name: "§l§c粪便"}}))
    .addFactoryFinishHandler(function(event as FactoryRecipeFinishEvent) {
        val ctrl = event.controller;
        val world = ctrl.world;
        val pos = ctrl.pos;         
        if (!world.remote) {
            world.performExplosion(null, pos.x, pos.y+1, pos.z, 15.0, false, false);
        }
    })
    .build();