import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.FactoryRecipeStartEvent;
import mods.modularmachinery.FactoryRecipeFinishEvent;


MachineModifier.setMaxThreads("magic_vat", 0);
val MACHINE = "magic_vat";
val threadA = FactoryRecipeThread.createCoreThread("魔力酿造室I");
val threadB = FactoryRecipeThread.createCoreThread("魔力酿造室II");
val threadC = FactoryRecipeThread.createCoreThread("魔力酿造室III");

MachineModifier.addCoreThread(MACHINE, threadA);
MachineModifier.addCoreThread(MACHINE, threadB);
MachineModifier.addCoreThread(MACHINE, threadC);
MachineModifier.setInternalParallelism("magic_vat", 4);
<modularmachinery:magic_vat_factory_controller>.addTooltip(format.gold("内置额外4并行！"));
<modularmachinery:magic_vat_factory_controller>.addTooltip(format.gold("内置3个线程！"));

function magic_vat_recipe_builder(
    recipeName as string,
    inputs as crafttweaker.item.IIngredient[],
    fluidInputs as crafttweaker.liquid.ILiquidStack[],
    fluidOutputs as crafttweaker.liquid.ILiquidStack[]
) as void 
{
    var energy = 1000000;
    var mana = 10000;
    var time = 600;
    val builder = RecipeBuilder.newBuilder(recipeName, "magic_vat", time);
    // 物品输入
    for i in 0 to inputs.length{
        val item = inputs[i];
        builder.addItemInput(item);
    }

    // 流体输入
    for i in 0 to fluidInputs.length{
        val fluid = fluidInputs[i];
        builder.addFluidInput(fluid);
    }
    // 流体输出
    for i in 0 to fluidOutputs.length{
        val fluid = fluidOutputs[i];
        builder.addFluidOutput(fluid);
    }
    // 魔力输入
    builder.addEnergyPerTickInput(energy);
    // builder.addManaInput(mana,false);
    builder.setMaxThreads(1);
    builder.build();
}
magic_vat_recipe_builder(
    "fluid_sun_0_25",
    [
        <minecraft:glowstone_dust>*4,
        <minecraft:double_plant>
    ],
    [
        <liquid:fire_water>*250
    ],
    [
        <liquid:liquid_sunshine>*1000
    ]
);
magic_vat_recipe_builder(
    "fluid_sun_1",
    [
        <minecraft:glowstone>*4,
        <minecraft:double_plant>
    ],
    [
        <liquid:fire_water>*1000
    ],
    [
        <liquid:liquid_sunshine>*4000
    ]
);
magic_vat_recipe_builder(
    "fire_water_make",
    [
        <minecraft:redstone>*4,
        <minecraft:blaze_powder>*4
    ],
    [
        <liquid:hootch>*4000
    ],
    [
        <liquid:fire_water>*4000
    ]
);
magic_vat_recipe_builder(
    "hootch_make",
    [
        <minecraft:potato>*4,
        <minecraft:sugar>*4
    ],
    [
        <liquid:water>*16000
    ],
    [
        <liquid:hootch>*4000
    ]
);
magic_vat_recipe_builder(
    "cloud_seed_make",
    [
        <thermalfoundation:material:66>*4,
        <minecraft:ice>*4
    ],
    [
        <liquid:water>*7000
    ],
    [
        <liquid:cloud_seed>*7000
    ]
);
magic_vat_recipe_builder(
    "rocket_fuel_make",
    [
        <minecraft:redstone>*4,
        <minecraft:gunpowder>*4
    ],
    [
        <liquid:hootch>*4000
    ],
    [
        <liquid:rocket_fuel>*4000
    ]
);
magic_vat_recipe_builder(
    "vapor_of_levity_make",
    [
        <ore:dustSilver>*4,
        <techreborn:dust:20>*4
    ],
    [
        <liquid:ender_distillation>*4000
    ],
    [
        <liquid:vapor_of_levity>*4000
    ]
);
magic_vat_recipe_builder(
    "ender_distillation_make",
    [
        <ore:dustSilver>*4,
        <techreborn:dust:20>*4
    ],
    [
        <liquid:nutrient_distillation>*16000
    ],
    [
        <liquid:ender_distillation>*4000
    ]
);
magic_vat_recipe_builder(
    "nutrient_distillation_make",
    [
        <ore:foodMeat>*64,
        <minecraft:sugar>*4
    ],
    [
        <liquid:water>*16000
    ],
    [
        <liquid:nutrient_distillation>*4000
    ]
);
magic_vat_recipe_builder(
    "cloud_seed_concentrate",
    [
        <ore:dustElectrum>*4
    ],
    [
        <liquid:cloud_seed>*14000
    ],
    [
        <liquid:cloud_seed_concentrated>*7000
    ]
);
magic_vat_recipe_builder(
    "enpowered_oil_make",
    [
        <actuallyadditions:item_misc:24>*4
    ],
    [
        <liquid:crystaloil>*4000
    ],
    [
        <liquid:empoweredoil>*4000
    ]
);
magic_vat_recipe_builder(
    "crystaloil_make",
    [
        <actuallyadditions:item_misc:23>*4
    ],
    [
        <liquid:refinedcanolaoil>*4000
    ],
    [
        <liquid:crystaloil>*4000
    ]
);
magic_vat_recipe_builder(
    "refined_canolaoil_make",
    [
        <actuallyadditions:item_misc:13>*16
    ],
    [],
    [
        <liquid:canolaoil>*1280
    ]
);