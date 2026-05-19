import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;

MachineModifier.setInternalParallelism("fluix_reactor", 16);
MachineModifier.setMaxThreads("fluix_reactor",0);
// 设置16倍的最大并行数
val MACHINE = "fluix_reactor";
val threadA = FactoryRecipeThread.createCoreThread("反应仓I");
val threadB = FactoryRecipeThread.createCoreThread("反应仓II");
val threadC = FactoryRecipeThread.createCoreThread("反应仓III");
MachineModifier.addCoreThread(MACHINE, threadA);
MachineModifier.addCoreThread(MACHINE, threadB);
MachineModifier.addCoreThread(MACHINE, threadC);
<modularmachinery:fluix_reactor_factory_controller>.addTooltip(format.gold("内置16并行！"));
<modularmachinery:fluix_reactor_factory_controller>.addTooltip(format.gold("内置3个线程！"));



function fluix_reactor_recipe_builder(
    recipeName as string,
    inputs as crafttweaker.item.IIngredient[],
    outputs as crafttweaker.item.IIngredient[]
)as void
{
    var time = 20;
    var energy = 400000;
    scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
        recipeName,
        "fluix_reactor",
        inputs,
        [],
        outputs,
        [],
        time,
        energy,
        0
    );


}
//=================================
fluix_reactor_recipe_builder(
    "fluix_crystal_make",
    [
        <minecraft:redstone>*16,
        <minecraft:quartz>*16,
        <appliedenergistics2:material:1>*16
    ],
    [
        <appliedenergistics2:material:7>*16
    ]
);
fluix_reactor_recipe_builder(
    "certus_crystal_charge",
    [
        <appliedenergistics2:material>*16
    ],
    [
        <appliedenergistics2:material:1>*16
    ]
);
fluix_reactor_recipe_builder(
    "certus_crystal_purify",
    [
        <appliedenergistics2:material:1>*16
    ],
    [
        <appliedenergistics2:material:10>*8
    ]
);
fluix_reactor_recipe_builder(
    "fluix_crystal_purify",
    [
        <appliedenergistics2:material:7>*16
    ],
    [
        <appliedenergistics2:material:12>*16
    ]
);