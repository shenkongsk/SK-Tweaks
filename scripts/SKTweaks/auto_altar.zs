#loader crafttweaker reloadable
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipePrimer;
import mods.modularmachinery.IngredientArrayBuilder;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.MachineModifier;

MachineModifier.setInternalParallelism("auto_altar", 4);
<modularmachinery:auto_altar_controller>.addTooltip(format.gold("内置额外4并行！"));

RecipeBuilder.newBuilder("auto_altar", "auto_altar", 20)
    .addItemInputs(
        <ore:runeWaterB>*1, 
        <ore:runeFireB>*1, 
        <ore:treeSapling>*3,
        <ore:cropWheat>*1
    )
    .addManaInput(8000,false)
    .addItemOutput(<botania:rune:4>*1)
    .build();

RecipeBuilder.newBuilder("auto_altar_0", "auto_altar", 20)
    .addItemInputs(
        <ore:runeEarthB>*1,
        <ore:runeAirB>*1,
        <minecraft:sand>*2,
        <ore:slimeball>*1,
        <minecraft:melon>*1
    )
    .addManaInput(8000, false)
    .addItemOutput(<botania:rune:5>*1)
    .build();

RecipeBuilder.newBuilder("auto_altar_1", "auto_altar", 20)
    .addItemInputs(
        <ore:runeFireB>*1,
        <ore:runeAirB>*1,
        <ore:treeLeaves>*3,
        <minecraft:spider_eye>*1
    )
    .addManaInput(8000, false)
    .addItemOutput(<botania:rune:6>*1)
    .build();

RecipeBuilder.newBuilder("auto_altar_2", "auto_altar", 20)
    .addItemInputs(
        <ore:runeWaterB>*1,
        <ore:runeEarthB>*1,
        <minecraft:snow>*2,
        <ore:blockWool>*1,
        <minecraft:cake>*1
    )
    .addManaInput(8000, false)
    .addItemOutput(<botania:rune:7>*1)
    .build();

RecipeBuilder.newBuilder("auto_altar_3", "auto_altar", 20)
    .addItemInputs(
        <ore:ingotManasteel>*5,
        <ore:manaPearl>*1
    )
    .addManaInput(8000, false)
    .addItemOutput(<botania:rune:8>*1)
    .build();

RecipeBuilder.newBuilder("auto_altar_4", "auto_altar", 20)
    .addItemInputs(
        <ore:manaDiamond>*2,
        <ore:runeSummerB>*1,
        <ore:runeAirB>*1
    )
    .addManaInput(12000, false)
    .addItemOutput(<botania:rune:9>*1)
    .build();

RecipeBuilder.newBuilder("auto_altar_5", "auto_altar", 20)
    .addItemInputs(
        <ore:manaDiamond>*2,
        <ore:runeWinterB>*1,
        <ore:runeFireB>*1
    )
    .addManaInput(12000, false)
    .addItemOutput(<botania:rune:10>*1)
    .build();

RecipeBuilder.newBuilder("auto_altar_6", "auto_altar", 20)
    .addItemInputs(
        <ore:manaDiamond>*2,
        <ore:runeSpringB>*1,
        <ore:runeWaterB>*1
    )
    .addManaInput(12000, false)
    .addItemOutput(<botania:rune:11>*1)
    .build();

RecipeBuilder.newBuilder("auto_altar_7", "auto_altar", 20)
    .addItemInputs(
        <ore:manaDiamond>*2,
        <ore:runeAutumnB>*1,
        <ore:runeAirB>*1
    )
    .addManaInput(12000, false)
    .addItemOutput(<botania:rune:12>*1)
    .build();

RecipeBuilder.newBuilder("auto_altar_8", "auto_altar", 20)
    .addItemInputs(
        <ore:manaDiamond>*2,
        <ore:runeWinterB>*1,
        <ore:runeEarthB>*1
    )
    .addManaInput(12000, false)
    .addItemOutput(<botania:rune:13>*1)
    .build();

RecipeBuilder.newBuilder("auto_altar_9", "auto_altar", 20)
    .addItemInputs(
        <ore:manaDiamond>*2,
        <ore:runeWinterB>*1,
        <ore:runeWaterB>*1
    )
    .addManaInput(12000, false)
    .addItemOutput(<botania:rune:14>*1)
    .build();

RecipeBuilder.newBuilder("auto_altar_10", "auto_altar", 20)
    .addItemInputs(
        <ore:manaDiamond>*2,
        <ore:runeSummerB>*1,
        <ore:runeFireB>*1
    )
    .addManaInput(12000, false)
    .addItemOutput(<botania:rune:15>*1)
    .build();

// RecipeBuilder.newBuilder("auto_altar_11", "auto_altar", 20)
//     .addItemInputs(
//         <minecraft:skull>*1,
//         <ore:elvenPixieDust>*1,
//         <ore:gemPrismarine>*1,
//         <minecraft:name_tag>*1,
//         <minecraft:golden_apple>*1
//     )
//     .addManaInput(22500, false)
//     .addItemOutput(<minecraft:skull:3>*1)
//     .build();

// //144-188行之间为 寰宇植物学 的内容，未安装寰宇植物学会导致全部配方失效，如需启用，删除144和188两行以取消这部分的注释
// /*
// RecipeBuilder.newBuilder("auto_altar_12", "auto_altar", 20)
//     .addItemInputs(
//         <ore:runeWrathB>*1,
//         <ore:runeWaterB>*1,
//         <ore:runeWinterB>*1,
//         <ore:ingotManasteel>*1
//     )
//     .addManaInput(8000, false)
//     .addItemOutput(<botaniverse:morerune>*2)
//     .build();

// RecipeBuilder.newBuilder("auto_altar_13", "auto_altar", 20)
//     .addItemInputs(
//         <ore:runeWrathB>*1,
//         <ore:runeAutumnB>*1,
//         <ore:runeFireB>*1,
//         <minecraft:magma>*1
//     )
//     .addManaInput(12000, false)
//     .addItemOutput(<botaniverse:morerune:1>*2)
//     .build();

// RecipeBuilder.newBuilder("auto_altar_14", "auto_altar", 20)
//     .addItemInputs(
//         <ore:runeLustB>*1,
//         <ore:runeSummerB>*1,
//         <ore:runeAirB>*1,
//         <ore:ingotElvenElementium>*1
//     )
//     .addManaInput(16000, false)
//     .addItemOutput(<botaniverse:morerune:2>*2)
//     .build();

// RecipeBuilder.newBuilder("auto_altar_15", "auto_altar", 20)
//     .addItemInputs(
//         <ore:runePrideB>*1,
//         <ore:runeAirB>*1,
//         <ore:runeAutumnB>*1,
//         <ore:gaiaIngot>*1
//     )
//     .addManaInput(20000, false)
//     .addItemOutput(<botaniverse:morerune:3>*2)
//     .build();
// */



RecipeBuilder.newBuilder("auto_altar_16", "auto_altar", 20)
    .addItemInputs(
        <minecraft:potato>*1,
        <minecraft:gold_nugget>*1
    )
    .addManaInput(800, false)
    .addItemOutput(<extrabotany:material:2>*1)
    .build();

RecipeBuilder.newBuilder("auto_altar_17", "auto_altar", 20)
    .addItemInputs(
        <ore:ingotManasteel>*1,
        <ore:ingotTerrasteel>*1,
        <ore:gaiaIngot>*1,
        <ore:ingotElvenElementium>*1,
        <ore:manaDiamond>*1,
        <ore:elvenDragonstone>*1
    )
    .addManaInput(100000, false)
    .addItemOutput(<extrabotany:material:2>.withTag({ench: [{lvl: 5 as short, id: 1}, {lvl: 5 as short, id: 4}, {lvl: 5 as short, id: 3}, {lvl: 5 as short, id: 0}]}))
    .build();

RecipeBuilder.newBuilder("auto_altar_18", "auto_altar", 20)
    .addItemInputs(
        <ore:ingotManasteel>*2,
        <minecraft:ice>*2,
        <ore:runeManaB>*1
    )
    .addManaInput(2000, false)
    .addItemOutput(<extrabotany:froststar>*1)
    .build();

