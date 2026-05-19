import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineModifier;

MachineModifier.setInternalParallelism("machine_daisy", 64);
<modularmachinery:machine_daisy_controller>.addTooltip(format.gold("内置64并行！"));
<modularmachinery:machine_daisy_controller>.addTooltip(format.gold("蕴魔土上方不要放置方块！"));
// 64并行
function machine_daisy_recipe_builder(
    recipeName as string,
    inputs as crafttweaker.item.IIngredient[],
    outputs as crafttweaker.item.IIngredient[]
)as void
{
    var time = 200;
    var energy = 5000;
    scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
        recipeName,
        "machine_daisy",
        inputs,
        [],
        outputs,
        [],
        time,
        energy,
        0
    );
}
// stone to living rock
machine_daisy_recipe_builder(
    "live_rock_make",
    [
        <minecraft:stone>*4
    ],
    [
        <botania:livingrock>*4
    ]
);
// log to living wood
machine_daisy_recipe_builder(
    "living_wood_make",
    [
        <ore:logWood>*4
    ],
    [
        <botania:livingwood>*4
    ]
);
// netherrack to cobblestone
machine_daisy_recipe_builder(
    "netherack_to_cobblestone",
    [
        <minecraft:netherrack>*4
    ],
    [
        <minecraft:cobblestone>*4
    ]
);
// soul sand to sand
machine_daisy_recipe_builder(
    "soul_sand_to_sand",
    [
        <minecraft:soul_sand>*4
    ],
    [
        <minecraft:sand>*4
    ]
);
// ice to packed ice
machine_daisy_recipe_builder(
    "ice_to_packed_ice",
    [
        <minecraft:ice>*4
    ],
    [
        <minecraft:packed_ice>*4
    ]
);
// blazeblock to obsidian
machine_daisy_recipe_builder(
    "blazeblock_to_obsidian",
    [
        <botania:blazeblock>*4
    ],
    [
        <minecraft:obsidian>*4
    ]
);
// mortum_dirt to mortum_livingrock
machine_daisy_recipe_builder(
    "mortum_dirt_to_livingrock",
    [
        <divinerpg:mortum_dirt>
    ],
    [
        <contenttweaker:mortum_livingrock>
    ]
);
// mortum_planks to mortum_livingwood
machine_daisy_recipe_builder(
    "mortum_planks_to_livingwood",
    [
        <divinerpg:mortum_planks>
    ],
    [
        <contenttweaker:mortum_livingwood>
    ]
);
// purity_offer to ragnarok_sigil
machine_daisy_recipe_builder(
    "purity_offer_to_ragnarok_sigil",
    [
        <contenttweaker:purity_offer>
    ],
    [
        <contenttweaker:ragnarok_sigil>
    ]
);
// botanial_dream_stone to arkenstone
machine_daisy_recipe_builder(
    "botanial_dream_stone_to_arkenstone",
    [
        <contenttweaker:botanical_dream_stone>*4
    ],
    [
        <contenttweaker:arkenstone>*4
    ]
);
// botanical_nightmare_stone to etherium_ore
machine_daisy_recipe_builder(
    "botanical_nightmare_stone_to_etherium_ore",
    [
        <contenttweaker:botanical_nightmare_stone>*4
    ],
    [
        <contenttweaker:etherium_ore>*4
    ]
);
// leaves to leaves_of_life
machine_daisy_recipe_builder(
    "leaves_to_leaves_of_life",
    [
        <ore:treeLeaves>*4
    ],
    [
        <contenttweaker:leaves_of_life>*4
    ]
);
// gold_block to living_gold
machine_daisy_recipe_builder(
    "gold_block_to_living_gold",
    [
        <minecraft:gold_block>*4
    ],
    [
        <contenttweaker:living_gold>*4
    ]
);