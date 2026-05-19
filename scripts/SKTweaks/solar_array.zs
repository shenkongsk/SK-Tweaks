import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.RecipeModifierBuilder;

MachineModifier.setInternalParallelism("solar_array", 2147483647);
<modularmachinery:solar_array_controller>.addTooltip(format.gold("可以放置太阳能发电机和加速配置"));
<modularmachinery:solar_array_controller>.addTooltip(format.gold("太阳能发电机发电量可叠加"));
<modularmachinery:solar_array_controller>.addTooltip(format.red("每tick发电过高可能不会工作！！"));
<modularmachinery:solar_array_controller>.addTooltip(format.red("每次重进，可能需要重新放入材料才会正确输出"));
<modularmachinery:solar_array_controller>.addTooltip(format.red("控制器拆了重放也可以"));
function solar_array_recipe_builder(
    recipeName as string,
    inputs as crafttweaker.item.IIngredient[],
    energyOutput as int
)as void{
    var Machine_Name = "solar_array";
    var Process_Time = 2000;
    // 500%
    // <forestry:bee_queen_ge>{UID1: "forestry.speedSlow", UID0: "forestry.speedSlow", Slot: 1 as byte}, {UID1: "careerbees.li
    var Time_Bee = <gendustry:gene_sample>.withTag({species: "rootBees", chromosome: 0, allele: "careerbees.acceleration"});
    // 400%
    var Horologium_Acc = <astralsorcery:itemtunedcelestialcrystal>.withTag({astralsorcery: {constellationName: "astralsorcery.constellation.horologium"}});
    // 500%
    var Torch_lv1 = <tce:tce_torch_lvl1>;
    // 2700%
    var Compressed_Torch_lv1 = <tce:tce_compressed_torch_lvl1>;
    val builder = RecipeBuilder.newBuilder(recipeName, Machine_Name, Process_Time);
    var Acutal_Energy = energyOutput*2;
    for item in inputs {
        builder.addItemInput(item).setChance(0.0);

    }
    builder.addCatalystInput(Torch_lv1,
        ["加速火把--产出*300%"],
        [RecipeModifierBuilder.create("modularmachinery:energy", "output", 3.0F, 1, false).build(),]).setParallelizeUnaffected(true).setChance(0);
    builder.addCatalystInput(Time_Bee,
        ["时间蜂--产出*800%"],
        [RecipeModifierBuilder.create("modularmachinery:energy", "output", 8.0F, 1, false).build(),]).setParallelizeUnaffected(true).setChance(0);
    builder.addCatalystInput(Horologium_Acc,
        ["时钟座--产出*500%"],
        [RecipeModifierBuilder.create("modularmachinery:energy", "output", 5.0F, 1, false).build(),]).setParallelizeUnaffected(true).setChance(0);
    builder.addCatalystInput(Compressed_Torch_lv1,
        ["压缩加速火把--产出*2700%"],
        [RecipeModifierBuilder.create("modularmachinery:energy", "output", 27.0F, 1, false).build(),]).setParallelizeUnaffected(true).setChance(0);
    
    builder.addEnergyPerTickOutput(Acutal_Energy);
    builder.build();
}
solar_array_recipe_builder(
    "solar_pannel_0",
    [
        <techreborn:solar_panel>
    ],
    16
);
solar_array_recipe_builder(
    "solar_pannel_1",
    [
        <techreborn:solar_panel:1>
    ],
    128
);
solar_array_recipe_builder(
    "solar_pannel_2",
    [
        <techreborn:solar_panel:2>
    ],
    1024
);
solar_array_recipe_builder(
    "solar_pannel_3",
    [
        <techreborn:solar_panel:3>
    ],
    8192
);
solar_array_recipe_builder(
    "solar_pannel_4",
    [
        <techreborn:solar_panel:4>
    ],
    65536
);
solar_array_recipe_builder(
    "solar_pannel_5",
    [
        <techreborn:creative_solar_panel>
    ],
    1048576
);