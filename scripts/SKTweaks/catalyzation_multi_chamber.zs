#loader crafttweaker reloadable

import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;


function Recipe_Builder_SK_Catalyzation_Chamber(
    recipeName as string,
    inputs as crafttweaker.item.IIngredient[],
    outputs as crafttweaker.item.IIngredient[]
) as void 
{
    val machineName = "catalyzation_multi_chamber";
    val builder = RecipeBuilder.newBuilder(recipeName, machineName, 200);
    builder.addItemInput(<thaumicwonders:alienist_stone>.withTag({Unbreakable: 1 as byte})).setChance(0.0).setParallelized(true);
    builder.addEnergyPerTickInput(10000);
    for item in inputs {
        builder.addItemInput(item);
    }
    builder.addFluidInput(<liquid:cryotheum>*6400);
    for item in outputs {
        builder.addItemOutput(item);
    }
    builder.setMaxThreads(1);
    builder.build();
}
// 输入物品数组
val Recipe_Inputs = [
    [<ore:oreIron>*64],
    [<ore:oreGold>*64],
    [<ore:oreCopper>*64],
    [<ore:oreTin>*64],
    [<ore:oreSilver>*64],
    [<ore:oreLead>*64],
    [<ore:oreCinnabar>*64],
    [<ore:oreQuartz>*64],
    [<thaumcraft:void_seed>*64]
];

val Recipe_Outputs = [
    [<thaumicwonders:eldritch_cluster>*64],
    [<thaumicwonders:eldritch_cluster:1>*64],
    [<thaumicwonders:eldritch_cluster:2>*64],
    [<thaumicwonders:eldritch_cluster:3>*64],
    [<thaumicwonders:eldritch_cluster:4>*64],
    [<thaumicwonders:eldritch_cluster:5>*64],
    [<thaumicwonders:eldritch_cluster:6>*64],
    [<thaumicwonders:eldritch_cluster:7>*64],
    [<thaumicwonders:eldritch_cluster:8>*64]
];

for i in 0 to Recipe_Inputs.length{
    val inputs = Recipe_Inputs[i];
    val outputs = Recipe_Outputs[i];
    Recipe_Builder_SK_Catalyzation_Chamber(
        "catalyzation_multi_chamber_auto_recipe_builder_"+i,
        inputs,
        outputs
    );
}
