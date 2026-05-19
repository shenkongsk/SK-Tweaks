#loader crafttweaker reloadable
import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.RecipeAdapterBuilder;
import mods.modularmachinery.RecipeModifierBuilder;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;

val MACHINE = "quantum_catalytic_reactor_array";
MachineModifier.setMaxThreads("quantum_catalytic_reactor_array", 0);
val threadA = FactoryRecipeThread.createCoreThread("§9催化核心I");
val threadB = FactoryRecipeThread.createCoreThread("§9催化核心II");
val threadC = FactoryRecipeThread.createCoreThread("§9催化核心III");
val threadD = FactoryRecipeThread.createCoreThread("§9催化核心IV");
val threadE = FactoryRecipeThread.createCoreThread("§9催化核心V");
MachineModifier.addCoreThread(MACHINE, threadA);
MachineModifier.addCoreThread(MACHINE, threadB);
MachineModifier.addCoreThread(MACHINE, threadC);
MachineModifier.addCoreThread(MACHINE, threadD);
MachineModifier.addCoreThread(MACHINE, threadE);
MachineModifier.setInternalParallelism("quantum_catalytic_reactor_array", 256);
<modularmachinery:quantum_catalytic_reactor_array_factory_controller>.addTooltip(format.gold("内置额外256并行！"));
<modularmachinery:quantum_catalytic_reactor_array_factory_controller>.addTooltip(format.gold("内置5线程"));
<modularmachinery:quantum_catalytic_reactor_array_factory_controller>.addTooltip(format.gold("3x3的龙研能量核心稳定器可能需手动放置"));
// 输入
// ============================================
var Recipe_Input_Item = [
    [
        <ore:dustSulfur>*16,
        <ore:sand>*1
    ],
    [],[],
    [
        <nuclearcraft:gem_dust:5>*16,
        <ore:dustSulfur>*16
    ],
    [
        <nuclearcraft:ingot:5>*16
    ],
    [
        <ore:salt>*2317
    ],
    [
        <nuclearcraft:gem_dust:9>*16
    ],
    [
        <thermalfoundation:material:1026>*16
    ],
    [
        <ore:dustPlutonium>*108,
        <ore:salt>*40
    ],
    [
        <thaumcraft:nugget:10>*16
    ],
    [
        <avaritia:resource:2>*2,
        <ore:ingotLithium>*3
    ]
];
var Recipe_Input_Fluid = [
    [
        <liquid:water>*16000
    ],
    [
        <liquid:water>*10000,
        <liquid:fluorine>*9500
    ],
    [
        <liquid:hydrogen>*16000,
        <liquid:fluorine>*16000
    ],
    [
        <liquid:water>*32000,
    ],
    [
        <liquid:water>*96000,
    ],
    [
        <liquid:water>*8700
    ],
    [
        <liquid:water>*16000
    ],
    [
        <liquid:cryotheum>*2000
    ],
    [
        <liquid:plasma>*120
    ],
    [] as ILiquidStack[],
    [] as ILiquidStack[]
];
// ============================================
// 输出
// ============================================
var Recipe_Output_Item = [
    [] as IIngredient[],
    [] as IIngredient[],
    [] as IIngredient[],
    [
        <nuclearcraft:compound>*16
    ],
    [] as IIngredient[],
    [] as IIngredient[],
    [] as IIngredient[],
    [] as IIngredient[],
    [
        <nuclearcraft:plutonium:4>*108
    ],
    [] as IIngredient[],
    [
        <nuclearcraft:lithium:2>*8
    ]

];
var Recipe_Output_Fluid = [
    [
        <liquid:sulfuric_acid>*16000,
        <liquid:hydrogen>*15200,
        <liquid:deuterium>*800
    ],
    [
        <liquid:hydrofluoric_acid>*19000,
        <liquid:deuterium>*500,
        <liquid:oxygen>*5000
    ],
    [
        <liquid:hydrofluoric_acid>*32000
    ],
    [
        <liquid:hydrofluoric_acid>*32000,
        <liquid:hydrogen>*15200,
        <liquid:deuterium>*800
    ],
    [
        <liquid:boric_acid>*32000,
        <liquid:hydrogen>*48000
    ],
    [
        <liquid:fluidchlorite>*16720,
        <liquid:hydrochloric_acid>*15700,
        <liquid:sodium>*16780,
        <liquid:francium>*10170,
        <liquid:bromine>*10170,
        <liquid:deuterium>*9600,
        <liquid:oxygen>*8500,
        <liquid:chlorine>*26000
    ],
    [
        <liquid:potassium>*2304,
        <liquid:hydrofluoric_acid>*16000,
        <liquid:oxygen>*8000
    ],
    [
        <liquid:nitrogen>*2800,
        <liquid:oxygen>*800,
        <liquid:argon>*400,
        <liquid:neon>*200,
        <liquid:krypton>*2000,
        <liquid:xenon>*2000
    ],
    [
        <liquid:rutherfordium>*960,
        <liquid:sodium>*120,
        <liquid:francium>*180,
        <liquid:bromine>*180
    ],

    [
        <liquid:yttrium>*1600,
        <liquid:barium>*1152
    ],
    [
        <liquid:decomposed_matter>*100
    ]
];
// ============================================
// 时间和能量
// ============================================
// var Recipe_Consume_Time = [
//     -1,-1,-1,-1
// ];
// var Recipe_Energy_Input = [
//     -1,-1,-1,-1
// ];
// ============================================
for i in 0 to Recipe_Input_Item.length{
    var Time_Consume = 200;
    var Energy_Input = 8192000;
    
    // if (Recipe_Consume_Time.length > i && Recipe_Consume_Time[i] > 0) {
    //     Time_Consume = Recipe_Consume_Time[i];
    // }
    // if (Recipe_Energy_Input.length > i && Recipe_Energy_Input[i] > 0) {
    //     Energy_Input = Recipe_Energy_Input[i];
    // }
    scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK_Chance(
        "quantum_catalytic_reactor_array_recipe_" + i,
        MACHINE,
        // item inputs - chances
        Recipe_Input_Item[i],
        [],
        // fluid inputs - chances
        Recipe_Input_Fluid[i],
        [],
        // outputs - chances
        Recipe_Output_Item[i],
        [],
        // fluid outputs - chances
        Recipe_Output_Fluid[i],
        [],
        // time, energy input, energy output
        Time_Consume,
        Energy_Input,
        0
    );
}