RecipeBuilder.newBuilder("auto_altar_19", "auto_altar", 20)
    .addItemInputs(
        <ore:ingotManasteel>*2,
        <ore:manaDiamond>*1,
        <minecraft:skull:1>*1,
        <ore:runeEnvyB>*1
    )
    .addManaInput(2000, false)
    .addItemOutput(<extrabotany:deathring>*1)
    .build();

RecipeBuilder.newBuilder("auto_altar_20", "auto_altar", 20)
    .addItemInputs(
        <extrabotany:terrasteelhammer>*1,
        <extrabotany:gildedmashedpotato>*3,
        <minecraft:gold_block>*1
    )
    .addManaInput(100000, false)
    .addItemOutput(<extrabotany:ultimatehammer>*1)
    .build();

RecipeBuilder.newBuilder("auto_altar_21", "auto_altar", 20)
    .addItemInputs(
        <ore:ingotElvenElementium>*1,
        <extrabotany:nightmarefuel>*3,
        <extrabotany:gildedmashedpotato>*1
    )
    .addManaInput(4200, false)
    .addItemOutput(<extrabotany:material:5>*1)
    .build();

RecipeBuilder.newBuilder("auto_altar_22", "auto_altar", 20)
    .addItemInputs(
        <extrabotany:combatmaidchest>*1,
        <extrabotany:shadowwarriorhelm>*1,
        <extrabotany:shadowwarriorchest>*1,
        <extrabotany:shadowwarriorlegs>*1,
        <extrabotany:shadowwarriorboots>*1
    )
    .addManaInput(50000, false)
    .addItemOutput(<extrabotany:combatmaidchestdarkened>*1)
    .build();

RecipeBuilder.newBuilder("auto_altar_23", "auto_altar", 20)
    .addItemInputs(
        <ore:gaiaIngot>*2,
        <extrabotany:material:3>*1,
        <extrabotany:gildedmashedpotato>*1,
        <botania:manaresource:5>*4
    )
    .addManaInput(150000, false)
    .addItemOutput(<extrabotany:material:1>*1)
    .build();
RecipeBuilder.newBuilder("auto_altar_31", "auto_altar", 20)
    .addItemInputs(
        <ore:gaiaIngot>*4,
        <botania:manaresource:5>*4,
        <contenttweaker:corrupted_aragonite>*1,
        <extrabotany:material:3>
    )
    .addManaInput(150000, false)
    .addItemOutput(<extrabotany:material:1>*4)
    .build();

RecipeBuilder.newBuilder("auto_altar_24", "auto_altar", 20)
    .addItemInputs(
        <ore:ingotManasteel>*2,
        <minecraft:wheat_seeds>*1,
        <ore:runeEarthB>*1,
        <minecraft:sticky_piston>*1
    )
    .addManaInput(2000, false)
    .addItemOutput(<extrabotany:walljumping>*1)
    .build();

RecipeBuilder.newBuilder("auto_altar_25", "auto_altar", 20)
    .addItemInputs(
        <ore:ingotManasteel>*2,
        <minecraft:wheat_seeds>*1,
        <ore:runeEarthB>*1,
        <ore:stone>*1
    )
    .addManaInput(2000, false)
    .addItemOutput(<extrabotany:wallrunning>*1)
    .build();

RecipeBuilder.newBuilder("auto_altar_26", "auto_altar", 20)
    .addItemInputs(
        <ore:ingotElvenElementium>*2,
        <ore:quartzElven>*2,
        <ore:runeSpringB>*1
    )
    .addManaInput(4000, false)
    .addItemOutput(<extrabotany:elvenking>*1)
    .build();

RecipeBuilder.newBuilder("auto_altar_27", "auto_altar", 20)
    .addItemInputs(
        <extrabotany:elvenking>*1,
        <extrabotany:material:3>*1,
        <ore:runeLustB>*1,
        <ore:runeGluttonyB>*1,
        <ore:runeGreedB>*1,
        <ore:runeSlothB>*1,
        <ore:runeWrathB>*1,
        <ore:runeEnvyB>*1,
        <ore:runePrideB>*1
    )
    .addManaInput(50000, false)
    .addItemOutput(<extrabotany:allforone>*1)
    .build();

RecipeBuilder.newBuilder("auto_altar_28", "auto_altar", 20)
    .addItemInputs(
        <ore:ingotElvenElementium>*1,
        <extrabotany:material>*3,
        <extrabotany:gildedmashedpotato>*1
    )
    .addManaInput(4200, false)
    .addItemOutput(<extrabotany:material:8>*1)
    .build();

RecipeBuilder.newBuilder("auto_altar_29", "auto_altar", 20)
    .addItemInputs(
        <extrabotany:gildedmashedpotato>*1,
        <extrabotany:excaliber>*1,
        <extrabotany:buddhistrelics>*1,
        <extrabotany:shadowkatana>*1,
        <minecraft:wooden_sword>*1,
        <botania:terrasword>*1,
        <botania:starsword>*1,
        <botania:elementiumsword>*1,
        <botania:thundersword>*1,
        <botania:manasteelsword>*1
    )
    .addManaInput(1000000, false)
    .addItemOutput(<extrabotany:firstfractal>*1)
    .build();

RecipeBuilder.newBuilder("auto_altar_30", "auto_altar", 20)
    .addItemInputs(
        <minecraft:book>*1,
        <botania:rune:8>*1,
        <botania:storage>*1,
        <botania:storage:3>*1,
        <botania:spellcloth>*1,
        <botania:manaresource:1>*1
    )
    .addManaInput(50000, false)
    .addItemOutput(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 102}]}))
    .build();
