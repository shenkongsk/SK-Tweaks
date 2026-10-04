#loader crafttweaker reloadable
#loader contenttweaker

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.IItemRightClick;
import mods.contenttweaker.Commands;
import mods.contenttweaker.Fluid;
import mods.contenttweaker.Color;
import mods.contenttweaker.Block;
import mods.contenttweaker.MaterialSystem;
import mods.contenttweaker.MaterialBuilder;
import mods.contenttweaker.IItemStackSupplier;
import crafttweaker.item.IItemStack;
import mods.contenttweaker.CreativeTab;
import mods.modularmachinery.StatedMachineComponentBuilder;




// 创造模式标签
// static SKT as CreativeTab = VanillaFactory.createCreativeTab("§dSKTweaks", <minecraft:nether_star>);
// SKT.register();
static SKT as CreativeTab = VanillaFactory.createCreativeTab(
    "SKT",<item:tardis:tardis_coral>
);
SKT.register();
function simple_register_item(
    name as string
) {
    var item = VanillaFactory.createItem(name);
    item.maxStackSize = 64;
    item.beaconPayment = false;
    item.creativeTab = <creativetab:SKT>;
    item.register();
}

var ItemList = [
    "eezo_ore",
    "refined_eezo",
    "eezo_energy_unit",
    "etherium_plate",
    "eternal_glory",
    "unleashed_star_ingot",
    "defined_egg",
    "balanced_ingot",
    "harmonic_crystal",
    "taint_crystal",
    "harmonic_ingot",
    "taint_ingot",
    "binding_taint_ingot",
    "ingot_of_harmony",
    "eye_of_harmony_power_unit_hypercharged",
    "destined_ingot",
    "aerial_automaton",
    "triune_homunculus",
    "paradoxical_star",
    "eternal_piece",// 永恒碎片
    "hyperdense_matter",    // 超致密物质
    "everfree_steel_ingot",       // 永恒自由钢锭
    "fractal_containment_vessel", // 分形束缚容器
    "solid_time",    // 凝固时间
    "negentropy_dimensional_fractal_minus_first_order",// 逆熵维度分形 壹
    "negentropy_dimensional_fractal_minus_second_order",
    "negentropy_dimensional_fractal_minus_third_order",
    "negentropy_dimensional_fractal_minus_fourth_order", 
    "negentropy_dimensional_fractal_minus_fifth_order",
    "zero_point_fractal",    // 零点分形,
    "cryotheum_myrmex_coolant_cell", // 极寒恐蚁冷却单元
    "naquadriah_ingot",  //高能硅岩金属
    "exotic_dross",   // 异域残渣
    "alfheim_ingot",   // 亚尔夫海姆锭
    "hyperdimensional_conponent",   // 超维度组件
    "hyper_dense_dirt",   // 超致密泥土
    "dream_energy_link_card" // 梦之能量连接卡
    
];
for i in 0 to ItemList.length {
    simple_register_item(ItemList[i]);
}
function simple_register_block(
    name as string,
    istransparent as bool,
    isbeacon as bool,
    iswitherProof as bool,
    BlockHardness as float,
    BlockLayer as string
) {
    var block = VanillaFactory.createBlock(name, <blockmaterial:iron>);
    block.blockHardness = BlockHardness;
    block.blockResistance = 5.0;
    block.beaconBase = isbeacon;
    block.toolClass = "pickaxe";
    block.toolLevel = 2;
    block.blockSoundType = <soundtype:metal>;
    block.slipperiness = 0.6;
    block.creativeTab = <creativetab:SKT>;
    block.translucent = istransparent;
    block.witherProof = iswitherProof;
    block.blockLayer = BlockLayer;
    block.register();
}
// 七结局核心
simple_register_block("core_astral",true,true,true,9.0,"TRANSLUCENT");
simple_register_block("core_avartia",false,true,true,9.0,"SOLID");
simple_register_block("core_blackhole",false,true,true,9.0,"SOLID");
simple_register_block("core_cosmos",false,true,true,9.0,"SOLID");
simple_register_block("core_dark",false,true,true,9.0,"SOLID");
simple_register_block("core_pure",false,true,true,9.0,"SOLID");
simple_register_block("core_eternal",false,true,true,9.0,"SOLID");
// 零点空间核心
simple_register_block("zero_point_spatial_core",false,false,true,15.0,"SOLID");
// 至上力共鸣核心
simple_register_block("one_power_resonate_core",false,false,true,15.0,"SOLID");
// 束缚共鸣核心
simple_register_block("binding_resonate_core",false,false,true,15.0,"SOLID");
// 束缚恒星外壳
simple_register_block("leashed_star_casing",false,false,true,10.0,"SOLID");
// 束缚恒星导管
simple_register_block("leashed_star_conduit",false,false,true,10.0,"SOLID");
// 暗物质框架
simple_register_block("dark_matter_frame",false,false,true,20.0,"SOLID");
// 平衡机械导管
simple_register_block("balanced_machine_conduit",false,false,true,20.0,"SOLID");
// 平衡机械框架
simple_register_block("balanced_machine_frame",false,false,true,20.0,"SOLID");
// 强化零素外壳
simple_register_block("reinforced_eezo_casing",false,false,true,40.0,"SOLID");
// 超维度机械外壳
simple_register_block("hyperdimensional_casing",false,false,true,40.0,"SOLID");
// 超维度竖梁
simple_register_block("hyperdimensional_beam",false,false,true,40.0,"SOLID");
// 扭曲控制组件
simple_register_block("twisting_control_component",false,false,true,40.0,"SOLID");
// 异域能量组件
simple_register_block("exotic_energy_component",false,false,true,40.0,"SOLID");
StatedMachineComponentBuilder.newBuilder("my_machine_casing")
    .build();