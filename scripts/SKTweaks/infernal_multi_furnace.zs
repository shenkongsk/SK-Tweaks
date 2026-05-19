#loader crafttweaker reloadable

import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;


val Origin_Recipe_Inputs = [
    [<minecraft:porkchop>],
    [<minecraft:chicken>],
    [<minecraft:beef>],
    [<minecraft:mutton>],
    [<minecraft:fish>],
    [<minecraft:rabbit>]
];

val Origin_Recipe_Outputs = [
    [
        <minecraft:cooked_porkchop>,<thaumcraft:chunk:2>
    ],
    [
        <minecraft:cooked_chicken>,<thaumcraft:chunk:1>
    ],
    [
        <minecraft:cooked_beef>,<thaumcraft:chunk>
    ],
    [
        <minecraft:cooked_mutton>,<thaumcraft:chunk:5>
    ],
    [
        <minecraft:cooked_fish>,<thaumcraft:chunk:3>
    ],
    [
        <minecraft:cooked_rabbit>,<thaumcraft:chunk:4>
    ]
];

for i in 0 to Origin_Recipe_Inputs.length - 1 {
    val inputs = Origin_Recipe_Inputs[i];
    val outputs = Origin_Recipe_Outputs[i];
    var energy = 10000;
    scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK_Chance(
        "infernal_multi_origin_auto_builder_" + i,
        "infernal_multi_furnace",
        inputs,
        [],
        [
            <liquid:pyrotheum>*200
        ],
        [],
        outputs,
        [1.0,0.3],
        [],          // 无流体输出
        [],
        200,
        energy,
        0
    );
}

// 输入物品数组
val Recipe_Inputs = [
    [<divinerpg:dirty_pearls>],
    [<divinerpg:clean_pearls>],
    [<divinerpg:polished_pearls>],
    [<divinerpg:shiny_pearls>],
    [<contenttweaker:strange_phasing_dragon_meal>],
    [<divinerpg:teaker_lump>],
    [<divinerpg:amthirmis_lump>],
    [<divinerpg:darven_lump>],
    [<divinerpg:cermile_lump>],
    [<divinerpg:pardimal_lump>],
    [<divinerpg:quadrotic_lump>],
    [<divinerpg:karos_lump>],
    [<divinerpg:heliosis_lump>],
    [<divinerpg:arksiane_lump>]
];

// 输出物品数组（每个子数组为输出物品列表）
val Recipe_Outputs = [
    [<minecraft:ender_pearl>, <thaumcraft:chunk:1>*4],
    [<minecraft:ender_pearl>, <thaumcraft:chunk:1>*8],
    [<minecraft:ender_pearl>, <thaumcraft:chunk:1>*16],
    [<minecraft:ender_pearl>, <thaumcraft:chunk:1>*32],
    [<contenttweaker:strange_phasing_meat>],
    [<contenttweaker:tennessine_gem>],
    [<contenttweaker:tennessine_gem>,<contenttweaker:tennessine_gem>],
    [<contenttweaker:tennessine_gem>,<contenttweaker:tennessine_gem>],
    [<contenttweaker:tennessine_gem>,<contenttweaker:tennessine_gem>,<contenttweaker:tennessine_gem>,<contenttweaker:tennessine_gem>],
    [<contenttweaker:tennessine_gem>,<contenttweaker:tennessine_gem>,<contenttweaker:tennessine_gem>,<contenttweaker:tennessine_gem>],
    [<contenttweaker:tennessine_gem>,<contenttweaker:tennessine_gem>,<contenttweaker:tennessine_gem>,<contenttweaker:tennessine_gem>,<contenttweaker:tennessine_gem>],
    [<contenttweaker:tennessine_gem>,<contenttweaker:tennessine_gem>,<contenttweaker:tennessine_gem>,<contenttweaker:tennessine_gem>,<contenttweaker:tennessine_gem>],
    [<contenttweaker:tennessine_gem>,<contenttweaker:tennessine_gem>,<contenttweaker:tennessine_gem>,<contenttweaker:tennessine_gem>,<contenttweaker:tennessine_gem>,<contenttweaker:tennessine_gem>],
    [<contenttweaker:tennessine_gem>,<contenttweaker:tennessine_gem>,<contenttweaker:tennessine_gem>,<contenttweaker:tennessine_gem>,<contenttweaker:tennessine_gem>,<contenttweaker:tennessine_gem>,<contenttweaker:tennessine_gem>]
];

// 概率数组（每个子数组对应输出物品的概率，长度与对应输出数组一致）
val Recipe_Chances = [
    [1.0,0.9],
    [1.0,0.9],
    [1.0,0.9],
    [1.0,0.9],
    [1.0],
    [0.5],
    [0.6,0.5],
    [0.6,0.5],
    [0.6,0.4,0.4,0.1],
    [0.7,0.5,0.5,0.4],
    [0.7,0.6,0.5,0.4],
    [0.7,0.7,0.6,0.5,0.4],
    [0.8,0.8,0.7,0.7,0.7,0.6],
    [0.9,0.9,0.9,0.9,0.9,0.9,0.9]
];
for i in 0 to Recipe_Inputs.length{
    val inputs = Recipe_Inputs[i];
    val outputs = Recipe_Outputs[i];
    val chances = Recipe_Chances[i];
    var energy = 10000; // 根据需求调整
    scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK_Chance(
        "infernal_multi_auto_builder_" + i,
        "infernal_multi_furnace",
        inputs,
        [],                     // 输入概率（默认1.0）
        [<liquid:pyrotheum>*200],
        [],                     // 流体输入概率
        outputs,
        chances,
        [],                     // 无流体输出
        [],                     // 无流体输出概率
        200,                    // 时间
        energy,
        0
    );
}