var Recipe_Inputs = [
    // 从 mods.botania.RuneAltar.addRecipe(<contenttweaker:rune_of_freedom>, [<contenttweaker:living_shard_of_shadesmar>, <contenttweaker:embodiment_of_balance>, <contenttweaker:embodiment_of_glory>, <contenttweaker:embodiment_of_hope>, <contenttweaker:embodiment_of_knowledge>, <contenttweaker:light_of_shadesmar>, <contenttweaker:actualizing_hyperuranion_ingot>], 1000);
    [<contenttweaker:living_shard_of_shadesmar>, <contenttweaker:embodiment_of_balance>, <contenttweaker:embodiment_of_glory>, <contenttweaker:embodiment_of_hope>, <contenttweaker:embodiment_of_knowledge>, <contenttweaker:light_of_shadesmar>, <contenttweaker:actualizing_hyperuranion_ingot>],
    // <botania:rune:0>*3 系列
    [<botania:manaresource:0>, <botania:manaresource:23>, <divinerpg:whale_fin>, <divinerpg:crab_claw>, <minecraft:fish:3>],
    [<botania:manaresource:0>, <contenttweaker:fiery_pyrite>, <divinerpg:whale_fin>, <divinerpg:crab_claw>, <minecraft:fish:3>],
    [<botania:manaresource:0>, <contenttweaker:projector_gem>, <divinerpg:whale_fin>, <divinerpg:crab_claw>, <minecraft:fish:3>],
    [<botania:manaresource:0>, <contenttweaker:ender_dolomite_dust>, <divinerpg:whale_fin>, <divinerpg:crab_claw>, <minecraft:fish:3>],
    [<botania:manaresource:0>, <contenttweaker:nugget_of_midas>, <divinerpg:whale_fin>, <divinerpg:crab_claw>, <minecraft:fish:3>],
    [<botania:manaresource:0>, <contenttweaker:unidentified_gem>, <divinerpg:whale_fin>, <divinerpg:crab_claw>, <minecraft:fish:3>],
    [<botania:manaresource:0>, <divinerpg:acid>, <divinerpg:whale_fin>, <divinerpg:crab_claw>, <minecraft:fish:3>],
    [<botania:manaresource:0>, <contenttweaker:imperial_diamond_powder>, <divinerpg:whale_fin>, <divinerpg:crab_claw>, <minecraft:fish:3>],
    [<botania:manaresource:0>, <contenttweaker:strange_stone_essence>, <divinerpg:whale_fin>, <divinerpg:crab_claw>, <minecraft:fish:3>],
    [<botania:manaresource:0>, <contenttweaker:actualizing_stone>, <divinerpg:whale_fin>, <divinerpg:crab_claw>, <minecraft:fish:3>],
    [<botania:manaresource:0>, <contenttweaker:trinity_nugget>, <divinerpg:whale_fin>, <divinerpg:crab_claw>, <minecraft:fish:3>],
    [<botania:manaresource:0>, <contenttweaker:dust_of_infinite_wishes>, <divinerpg:whale_fin>, <divinerpg:crab_claw>, <minecraft:fish:3>],
    [<botania:manaresource:0>, <contenttweaker:quasar_charged_dust>, <divinerpg:whale_fin>, <divinerpg:crab_claw>, <minecraft:fish:3>],
    [<botania:manaresource:0>, <contenttweaker:galactic_dust>, <divinerpg:whale_fin>, <divinerpg:crab_claw>, <minecraft:fish:3>],
    [<botania:manaresource:0>, <contenttweaker:bifrost_warren_dust>, <divinerpg:whale_fin>, <divinerpg:crab_claw>, <minecraft:fish:3>],
    [<botania:manaresource:0>, <contenttweaker:ragnarok_warren_dust>, <divinerpg:whale_fin>, <divinerpg:crab_claw>, <minecraft:fish:3>],
    [<botania:manaresource:0>, <contenttweaker:valhalla_warren_dust>, <divinerpg:whale_fin>, <divinerpg:crab_claw>, <minecraft:fish:3>],
    // rune:1 系列
    [<botania:manaresource:0>, <botania:manaresource:23>, <divinerpg:purple_blaze>, <erebus:materials:21>, <tconstruct:ingots:2>],
    [<botania:manaresource:0>, <contenttweaker:fiery_pyrite>, <divinerpg:purple_blaze>, <erebus:materials:21>, <tconstruct:ingots:2>],
    [<botania:manaresource:0>, <contenttweaker:projector_gem>, <divinerpg:purple_blaze>, <erebus:materials:21>, <tconstruct:ingots:2>],
    [<botania:manaresource:0>, <contenttweaker:ender_dolomite_dust>, <divinerpg:purple_blaze>, <erebus:materials:21>, <tconstruct:ingots:2>],
    [<botania:manaresource:0>, <contenttweaker:nugget_of_midas>, <divinerpg:purple_blaze>, <erebus:materials:21>, <tconstruct:ingots:2>],
    [<botania:manaresource:0>, <contenttweaker:unidentified_gem>, <divinerpg:purple_blaze>, <erebus:materials:21>, <tconstruct:ingots:2>],
    [<botania:manaresource:0>, <divinerpg:acid>, <divinerpg:purple_blaze>, <erebus:materials:21>, <tconstruct:ingots:2>],
    [<botania:manaresource:0>, <contenttweaker:imperial_diamond_powder>, <divinerpg:purple_blaze>, <erebus:materials:21>, <tconstruct:ingots:2>],
    [<botania:manaresource:0>, <contenttweaker:strange_stone_essence>, <divinerpg:purple_blaze>, <erebus:materials:21>, <tconstruct:ingots:2>],
    [<botania:manaresource:0>, <contenttweaker:actualizing_stone>, <divinerpg:purple_blaze>, <erebus:materials:21>, <tconstruct:ingots:2>],
    [<botania:manaresource:0>, <contenttweaker:trinity_nugget>, <divinerpg:purple_blaze>, <erebus:materials:21>, <tconstruct:ingots:2>],
    [<botania:manaresource:0>, <contenttweaker:dust_of_infinite_wishes>, <divinerpg:purple_blaze>, <erebus:materials:21>, <tconstruct:ingots:2>],
    [<botania:manaresource:0>, <contenttweaker:quasar_charged_dust>, <divinerpg:purple_blaze>, <erebus:materials:21>, <tconstruct:ingots:2>],
    [<botania:manaresource:0>, <contenttweaker:galactic_dust>, <divinerpg:purple_blaze>, <erebus:materials:21>, <tconstruct:ingots:2>],
    [<botania:manaresource:0>, <contenttweaker:bifrost_warren_dust>, <divinerpg:purple_blaze>, <erebus:materials:21>, <tconstruct:ingots:2>],
    [<botania:manaresource:0>, <contenttweaker:ragnarok_warren_dust>, <divinerpg:purple_blaze>, <erebus:materials:21>, <tconstruct:ingots:2>],
    [<botania:manaresource:0>, <contenttweaker:valhalla_warren_dust>, <divinerpg:purple_blaze>, <erebus:materials:21>, <tconstruct:ingots:2>],
    // rune:2 系列
    [<botania:manaresource:0>, <botania:manaresource:23>, <thaumcraft:vishroom>, <nuclearcraft:dry_earth>, <cyclicmagic:crystallized_obsidian>],
    [<botania:manaresource:0>, <contenttweaker:fiery_pyrite>, <thaumcraft:vishroom>, <nuclearcraft:dry_earth>, <cyclicmagic:crystallized_obsidian>],
    [<botania:manaresource:0>, <contenttweaker:projector_gem>, <thaumcraft:vishroom>, <nuclearcraft:dry_earth>, <cyclicmagic:crystallized_obsidian>],
    [<botania:manaresource:0>, <contenttweaker:ender_dolomite_dust>, <thaumcraft:vishroom>, <nuclearcraft:dry_earth>, <cyclicmagic:crystallized_obsidian>],
    [<botania:manaresource:0>, <contenttweaker:nugget_of_midas>, <thaumcraft:vishroom>, <nuclearcraft:dry_earth>, <cyclicmagic:crystallized_obsidian>],
    [<botania:manaresource:0>, <contenttweaker:unidentified_gem>, <thaumcraft:vishroom>, <nuclearcraft:dry_earth>, <cyclicmagic:crystallized_obsidian>],
    [<botania:manaresource:0>, <divinerpg:acid>, <thaumcraft:vishroom>, <nuclearcraft:dry_earth>, <cyclicmagic:crystallized_obsidian>],
    [<botania:manaresource:0>, <contenttweaker:imperial_diamond_powder>, <thaumcraft:vishroom>, <nuclearcraft:dry_earth>, <cyclicmagic:crystallized_obsidian>],
    [<botania:manaresource:0>, <contenttweaker:strange_stone_essence>, <thaumcraft:vishroom>, <nuclearcraft:dry_earth>, <cyclicmagic:crystallized_obsidian>],
    [<botania:manaresource:0>, <contenttweaker:actualizing_stone>, <thaumcraft:vishroom>, <nuclearcraft:dry_earth>, <cyclicmagic:crystallized_obsidian>],
    [<botania:manaresource:0>, <contenttweaker:trinity_nugget>, <thaumcraft:vishroom>, <nuclearcraft:dry_earth>, <cyclicmagic:crystallized_obsidian>],
    [<botania:manaresource:0>, <contenttweaker:dust_of_infinite_wishes>, <thaumcraft:vishroom>, <nuclearcraft:dry_earth>, <cyclicmagic:crystallized_obsidian>],
    [<botania:manaresource:0>, <contenttweaker:quasar_charged_dust>, <thaumcraft:vishroom>, <nuclearcraft:dry_earth>, <cyclicmagic:crystallized_obsidian>],
    [<botania:manaresource:0>, <contenttweaker:galactic_dust>, <thaumcraft:vishroom>, <nuclearcraft:dry_earth>, <cyclicmagic:crystallized_obsidian>],
    [<botania:manaresource:0>, <contenttweaker:bifrost_warren_dust>, <thaumcraft:vishroom>, <nuclearcraft:dry_earth>, <cyclicmagic:crystallized_obsidian>],
    [<botania:manaresource:0>, <contenttweaker:ragnarok_warren_dust>, <thaumcraft:vishroom>, <nuclearcraft:dry_earth>, <cyclicmagic:crystallized_obsidian>],
    [<botania:manaresource:0>, <contenttweaker:valhalla_warren_dust>, <thaumcraft:vishroom>, <nuclearcraft:dry_earth>, <cyclicmagic:crystallized_obsidian>],
    // rune:3 系列
    [<botania:manaresource:0>, <botania:manaresource:23>, <actuallyadditions:block_smiley_cloud>, <iceandfire:stymphalian_bird_feather>, <tconstruct:edible:4>],
    [<botania:manaresource:0>, <contenttweaker:fiery_pyrite>, <actuallyadditions:block_smiley_cloud>, <iceandfire:stymphalian_bird_feather>, <tconstruct:edible:4>],
    [<botania:manaresource:0>, <contenttweaker:projector_gem>, <actuallyadditions:block_smiley_cloud>, <iceandfire:stymphalian_bird_feather>, <tconstruct:edible:4>],
    [<botania:manaresource:0>, <contenttweaker:ender_dolomite_dust>, <actuallyadditions:block_smiley_cloud>, <iceandfire:stymphalian_bird_feather>, <tconstruct:edible:4>],
    [<botania:manaresource:0>, <contenttweaker:nugget_of_midas>, <actuallyadditions:block_smiley_cloud>, <iceandfire:stymphalian_bird_feather>, <tconstruct:edible:4>],
    [<botania:manaresource:0>, <contenttweaker:unidentified_gem>, <actuallyadditions:block_smiley_cloud>, <iceandfire:stymphalian_bird_feather>, <tconstruct:edible:4>],
    [<botania:manaresource:0>, <divinerpg:acid>, <actuallyadditions:block_smiley_cloud>, <iceandfire:stymphalian_bird_feather>, <tconstruct:edible:4>],
    [<botania:manaresource:0>, <contenttweaker:imperial_diamond_powder>, <actuallyadditions:block_smiley_cloud>, <iceandfire:stymphalian_bird_feather>, <tconstruct:edible:4>],
    [<botania:manaresource:0>, <contenttweaker:strange_stone_essence>, <actuallyadditions:block_smiley_cloud>, <iceandfire:stymphalian_bird_feather>, <tconstruct:edible:4>],
    [<botania:manaresource:0>, <contenttweaker:actualizing_stone>, <actuallyadditions:block_smiley_cloud>, <iceandfire:stymphalian_bird_feather>, <tconstruct:edible:4>],
    [<botania:manaresource:0>, <contenttweaker:trinity_nugget>, <actuallyadditions:block_smiley_cloud>, <iceandfire:stymphalian_bird_feather>, <tconstruct:edible:4>],
    [<botania:manaresource:0>, <contenttweaker:dust_of_infinite_wishes>, <actuallyadditions:block_smiley_cloud>, <iceandfire:stymphalian_bird_feather>, <tconstruct:edible:4>],
    [<botania:manaresource:0>, <contenttweaker:quasar_charged_dust>, <actuallyadditions:block_smiley_cloud>, <iceandfire:stymphalian_bird_feather>, <tconstruct:edible:4>],
    [<botania:manaresource:0>, <contenttweaker:galactic_dust>, <actuallyadditions:block_smiley_cloud>, <iceandfire:stymphalian_bird_feather>, <tconstruct:edible:4>],
    [<botania:manaresource:0>, <contenttweaker:bifrost_warren_dust>, <actuallyadditions:block_smiley_cloud>, <iceandfire:stymphalian_bird_feather>, <tconstruct:edible:4>],
    [<botania:manaresource:0>, <contenttweaker:ragnarok_warren_dust>, <actuallyadditions:block_smiley_cloud>, <iceandfire:stymphalian_bird_feather>, <tconstruct:edible:4>],
    [<botania:manaresource:0>, <contenttweaker:valhalla_warren_dust>, <actuallyadditions:block_smiley_cloud>, <iceandfire:stymphalian_bird_feather>, <tconstruct:edible:4>],
    // rune:8 系列
    [<botania:manaresource:1>, <contenttweaker:fiery_pyrite>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>],
    [<botania:manaresource:1>, <contenttweaker:projector_gem>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>],
    [<botania:manaresource:1>, <contenttweaker:ender_dolomite_dust>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>],
    [<botania:manaresource:1>, <contenttweaker:nugget_of_midas>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>],
    [<botania:manaresource:1>, <contenttweaker:unidentified_gem>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>],
    [<botania:manaresource:1>, <divinerpg:acid>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>],
    [<botania:manaresource:1>, <contenttweaker:imperial_diamond_powder>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>],
    [<botania:manaresource:1>, <contenttweaker:strange_stone_essence>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>],
    [<botania:manaresource:1>, <contenttweaker:actualizing_stone>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>],
    [<botania:manaresource:1>, <contenttweaker:trinity_nugget>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>],
    [<botania:manaresource:1>, <contenttweaker:dust_of_infinite_wishes>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>],
    [<botania:manaresource:1>, <contenttweaker:quasar_charged_dust>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>],
    [<botania:manaresource:1>, <contenttweaker:galactic_dust>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>],
    [<botania:manaresource:1>, <contenttweaker:bifrost_warren_dust>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>],
    [<botania:manaresource:1>, <contenttweaker:ragnarok_warren_dust>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>],
    [<botania:manaresource:1>, <contenttweaker:valhalla_warren_dust>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>, <botania:manaresource:0>],
    // rune:4 系列
    [<botania:rune:0>, <botania:rune:1>, <contenttweaker:fiery_pyrite>, <minecraft:wheat>, <ore:treeSapling>, <ore:treeSapling>],
    [<botania:rune:0>, <botania:rune:1>, <contenttweaker:projector_gem>, <minecraft:wheat>, <ore:treeSapling>, <ore:treeSapling>],
    [<botania:rune:0>, <botania:rune:1>, <contenttweaker:ender_dolomite_dust>, <minecraft:wheat>, <ore:treeSapling>, <ore:treeSapling>],
    [<botania:rune:0>, <botania:rune:1>, <contenttweaker:nugget_of_midas>, <minecraft:wheat>, <ore:treeSapling>, <ore:treeSapling>],
    [<botania:rune:0>, <botania:rune:1>, <contenttweaker:unidentified_gem>, <minecraft:wheat>, <ore:treeSapling>, <ore:treeSapling>],
    [<botania:rune:0>, <botania:rune:1>, <divinerpg:acid>, <minecraft:wheat>, <ore:treeSapling>, <ore:treeSapling>],
    [<botania:rune:0>, <botania:rune:1>, <contenttweaker:imperial_diamond_powder>, <minecraft:wheat>, <ore:treeSapling>, <ore:treeSapling>],
    [<botania:rune:0>, <botania:rune:1>, <contenttweaker:strange_stone_essence>, <minecraft:wheat>, <ore:treeSapling>, <ore:treeSapling>],
    [<botania:rune:0>, <botania:rune:1>, <contenttweaker:actualizing_stone>, <minecraft:wheat>, <ore:treeSapling>, <ore:treeSapling>],
    [<botania:rune:0>, <botania:rune:1>, <contenttweaker:trinity_nugget>, <minecraft:wheat>, <ore:treeSapling>, <ore:treeSapling>],
    [<botania:rune:0>, <botania:rune:1>, <contenttweaker:dust_of_infinite_wishes>, <minecraft:wheat>, <ore:treeSapling>, <ore:treeSapling>],
    [<botania:rune:0>, <botania:rune:1>, <contenttweaker:quasar_charged_dust>, <minecraft:wheat>, <ore:treeSapling>, <ore:treeSapling>],
    [<botania:rune:0>, <botania:rune:1>, <contenttweaker:galactic_dust>, <minecraft:wheat>, <ore:treeSapling>, <ore:treeSapling>],
    [<botania:rune:0>, <botania:rune:1>, <contenttweaker:bifrost_warren_dust>, <minecraft:wheat>, <ore:treeSapling>, <ore:treeSapling>],
    [<botania:rune:0>, <botania:rune:1>, <contenttweaker:ragnarok_warren_dust>, <minecraft:wheat>, <ore:treeSapling>, <ore:treeSapling>],
    [<botania:rune:0>, <botania:rune:1>, <contenttweaker:valhalla_warren_dust>, <minecraft:wheat>, <ore:treeSapling>, <ore:treeSapling>],
    // rune:5 系列
    [<botania:rune:2>, <botania:rune:3>, <contenttweaker:fiery_pyrite>, <minecraft:melon>, <ore:slimeball>, <minecraft:sand>],
    [<botania:rune:2>, <botania:rune:3>, <contenttweaker:projector_gem>, <minecraft:melon>, <ore:slimeball>, <minecraft:sand>],
    [<botania:rune:2>, <botania:rune:3>, <contenttweaker:ender_dolomite_dust>, <minecraft:melon>, <ore:slimeball>, <minecraft:sand>],
    [<botania:rune:2>, <botania:rune:3>, <contenttweaker:nugget_of_midas>, <minecraft:melon>, <ore:slimeball>, <minecraft:sand>],
    [<botania:rune:2>, <botania:rune:3>, <contenttweaker:unidentified_gem>, <minecraft:melon>, <ore:slimeball>, <minecraft:sand>],
    [<botania:rune:2>, <botania:rune:3>, <divinerpg:acid>, <minecraft:melon>, <ore:slimeball>, <minecraft:sand>],
    [<botania:rune:2>, <botania:rune:3>, <contenttweaker:imperial_diamond_powder>, <minecraft:melon>, <ore:slimeball>, <minecraft:sand>],
    [<botania:rune:2>, <botania:rune:3>, <contenttweaker:strange_stone_essence>, <minecraft:melon>, <ore:slimeball>, <minecraft:sand>],
    [<botania:rune:2>, <botania:rune:3>, <contenttweaker:actualizing_stone>, <minecraft:melon>, <ore:slimeball>, <minecraft:sand>],
    [<botania:rune:2>, <botania:rune:3>, <contenttweaker:trinity_nugget>, <minecraft:melon>, <ore:slimeball>, <minecraft:sand>],
    [<botania:rune:2>, <botania:rune:3>, <contenttweaker:dust_of_infinite_wishes>, <minecraft:melon>, <ore:slimeball>, <minecraft:sand>],
    [<botania:rune:2>, <botania:rune:3>, <contenttweaker:quasar_charged_dust>, <minecraft:melon>, <ore:slimeball>, <minecraft:sand>],
    [<botania:rune:2>, <botania:rune:3>, <contenttweaker:galactic_dust>, <minecraft:melon>, <ore:slimeball>, <minecraft:sand>],
    [<botania:rune:2>, <botania:rune:3>, <contenttweaker:bifrost_warren_dust>, <minecraft:melon>, <ore:slimeball>, <minecraft:sand>],
    [<botania:rune:2>, <botania:rune:3>, <contenttweaker:ragnarok_warren_dust>, <minecraft:melon>, <ore:slimeball>, <minecraft:sand>],
    [<botania:rune:2>, <botania:rune:3>, <contenttweaker:valhalla_warren_dust>, <minecraft:melon>, <ore:slimeball>, <minecraft:sand>],
    // rune:6 系列
    [<botania:rune:1>, <botania:rune:3>, <contenttweaker:fiery_pyrite>, <minecraft:spider_eye>, <ore:treeLeaves>, <ore:treeLeaves>],
    [<botania:rune:1>, <botania:rune:3>, <contenttweaker:projector_gem>, <minecraft:spider_eye>, <ore:treeLeaves>, <ore:treeLeaves>],
    [<botania:rune:1>, <botania:rune:3>, <contenttweaker:ender_dolomite_dust>, <minecraft:spider_eye>, <ore:treeLeaves>, <ore:treeLeaves>],
    [<botania:rune:1>, <botania:rune:3>, <contenttweaker:nugget_of_midas>, <minecraft:spider_eye>, <ore:treeLeaves>, <ore:treeLeaves>],
    [<botania:rune:1>, <botania:rune:3>, <contenttweaker:unidentified_gem>, <minecraft:spider_eye>, <ore:treeLeaves>, <ore:treeLeaves>],
    [<botania:rune:1>, <botania:rune:3>, <divinerpg:acid>, <minecraft:spider_eye>, <ore:treeLeaves>, <ore:treeLeaves>],
    [<botania:rune:1>, <botania:rune:3>, <contenttweaker:imperial_diamond_powder>, <minecraft:spider_eye>, <ore:treeLeaves>, <ore:treeLeaves>],
    [<botania:rune:1>, <botania:rune:3>, <contenttweaker:strange_stone_essence>, <minecraft:spider_eye>, <ore:treeLeaves>, <ore:treeLeaves>],
    [<botania:rune:1>, <botania:rune:3>, <contenttweaker:actualizing_stone>, <minecraft:spider_eye>, <ore:treeLeaves>, <ore:treeLeaves>],
    [<botania:rune:1>, <botania:rune:3>, <contenttweaker:trinity_nugget>, <minecraft:spider_eye>, <ore:treeLeaves>, <ore:treeLeaves>],
    [<botania:rune:1>, <botania:rune:3>, <contenttweaker:dust_of_infinite_wishes>, <minecraft:spider_eye>, <ore:treeLeaves>, <ore:treeLeaves>],
    [<botania:rune:1>, <botania:rune:3>, <contenttweaker:quasar_charged_dust>, <minecraft:spider_eye>, <ore:treeLeaves>, <ore:treeLeaves>],
    [<botania:rune:1>, <botania:rune:3>, <contenttweaker:galactic_dust>, <minecraft:spider_eye>, <ore:treeLeaves>, <ore:treeLeaves>],
    [<botania:rune:1>, <botania:rune:3>, <contenttweaker:bifrost_warren_dust>, <minecraft:spider_eye>, <ore:treeLeaves>, <ore:treeLeaves>],
    [<botania:rune:1>, <botania:rune:3>, <contenttweaker:ragnarok_warren_dust>, <minecraft:spider_eye>, <ore:treeLeaves>, <ore:treeLeaves>],
    [<botania:rune:1>, <botania:rune:3>, <contenttweaker:valhalla_warren_dust>, <minecraft:spider_eye>, <ore:treeLeaves>, <ore:treeLeaves>],
    // rune:7 系列
    [<botania:rune:0>, <botania:rune:2>, <contenttweaker:fiery_pyrite>, <minecraft:cake>, <minecraft:snow>, <ore:woolBlock>],
    [<botania:rune:0>, <botania:rune:2>, <contenttweaker:projector_gem>, <minecraft:cake>, <minecraft:snow>, <ore:woolBlock>],
    [<botania:rune:0>, <botania:rune:2>, <contenttweaker:ender_dolomite_dust>, <minecraft:cake>, <minecraft:snow>, <ore:woolBlock>],
    [<botania:rune:0>, <botania:rune:2>, <contenttweaker:nugget_of_midas>, <minecraft:cake>, <minecraft:snow>, <ore:woolBlock>],
    [<botania:rune:0>, <botania:rune:2>, <contenttweaker:unidentified_gem>, <minecraft:cake>, <minecraft:snow>, <ore:woolBlock>],
    [<botania:rune:0>, <botania:rune:2>, <divinerpg:acid>, <minecraft:cake>, <minecraft:snow>, <ore:woolBlock>],
    [<botania:rune:0>, <botania:rune:2>, <contenttweaker:imperial_diamond_powder>, <minecraft:cake>, <minecraft:snow>, <ore:woolBlock>],
    [<botania:rune:0>, <botania:rune:2>, <contenttweaker:strange_stone_essence>, <minecraft:cake>, <minecraft:snow>, <ore:woolBlock>],
    [<botania:rune:0>, <botania:rune:2>, <contenttweaker:actualizing_stone>, <minecraft:cake>, <minecraft:snow>, <ore:woolBlock>],
    [<botania:rune:0>, <botania:rune:2>, <contenttweaker:trinity_nugget>, <minecraft:cake>, <minecraft:snow>, <ore:woolBlock>],
    [<botania:rune:0>, <botania:rune:2>, <contenttweaker:dust_of_infinite_wishes>, <minecraft:cake>, <minecraft:snow>, <ore:woolBlock>],
    [<botania:rune:0>, <botania:rune:2>, <contenttweaker:quasar_charged_dust>, <minecraft:cake>, <minecraft:snow>, <ore:woolBlock>],
    [<botania:rune:0>, <botania:rune:2>, <contenttweaker:galactic_dust>, <minecraft:cake>, <minecraft:snow>, <ore:woolBlock>],
    [<botania:rune:0>, <botania:rune:2>, <contenttweaker:bifrost_warren_dust>, <minecraft:cake>, <minecraft:snow>, <ore:woolBlock>],
    [<botania:rune:0>, <botania:rune:2>, <contenttweaker:ragnarok_warren_dust>, <minecraft:cake>, <minecraft:snow>, <ore:woolBlock>],
    [<botania:rune:0>, <botania:rune:2>, <contenttweaker:valhalla_warren_dust>, <minecraft:cake>, <minecraft:snow>, <ore:woolBlock>],
    // rune:9 系列
    [<botania:rune:3>, <botania:rune:5>, <contenttweaker:fiery_pyrite>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:5>, <contenttweaker:projector_gem>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:5>, <contenttweaker:ender_dolomite_dust>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:5>, <contenttweaker:nugget_of_midas>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:5>, <contenttweaker:unidentified_gem>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:5>, <divinerpg:acid>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:5>, <contenttweaker:imperial_diamond_powder>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:5>, <contenttweaker:strange_stone_essence>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:5>, <contenttweaker:actualizing_stone>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:5>, <contenttweaker:trinity_nugget>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:5>, <contenttweaker:dust_of_infinite_wishes>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:5>, <contenttweaker:quasar_charged_dust>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:5>, <contenttweaker:galactic_dust>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:5>, <contenttweaker:bifrost_warren_dust>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:5>, <contenttweaker:ragnarok_warren_dust>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:5>, <contenttweaker:valhalla_warren_dust>, <botania:manaresource:2>],
    // rune:10 系列
    [<botania:rune:1>, <botania:rune:7>, <contenttweaker:fiery_pyrite>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:7>, <contenttweaker:projector_gem>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:7>, <contenttweaker:ender_dolomite_dust>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:7>, <contenttweaker:nugget_of_midas>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:7>, <contenttweaker:unidentified_gem>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:7>, <divinerpg:acid>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:7>, <contenttweaker:imperial_diamond_powder>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:7>, <contenttweaker:strange_stone_essence>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:7>, <contenttweaker:actualizing_stone>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:7>, <contenttweaker:trinity_nugget>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:7>, <contenttweaker:dust_of_infinite_wishes>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:7>, <contenttweaker:quasar_charged_dust>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:7>, <contenttweaker:galactic_dust>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:7>, <contenttweaker:bifrost_warren_dust>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:7>, <contenttweaker:ragnarok_warren_dust>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:7>, <contenttweaker:valhalla_warren_dust>, <botania:manaresource:2>],
    // rune:11 系列
    [<botania:rune:0>, <botania:rune:4>, <contenttweaker:fiery_pyrite>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:4>, <contenttweaker:projector_gem>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:4>, <contenttweaker:ender_dolomite_dust>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:4>, <contenttweaker:nugget_of_midas>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:4>, <contenttweaker:unidentified_gem>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:4>, <divinerpg:acid>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:4>, <contenttweaker:imperial_diamond_powder>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:4>, <contenttweaker:strange_stone_essence>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:4>, <contenttweaker:actualizing_stone>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:4>, <contenttweaker:trinity_nugget>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:4>, <contenttweaker:dust_of_infinite_wishes>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:4>, <contenttweaker:quasar_charged_dust>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:4>, <contenttweaker:galactic_dust>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:4>, <contenttweaker:bifrost_warren_dust>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:4>, <contenttweaker:ragnarok_warren_dust>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:4>, <contenttweaker:valhalla_warren_dust>, <botania:manaresource:2>],
    // rune:12 系列
    [<botania:rune:3>, <botania:rune:6>, <contenttweaker:fiery_pyrite>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:6>, <contenttweaker:projector_gem>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:6>, <contenttweaker:ender_dolomite_dust>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:6>, <contenttweaker:nugget_of_midas>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:6>, <contenttweaker:unidentified_gem>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:6>, <divinerpg:acid>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:6>, <contenttweaker:imperial_diamond_powder>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:6>, <contenttweaker:strange_stone_essence>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:6>, <contenttweaker:actualizing_stone>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:6>, <contenttweaker:trinity_nugget>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:6>, <contenttweaker:dust_of_infinite_wishes>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:6>, <contenttweaker:quasar_charged_dust>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:6>, <contenttweaker:galactic_dust>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:6>, <contenttweaker:bifrost_warren_dust>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:6>, <contenttweaker:ragnarok_warren_dust>, <botania:manaresource:2>],
    [<botania:rune:3>, <botania:rune:6>, <contenttweaker:valhalla_warren_dust>, <botania:manaresource:2>],
    // rune:13 系列
    [<botania:rune:2>, <botania:rune:7>, <contenttweaker:fiery_pyrite>, <botania:manaresource:2>],
    [<botania:rune:2>, <botania:rune:7>, <contenttweaker:projector_gem>, <botania:manaresource:2>],
    [<botania:rune:2>, <botania:rune:7>, <contenttweaker:ender_dolomite_dust>, <botania:manaresource:2>],
    [<botania:rune:2>, <botania:rune:7>, <contenttweaker:nugget_of_midas>, <botania:manaresource:2>],
    [<botania:rune:2>, <botania:rune:7>, <contenttweaker:unidentified_gem>, <botania:manaresource:2>],
    [<botania:rune:2>, <botania:rune:7>, <divinerpg:acid>, <botania:manaresource:2>],
    [<botania:rune:2>, <botania:rune:7>, <contenttweaker:imperial_diamond_powder>, <botania:manaresource:2>],
    [<botania:rune:2>, <botania:rune:7>, <contenttweaker:strange_stone_essence>, <botania:manaresource:2>],
    [<botania:rune:2>, <botania:rune:7>, <contenttweaker:actualizing_stone>, <botania:manaresource:2>],
    [<botania:rune:2>, <botania:rune:7>, <contenttweaker:trinity_nugget>, <botania:manaresource:2>],
    [<botania:rune:2>, <botania:rune:7>, <contenttweaker:dust_of_infinite_wishes>, <botania:manaresource:2>],
    [<botania:rune:2>, <botania:rune:7>, <contenttweaker:quasar_charged_dust>, <botania:manaresource:2>],
    [<botania:rune:2>, <botania:rune:7>, <contenttweaker:galactic_dust>, <botania:manaresource:2>],
    [<botania:rune:2>, <botania:rune:7>, <contenttweaker:bifrost_warren_dust>, <botania:manaresource:2>],
    [<botania:rune:2>, <botania:rune:7>, <contenttweaker:ragnarok_warren_dust>, <botania:manaresource:2>],
    [<botania:rune:2>, <botania:rune:7>, <contenttweaker:valhalla_warren_dust>, <botania:manaresource:2>],
    // rune:14 系列
    [<botania:rune:0>, <botania:rune:7>, <contenttweaker:fiery_pyrite>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:7>, <contenttweaker:projector_gem>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:7>, <contenttweaker:ender_dolomite_dust>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:7>, <contenttweaker:nugget_of_midas>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:7>, <contenttweaker:unidentified_gem>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:7>, <divinerpg:acid>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:7>, <contenttweaker:imperial_diamond_powder>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:7>, <contenttweaker:strange_stone_essence>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:7>, <contenttweaker:actualizing_stone>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:7>, <contenttweaker:trinity_nugget>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:7>, <contenttweaker:dust_of_infinite_wishes>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:7>, <contenttweaker:quasar_charged_dust>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:7>, <contenttweaker:galactic_dust>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:7>, <contenttweaker:bifrost_warren_dust>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:7>, <contenttweaker:ragnarok_warren_dust>, <botania:manaresource:2>],
    [<botania:rune:0>, <botania:rune:7>, <contenttweaker:valhalla_warren_dust>, <botania:manaresource:2>],
    // rune:15 系列
    [<botania:rune:1>, <botania:rune:5>, <contenttweaker:fiery_pyrite>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:5>, <contenttweaker:projector_gem>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:5>, <contenttweaker:ender_dolomite_dust>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:5>, <contenttweaker:nugget_of_midas>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:5>, <contenttweaker:unidentified_gem>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:5>, <divinerpg:acid>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:5>, <contenttweaker:imperial_diamond_powder>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:5>, <contenttweaker:strange_stone_essence>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:5>, <contenttweaker:actualizing_stone>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:5>, <contenttweaker:trinity_nugget>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:5>, <contenttweaker:dust_of_infinite_wishes>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:5>, <contenttweaker:quasar_charged_dust>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:5>, <contenttweaker:galactic_dust>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:5>, <contenttweaker:bifrost_warren_dust>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:5>, <contenttweaker:ragnarok_warren_dust>, <botania:manaresource:2>],
    [<botania:rune:1>, <botania:rune:5>, <contenttweaker:valhalla_warren_dust>, <botania:manaresource:2>],
    // 额外配方
    [<contenttweaker:alchemical_gilding>, <contenttweaker:recursive_powder>],
    [<contenttweaker:compressed_alchemical_gilding>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>],
    [<contenttweaker:double_compressed_alchemical_gilding>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>],
    [<contenttweaker:triple_compressed_alchemical_gilding>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>],
    [<contenttweaker:quadruple_compressed_alchemical_gilding>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>],
    [<contenttweaker:quintuple_compressed_alchemical_gilding>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>],
    [<contenttweaker:sextuple_compressed_alchemical_gilding>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>],
    [<contenttweaker:septuple_compressed_alchemical_gilding>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>, <contenttweaker:recursive_powder>],
    [<gendustry:gene_sample>.withTag({species: "rootTrees", chromosome: 0, allele: "forestry.treeBirch"}), <bewitchment:cypress_wood>, <bewitchment:opal>, <botania:rune:12>, <bewitchment:spectral_dust>],
    [<materialpart:brightsteel:ingot>, <botania:rune:15>, <botania:rune:15>, <extrabotany:material:8>, <extrabotany:material:5>, <minecraft:book>, <extendedcrafting:singularity_custom:992>],
    [<divinerpg:dream_stone>, <contenttweaker:etherium_ingot>, <contenttweaker:recursive_powder>, <extrabotany:material:3>, <extrabotany:specialbag>, <extrabotany:material:1>],
    [<divinerpg:dream_dirt>, <contenttweaker:etherium_ingot>, <contenttweaker:recursive_powder>, <extrabotany:material:3>, <extrabotany:specialbag>, <extrabotany:material:1>],
    [<contenttweaker:stone_of_anima>, <contenttweaker:stone_of_anima>, <contenttweaker:stone_of_anima>, <divinerpg:aquatic_ingot>, <divinerpg:aquatic_ingot>, <divinerpg:aquatic_ingot>],
    [<botania:rune:1>, <botania:rune:1>, <materialpart:dreaded_steel:ingot>, <twilightforest:transformation_powder>, <contenttweaker:nethengeic_gem>],
    [<contenttweaker:nethengeic_rune>, <contenttweaker:nethengeic_mark>, <contenttweaker:nethengeic_mark>, <twilightforest:transformation_powder>],
    [<contenttweaker:nethengeic_rune>, <contenttweaker:barathosynium_ingot>, <contenttweaker:nethengeic_mark>, <twilightforest:transformation_powder>],
    [<contenttweaker:nethengeic_rune>, <contenttweaker:infused_dread_shard>, <contenttweaker:infused_dread_shard>, <twilightforest:transformation_powder>],
    [<contenttweaker:nethengeic_rune>, <contenttweaker:stormlight_infused_crystal>, <contenttweaker:infused_dread_shard>, <twilightforest:transformation_powder>],
    [<contenttweaker:nethengeic_rune>, <contenttweaker:cosmic_fracture>, <contenttweaker:infused_dread_shard>, <twilightforest:transformation_powder>],
    [<contenttweaker:nethengeic_rune>, <contenttweaker:cosmic_gem>, <contenttweaker:infused_dread_shard>, <twilightforest:transformation_powder>],
    [<contenttweaker:whisper_of_natureal_law>, <contenttweaker:whisper_of_natureal_law>, <contenttweaker:mortuus_vis_condensate>, <contenttweaker:mortuus_vis_condensate>, <contenttweaker:aesir_gemstone>, <contenttweaker:aesir_gemstone>],
    [<contenttweaker:quasar_charged_gem>, <contenttweaker:gem_of_the_dying_constellation>, <contenttweaker:quasar_charged_gem>, <contenttweaker:gem_of_the_birthing_nebula>, <contenttweaker:quasar_charged_gem>, <contenttweaker:scroll_of_truth_asgard>],
    [<contenttweaker:gratitude_of_loki>, <contenttweaker:gratitude_of_odin>, <contenttweaker:gratitude_of_thor>, <contenttweaker:rune_of_freedom>, <contenttweaker:rune_of_freedom>, <contenttweaker:rune_of_freedom>],
    [<contenttweaker:eldritch_will_crystal_seeds>, <aoa3:holly_top_petals>, <aoa3:holly_top_petals>, <abyssalcraft:essence:2>, <contenttweaker:greater_gaia_spirit>, <thaumicaugmentation:research_notes>]
];

