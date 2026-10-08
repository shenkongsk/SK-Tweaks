#loader crafttweaker reloadable
import crafttweaker.data.IData;
import crafttweaker.item.IIngredient;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.MachineTickEvent;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.IMachineController;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.SmartInterfaceType;
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.FactoryRecipeTickEvent;
import mods.modularmachinery.SmartInterfaceData;
import mods.modularmachinery.GeoMachineModel;
import mods.modularmachinery.ControllerModelAnimationEvent;
import crafttweaker.world.IBlockPos;
import mods.ctutils.utils.Math;
import native.java.math.BigInteger;
import mods.modularmachinery.MachineUpgradeHelper;
import mods.modularmachinery.MachineUpgradeBuilder;
import mods.modularmachinery.ActiveMachineRecipe;
import crafttweaker.liquid.ILiquidStack;
import mods.modularmachinery.RecipeFinishEvent;
val MACHINE = "astral_compressor";

val Recipe_Item_In as IIngredient[][] = [
    [
        <contenttweaker:modular_neutronium_casing>*55,
        <contenttweaker:gravitational_time_crystal>*1
    ],
    [
        <contenttweaker:miniature_quasar>,
        <contenttweaker:quasar_stabilizer>*64,
        <glassential:glass_ethereal_reverse>*24,
        <contenttweaker:quasar_burst_director>*16,
        <contenttweaker:quasar_screen>*1
    ],
    [<divinerpg:dream_grass>*640],
    [
        <contenttweaker:slightly_dense_pebble>*64,
        <contenttweaker:hyper_dense_dirt>*64
    ]
];

val Recipe_Item_Out as IIngredient[][] = [
    [<contenttweaker:time_crystal_lattice>*1],
    [<contenttweaker:directed_miniature_quasar>*1],
    [<contenttweaker:hyper_dense_dirt>*1],
    [<contenttweaker:hyperdense_matter>*8]
];


val Recipe_Fluid_In as ILiquidStack[][] = [
    [],
    [],
    [<liquid:blockfluiddirt>*536870912],
    [<liquid:black_hole_juice>*20]
];

val Recipe_Fluid_Out as ILiquidStack[][] = [
    [],[],[],[]
];

val Recipe_Energy as string[] = [
    "10000000000",
    "10000000000",
    "400000000000",
    "800000000000"
];

for i in 0 to Recipe_Item_In.length{
    Recipe_DE_Builder_SK(
        "astral_compressor_recipe" + i,
        "astral_compressor",
        Recipe_Item_In[i],
        Recipe_Fluid_In[i],
        Recipe_Item_Out[i],
        Recipe_Fluid_Out[i],
        500,
        BigInteger(Recipe_Energy[i]),
        BigInteger("0"),
        ""
    );
}
