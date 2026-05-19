#loader crafttweaker reloadable
import mods.modularmachinery.RecipeBuilder;
import scripts.enchantwrapper.EnchantUtil.EnchantMap;
import scripts.enchantwrapper.EnchantWrapper.SuperEnchantedItem;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidStack;


function Recipe_Builder_SK_Apiary(
    recipeName as string,
    inputs as crafttweaker.item.IIngredient[],
    outputs as crafttweaker.item.IIngredient[]
    // fluidOutputs as crafttweaker.liquid.ILiquidStack[]
) as void 
{
    val builder = RecipeBuilder.newBuilder(recipeName, "sacred_cinders_apiary", 10);
    // 物品输入
    for item in inputs {
        builder.addItemInput(item).setChance(0.0);
    }
    builder.addFluidInput(<fluid:liquid_sunshine>*25);
    // 物品输出
    for item in outputs {
        builder.addItemOutput(item);
    }
    // 流体输出
    // for fluid in fluidOutputs {
    //     builder.addFluidOutput(fluid);
    // }
    builder.setMaxThreads(1);
    builder.build();
}
//=======================================================================================================
var Bees_extra_to_be_put = [
    [
        <forestry:bee_queen_ge>.withTag(
            {Genome:
                {Chromosomes:
                    [{
                        UID0: "gendustry.bee.Armored",
                        UID1: "gendustry.bee.Armored"
                    }]
                }
            }
        )
    ],
    [
        <forestry:bee_queen_ge>.withTag(
            {Genome: 
                {Chromosomes: 
                [{
                    UID0: "careerbees.quantum_strange",
                    UID1: "careerbees.quantum_strange"}
                ]}
            }
        ),
    ],
    [
        <forestry:bee_queen_ge>.withTag(
            {Genome: 
                {Chromosomes: 
                    [{
                        UID0: "careerbees.quantum_charm",
                        UID1: "careerbees.quantum_charm"
                    }]
                }
            }
        )
    ]
]as IIngredient[][];
var Apiary_Outputs = [
    [
        <contenttweaker:shield_of_terra>*64
    ],
    [
        <careerbees:ingredients:12>*64,
        <careerbees:ingredients:12>*64
    ],
    [
        <careerbees:ingredients:11>*64,
        <careerbees:ingredients:11>*64
    ]
]as IIngredient[][];
// var FluidOutputs = [
//     [
        
//     ],
//     [

//     ],
//     [
        
//     ]
// ]as ILiquidStack[][];
//=======================================================================================================
for i in 0 to Bees_extra_to_be_put.length{
    Recipe_Builder_SK_Apiary(
        "superbee_SK_"+i,
        Bees_extra_to_be_put[i],
        Apiary_Outputs[i]
        // FluidOutputs[i]
    );
}