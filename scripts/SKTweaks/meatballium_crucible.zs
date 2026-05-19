import mods.modularmachinery.FactoryRecipeThread;
import mods.modularmachinery.FactoryRecipeFinishEvent;
import mods.modularmachinery.RecipeCheckEvent;
import mods.modularmachinery.MachineModifier;
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.MMEvents;
import mods.modularmachinery.ControllerGUIRenderEvent;

MachineModifier.setInternalParallelism("meatballium_crucible", 256);
<modularmachinery:meatballium_crucible_controller>.addTooltip(format.gold("内置额外256并行！"));

var MachineName = "meatballium_crucible";
val recipes = [
    [<liquid:possessed_starlight>*1000,<liquid:whispering_starlight>*1000],
    [<liquid:unholy_radioactive_mix>*100,<liquid:einstenium>*100],
    [<liquid:infinitely_unholy_radioactive_mix>*150,<liquid:einstenium>*5000],
    [<liquid:vital_lymph>*5000,<liquid:lymph_of_pixonia>*100000],
    [<liquid:primal_ogerite>*1000,<liquid:lymph_of_pixonia>*1000],
    [<liquid:polonium>*100,<liquid:spent_polonium>*100],
    [<liquid:exhaust_steam>*10000,<liquid:condensate_water>*500],
    [<liquid:low_quality_steam>*10000,<liquid:condensate_water>*250],
    [<liquid:high_particulate_steam>*150,<liquid:fluid_crystal_matrix>*100],
    [<liquid:salt_water>*1000,<liquid:mineral_water>*600],
    [<liquid:mineral_water>*1000,<liquid:wet_steam>*2000],
    [<liquid:steam>*2000,<liquid:high_pressure_steam>*2000],
    [<liquid:nak_hot>*2000,<liquid:nak>*2000]
];

for i, recipe in recipes {
    scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "whispering_starlight_make_"+i,
    MachineName,
    [],
    [recipe[0]],
    [],
    [recipe[1]],
    400,
    2000000,
    0
    );
}