var Recipe_Outputs = [
    // 输出物品（带数量）
    [<contenttweaker:rune_of_freedom>],
    [<botania:rune:0>*3],
    [<botania:rune:0>*6],
    [<botania:rune:0>*9],
    [<botania:rune:0>*12],
    [<botania:rune:0>*15],
    [<botania:rune:0>*21],
    [<botania:rune:0>*27],
    [<botania:rune:0>*33],
    [<botania:rune:0>*45],
    [<botania:rune:0>*66],
    [<botania:rune:0>*81],
    [<botania:rune:0>*162],
    [<botania:rune:0>*324],
    [<botania:rune:0>*999],
    [<botania:rune:0>*2733],
    [<botania:rune:0>*6666],
    [<botania:rune:0>*15151],
    [<botania:rune:1>*3],
    [<botania:rune:1>*6],
    [<botania:rune:1>*9],
    [<botania:rune:1>*12],
    [<botania:rune:1>*15],
    [<botania:rune:1>*21],
    [<botania:rune:1>*27],
    [<botania:rune:1>*33],
    [<botania:rune:1>*45],
    [<botania:rune:1>*66],
    [<botania:rune:1>*81],
    [<botania:rune:1>*162],
    [<botania:rune:1>*324],
    [<botania:rune:1>*999],
    [<botania:rune:1>*2733],
    [<botania:rune:1>*6666],
    [<botania:rune:1>*15151],
    [<botania:rune:2>*3],
    [<botania:rune:2>*6],
    [<botania:rune:2>*9],
    [<botania:rune:2>*12],
    [<botania:rune:2>*15],
    [<botania:rune:2>*21],
    [<botania:rune:2>*27],
    [<botania:rune:2>*33],
    [<botania:rune:2>*45],
    [<botania:rune:2>*66],
    [<botania:rune:2>*81],
    [<botania:rune:2>*162],
    [<botania:rune:2>*324],
    [<botania:rune:2>*999],
    [<botania:rune:2>*2733],
    [<botania:rune:2>*6666],
    [<botania:rune:2>*15151],
    [<botania:rune:3>*3],
    [<botania:rune:3>*6],
    [<botania:rune:3>*9],
    [<botania:rune:3>*12],
    [<botania:rune:3>*15],
    [<botania:rune:3>*21],
    [<botania:rune:3>*27],
    [<botania:rune:3>*33],
    [<botania:rune:3>*45],
    [<botania:rune:3>*66],
    [<botania:rune:3>*81],
    [<botania:rune:3>*162],
    [<botania:rune:3>*324],
    [<botania:rune:3>*999],
    [<botania:rune:3>*2733],
    [<botania:rune:3>*6666],
    [<botania:rune:3>*15151],
    [<botania:rune:8>*2],
    [<botania:rune:8>*4],
    [<botania:rune:8>*6],
    [<botania:rune:8>*10],
    [<botania:rune:8>*16],
    [<botania:rune:8>*24],
    [<botania:rune:8>*36],
    [<botania:rune:8>*44],
    [<botania:rune:8>*66],
    [<botania:rune:8>*128],
    [<botania:rune:8>*256],
    [<botania:rune:8>*512],
    [<botania:rune:8>*1024],
    [<botania:rune:8>*2048],
    [<botania:rune:8>*4096],
    [<botania:rune:8>*8192],
    [<botania:rune:4>*2],
    [<botania:rune:4>*4],
    [<botania:rune:4>*6],
    [<botania:rune:4>*10],
    [<botania:rune:4>*16],
    [<botania:rune:4>*24],
    [<botania:rune:4>*36],
    [<botania:rune:4>*44],
    [<botania:rune:4>*66],
    [<botania:rune:4>*128],
    [<botania:rune:4>*256],
    [<botania:rune:4>*512],
    [<botania:rune:4>*1024],
    [<botania:rune:4>*2048],
    [<botania:rune:4>*4096],
    [<botania:rune:4>*8192],
    [<botania:rune:5>*2],
    [<botania:rune:5>*4],
    [<botania:rune:5>*6],
    [<botania:rune:5>*10],
    [<botania:rune:5>*16],
    [<botania:rune:5>*24],
    [<botania:rune:5>*36],
    [<botania:rune:5>*44],
    [<botania:rune:5>*66],
    [<botania:rune:5>*128],
    [<botania:rune:5>*256],
    [<botania:rune:5>*512],
    [<botania:rune:5>*1024],
    [<botania:rune:5>*2048],
    [<botania:rune:5>*4096],
    [<botania:rune:5>*8192],
    [<botania:rune:6>*2],
    [<botania:rune:6>*4],
    [<botania:rune:6>*6],
    [<botania:rune:6>*10],
    [<botania:rune:6>*16],
    [<botania:rune:6>*24],
    [<botania:rune:6>*36],
    [<botania:rune:6>*44],
    [<botania:rune:6>*66],
    [<botania:rune:6>*128],
    [<botania:rune:6>*256],
    [<botania:rune:6>*512],
    [<botania:rune:6>*1024],
    [<botania:rune:6>*2048],
    [<botania:rune:6>*4096],
    [<botania:rune:6>*8192],
    [<botania:rune:7>*2],
    [<botania:rune:7>*4],
    [<botania:rune:7>*6],
    [<botania:rune:7>*10],
    [<botania:rune:7>*16],
    [<botania:rune:7>*24],
    [<botania:rune:7>*36],
    [<botania:rune:7>*44],
    [<botania:rune:7>*66],
    [<botania:rune:7>*128],
    [<botania:rune:7>*256],
    [<botania:rune:7>*512],
    [<botania:rune:7>*1024],
    [<botania:rune:7>*2048],
    [<botania:rune:7>*4096],
    [<botania:rune:7>*8192],
    [<botania:rune:9>*2],
    [<botania:rune:9>*4],
    [<botania:rune:9>*6],
    [<botania:rune:9>*10],
    [<botania:rune:9>*16],
    [<botania:rune:9>*24],
    [<botania:rune:9>*36],
    [<botania:rune:9>*44],
    [<botania:rune:9>*66],
    [<botania:rune:9>*128],
    [<botania:rune:9>*256],
    [<botania:rune:9>*512],
    [<botania:rune:9>*1024],
    [<botania:rune:9>*2048],
    [<botania:rune:9>*4096],
    [<botania:rune:9>*8192],
    [<botania:rune:10>*2],
    [<botania:rune:10>*4],
    [<botania:rune:10>*6],
    [<botania:rune:10>*10],
    [<botania:rune:10>*16],
    [<botania:rune:10>*24],
    [<botania:rune:10>*36],
    [<botania:rune:10>*44],
    [<botania:rune:10>*66],
    [<botania:rune:10>*128],
    [<botania:rune:10>*256],
    [<botania:rune:10>*512],
    [<botania:rune:10>*1024],
    [<botania:rune:10>*2048],
    [<botania:rune:10>*4096],
    [<botania:rune:10>*8192],
    [<botania:rune:11>*2],
    [<botania:rune:11>*4],
    [<botania:rune:11>*6],
    [<botania:rune:11>*10],
    [<botania:rune:11>*16],
    [<botania:rune:11>*24],
    [<botania:rune:11>*36],
    [<botania:rune:11>*44],
    [<botania:rune:11>*66],
    [<botania:rune:11>*128],
    [<botania:rune:11>*256],
    [<botania:rune:11>*512],
    [<botania:rune:11>*1024],
    [<botania:rune:11>*2048],
    [<botania:rune:11>*4096],
    [<botania:rune:11>*8192],
    [<botania:rune:12>*2],
    [<botania:rune:12>*4],
    [<botania:rune:12>*6],
    [<botania:rune:12>*10],
    [<botania:rune:12>*16],
    [<botania:rune:12>*24],
    [<botania:rune:12>*36],
    [<botania:rune:12>*44],
    [<botania:rune:12>*66],
    [<botania:rune:12>*128],
    [<botania:rune:12>*256],
    [<botania:rune:12>*512],
    [<botania:rune:12>*1024],
    [<botania:rune:12>*2048],
    [<botania:rune:12>*4096],
    [<botania:rune:12>*8192],
    [<botania:rune:13>*2],
    [<botania:rune:13>*4],
    [<botania:rune:13>*6],
    [<botania:rune:13>*10],
    [<botania:rune:13>*16],
    [<botania:rune:13>*24],
    [<botania:rune:13>*36],
    [<botania:rune:13>*44],
    [<botania:rune:13>*66],
    [<botania:rune:13>*128],
    [<botania:rune:13>*256],
    [<botania:rune:13>*512],
    [<botania:rune:13>*1024],
    [<botania:rune:13>*2048],
    [<botania:rune:13>*4096],
    [<botania:rune:13>*8192],
    [<botania:rune:14>*2],
    [<botania:rune:14>*4],
    [<botania:rune:14>*6],
    [<botania:rune:14>*10],
    [<botania:rune:14>*16],
    [<botania:rune:14>*24],
    [<botania:rune:14>*36],
    [<botania:rune:14>*44],
    [<botania:rune:14>*66],
    [<botania:rune:14>*128],
    [<botania:rune:14>*256],
    [<botania:rune:14>*512],
    [<botania:rune:14>*1024],
    [<botania:rune:14>*2048],
    [<botania:rune:14>*4096],
    [<botania:rune:14>*8192],
    [<botania:rune:15>*2],
    [<botania:rune:15>*4],
    [<botania:rune:15>*6],
    [<botania:rune:15>*10],
    [<botania:rune:15>*16],
    [<botania:rune:15>*24],
    [<botania:rune:15>*36],
    [<botania:rune:15>*44],
    [<botania:rune:15>*66],
    [<botania:rune:15>*128],
    [<botania:rune:15>*256],
    [<botania:rune:15>*512],
    [<botania:rune:15>*1024],
    [<botania:rune:15>*2048],
    [<botania:rune:15>*4096],
    [<botania:rune:15>*8192],
    // 额外配方输出
    [<contenttweaker:alchemical_refraction>*2],
    [<contenttweaker:compressed_alchemical_refraction>*2],
    [<contenttweaker:double_compressed_alchemical_refraction>*2],
    [<contenttweaker:triple_compressed_alchemical_refraction>*2],
    [<contenttweaker:quadruple_compressed_alchemical_refraction>*2],
    [<contenttweaker:quintuple_compressed_alchemical_refraction>*2],
    [<contenttweaker:sextuple_compressed_alchemical_refraction>*2],
    [<contenttweaker:septuple_compressed_alchemical_refraction>*2],
    [<extratrees:logs.4:2>],
    [<contenttweaker:ancient_elven_knowledge>],
    [<contenttweaker:botanical_dream_stone>],
    [<contenttweaker:botanical_nightmare_stone>],
    [<contenttweaker:warlord_callstone>],
    [<contenttweaker:nethengeic_rune>],
    [<contenttweaker:nethengeic_rune>*3],
    [<contenttweaker:nethengeic_rune>*9],
    [<contenttweaker:nethengeic_rune>*27],
    [<contenttweaker:nethengeic_rune>*81],
    [<contenttweaker:nethengeic_rune>*243],
    [<contenttweaker:nethengeic_rune>*729],
    [<contenttweaker:plea_to_nature>],
    [<contenttweaker:twilit_warren_shredder>],
    [<contenttweaker:rune_of_valhalla>*3],
    [<contenttweaker:eldritch_flower>]
];

var Recipe_Mana_Inputs = [
    1000000,
    // rune:0
    15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,
    // rune:1
    15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,
    // rune:2
    15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,
    // rune:3
    15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,
    // rune:8
    15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,
    // rune:4
    15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,
    // rune:5
    15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,
    // rune:6
    15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,
    // rune:7
    15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,
    // rune:9
    15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,
    // rune:10
    15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,
    // rune:11
    15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,
    // rune:12
    15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,
    // rune:13
    15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,
    // rune:14
    15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,
    // rune:15
    15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,15000,
    // 额外魔力消耗
    300,300,300,300,300,300,300,300,
    1000,
    60000,
    10000,
    10000,
    10000000,
    80000,
    80000,
    80000,
    80000,
    80000,
    80000,
    80000,
    10000,
    20000,
    5000,
    30000
];
for i in 0 to Recipe_Inputs.length{
    var RecipeName = "auto_altar_sk_recipe_builder_"+i;
    var machineName = "auto_altar";
    scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK_Chance_With_Mana(
        RecipeName,
        machineName,
        Recipe_Inputs[i],
        [],
        [],
        [],
        Recipe_Outputs[i],
        [],
        [],
        [],
        20,
        Recipe_Mana_Inputs[i],
        0
    );
}