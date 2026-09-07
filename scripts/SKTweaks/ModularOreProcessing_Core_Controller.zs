#loader crafttweaker reloadable
#priority -9
import mods.ae2enhanced.BlackHole;
// 主控制器
BlackHole.addRecipe(
    <modularmachinery:numeron_network_factory_controller>, 
    [
       <twilightforest:lamp_of_cinders>,
       <draconicevolution:dragon_heart>*2,
       <ae2enhanced:stable_spacetime_manifold>*4,
       <contenttweaker:furnace_heart>*16
    ]
);
<modularmachinery:numeron_network_factory_controller>.addTooltip(format.gold("自带64线程"));
<modularmachinery:numeron_network_factory_controller>.addTooltip(format.gold("各线程默认256并行"));
<modularmachinery:numeron_network_factory_controller>.addTooltip(format.green("可以安装子模块升级"));
<modularmachinery:numeron_network_factory_controller>.addTooltip(format.green("子模块机器必须在指定位置成型"));
<modularmachinery:numeron_network_factory_controller>.addTooltip(format.green("各子模块位置可在主控制器结构中看到提示"));
<modularmachinery:numeron_network_factory_controller>.addTooltip(format.red("(信标基座方块)"));

// 一阶
<modularmachinery:mythic_fractal_core_1_factory_controller>.addTooltip(format.gold("『一阶神话共鸣模块』"));
<modularmachinery:mythic_fractal_core_1_factory_controller>.addTooltip(format.gold("耗能x0.05 速度x20"));
mods.extendedcrafting.CombinationCrafting.addRecipe(<modularmachinery:mythic_fractal_core_1_factory_controller>, 
1000000, 
<modularmachinery:blockcontroller>, 
[<contenttweaker:eden_star>,<contenttweaker:eden_star>,<contenttweaker:eden_star>,<contenttweaker:eden_star>,
<contenttweaker:first_order_mythic_fractal>,<contenttweaker:first_order_mythic_fractal>,
<contenttweaker:first_order_mythic_fractal>,<contenttweaker:first_order_mythic_fractal>,
<tconstruct:large_plate>.withTag({Material: "berserk_steel"}),<tconstruct:large_plate>.withTag({Material: "berserk_steel"})]);
// 二阶
<modularmachinery:mythic_fractal_core_2_factory_controller>.addTooltip(format.gold("『二阶神话共鸣模块』"));
<modularmachinery:mythic_fractal_core_2_factory_controller>.addTooltip(format.gold("允许副产物产出"));
mods.extendedcrafting.CombinationCrafting.addRecipe(<modularmachinery:mythic_fractal_core_2_factory_controller>, 
1000000, 
<modularmachinery:blockcontroller>, 
[<contenttweaker:second_order_mythic_fractal>,<contenttweaker:second_order_mythic_fractal>,
<contenttweaker:second_order_mythic_fractal>,<contenttweaker:second_order_mythic_fractal>,
<contenttweaker:wildwood_star>,<contenttweaker:wildwood_star>,<contenttweaker:wildwood_star>,<contenttweaker:wildwood_star>,
<contenttweaker:crown_of_the_energy_queen>,<contenttweaker:crown_of_the_energy_queen>]);
// 三阶
<modularmachinery:mythic_fractal_core_3_factory_controller>.addTooltip(format.gold("『三阶神话共鸣模块』"));
<modularmachinery:mythic_fractal_core_3_factory_controller>.addTooltip(format.gold("并行数x16 主产物产出x16"));
mods.extendedcrafting.CombinationCrafting.addRecipe(<modularmachinery:mythic_fractal_core_3_factory_controller>, 
1000000, 
<modularmachinery:blockcontroller>, 
[<contenttweaker:third_order_mythic_fractal>,<contenttweaker:third_order_mythic_fractal>,
<contenttweaker:third_order_mythic_fractal>,<contenttweaker:third_order_mythic_fractal>,
<contenttweaker:apalachia_star>,<contenttweaker:apalachia_star>,<contenttweaker:apalachia_star>,<contenttweaker:apalachia_star>,
<appliedenergistics2:creative_energy_cell>,<appliedenergistics2:creative_energy_cell>]);
// 四阶
<modularmachinery:mythic_fractal_core_4_factory_controller>.addTooltip(format.gold("『四阶神话共鸣模块』"));
<modularmachinery:mythic_fractal_core_4_factory_controller>.addTooltip(format.gold("副产物产出x8"));
mods.extendedcrafting.CombinationCrafting.addRecipe(<modularmachinery:mythic_fractal_core_4_factory_controller>, 
1000000, 
<modularmachinery:blockcontroller>, 
[<contenttweaker:fourth_order_mythic_fractal>,<contenttweaker:fourth_order_mythic_fractal>,
<contenttweaker:fourth_order_mythic_fractal>,<contenttweaker:fourth_order_mythic_fractal>,
<contenttweaker:skythern_star>,<contenttweaker:skythern_star>,<contenttweaker:skythern_star>,<contenttweaker:skythern_star>,
<contenttweaker:nightmare_block>,<contenttweaker:nightmare_block>]);
// 五阶
<modularmachinery:mythic_fractal_core_5_factory_controller>.addTooltip(format.gold("『五阶神话共鸣模块』"));
<modularmachinery:mythic_fractal_core_5_factory_controller>.addTooltip(format.gold("耗能x0.05 速度x2 并行数x256"));
mods.extendedcrafting.CombinationCrafting.addRecipe(<modularmachinery:mythic_fractal_core_5_factory_controller>, 
1000000, 
<modularmachinery:blockcontroller>, 
[<contenttweaker:fifth_order_mythic_fractal>,<contenttweaker:fifth_order_mythic_fractal>,
<contenttweaker:fifth_order_mythic_fractal>,<contenttweaker:fifth_order_mythic_fractal>,
<contenttweaker:mortum_star>,<contenttweaker:mortum_star>,<contenttweaker:mortum_star>,<contenttweaker:mortum_star>,
<contenttweaker:ascended_fluix_etcher>,<contenttweaker:ascended_fluix_etcher>]);