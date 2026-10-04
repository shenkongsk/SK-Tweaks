#loader crafttweaker reloadable
#loader contenttweaker
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Fluid;
import crafttweaker.item.IItemStack;
import mods.contenttweaker.CreativeTab;

/**
 * 注册一个 ContentTweaker 流体
 * @param fluidId           流体 ID（全小写，字母开头，可含数字和下划线）
 * @param color             RGB 颜色，如 0xFF69B4
 * @param temperature       温度（默认 300，水=300，熔岩=1300）
 * @param viscosity         粘度（默认 1000，水=1000，熔岩=3000）
 * @param density           密度（默认 1000，水=1000，熔岩=3000）
 * @param luminosity        亮度（默认 0）
 * @param vaporize          下界是否蒸发（默认 false）
 * @param colorize          是否受颜色参数染色（默认 true）
 * @param stillLocation     静止材质路径（默认 "contenttweaker:fluids/fluid"）
 * @param flowingLocation   流动材质路径（默认 "contenttweaker:fluids/fluid_flow"）
 * @param material          材质类型（默认 <blockmaterial:water>，熔岩风格用 <blockmaterial:lava>）
 * @param gaseous           是否气态（默认 false）
 */
static SKT_Fluid as CreativeTab = VanillaFactory.createCreativeTab(
    "SKT_Fluid",<item:randomthings:reinforcedenderbucket>
);
function registerFluid(
    fluidId as string,
    color as int,
    temperature as int,
    viscosity as int,
    density as int ,
    luminosity as int,
    vaporize as bool,
    colorize as bool,
    material as int,
    gaseous as bool
) as void {
    var FluidMaterial = material;
    val fluid = VanillaFactory.createFluid(fluidId, color);
    fluid.temperature = temperature;
    fluid.viscosity = viscosity;
    fluid.density = density;
    fluid.luminosity = luminosity;
    fluid.vaporize = vaporize;
    fluid.colorize = colorize;
    fluid.stillLocation = "contenttweaker:fluids/SKTweaks/" + fluidId;
    fluid.flowingLocation = "contenttweaker:fluids/SKTweaks/" + fluidId + "_flow";
    if(material == 0) {
        fluid.material = <blockmaterial:water>;
    }else{
        fluid.material = <blockmaterial:lava>;
    }
    fluid.gaseous = gaseous;
    fluid.register();
}
// registerFluid(
//     "stable_space",
//     0xdf5403,
//     300,
//     1000,
//     1000,
//     8,
//     false,
//     false,
//     1,
//     false
// );
// registerFluid(
//     "stable_time",
//     0x0357df,
//     300,
//     1000,
//     1000,
//     8,
//     false,
//     false,
//     1,
//     false
// );
// registerFluid(
//     "asended_adenosinetriphosphate",
//     0x5edb3b,
//     300,
//     1000,
//     1000,
//     8,
//     false,
//     false,
//     1,
//     false
// );
// registerFluid(
//     "pure_dream_energy",
//     0x03dfa1,
//     300,
//     1000,
//     1000,
//     16,
//     false,
//     false,
//     1,
//     false
// );
val fluid_name as int[string]$orderly = {
    "stable_space" : 0xdf5403,
    "stable_time": 0x0357df,
    "asended_adenosinetriphosphate" : 0x5edb3b,
    "pure_dream_energy" : 0x03dfa1,
    "infinite_eezo_mix" : 0x03dfa1,
    "stable_eezo_mix" : 0x03dfa1,
    "pure_eezo_mix" : 0x03dfa1,
    // // 更多低语
    // "whisper_of_chinesesword" : 0xD83A20,
    // "whisper_of_x_zhangjun" : 0xF19E40,
    // "whisper_of_nerdyspider" : 0xA1817F,
    // "whisper_of_zy" : 0x6CBDFF,
    // "whisper_of_sainagh" : 0x4A0600,
    // // 更多低语
    "mythical_mix" : 0x03dfa1
};
for fluid,color in fluid_name {
    registerFluid(
        fluid,
        color,
        300,
        1000,
        1000,
        8,
        false,
        false,
        1,
        false
    );
}

function register_Colored_Fluid(
    fluidId as string,
    fluidtexturebase as string,
    color as int,
    viscosity as int,
    density as int ,
    luminosity as int,
    vaporize as bool,
    colorize as bool,
    material as int,
    gaseous as bool
) as void {
    var FluidMaterial = material;
    val fluid = VanillaFactory.createFluid(fluidId, color);
    fluid.viscosity = viscosity;
    fluid.density = density;
    fluid.luminosity = luminosity;
    fluid.vaporize = vaporize;
    fluid.colorize = colorize;
    fluid.stillLocation = "contenttweaker:fluids/SKTweaks/" + fluidtexturebase;
    fluid.flowingLocation = "contenttweaker:fluids/SKTweaks/" + fluidtexturebase + "_flow";
    if(material == 0) {
        fluid.material = <blockmaterial:water>;
    }else{
        fluid.material = <blockmaterial:lava>;
    }
    fluid.gaseous = gaseous;
    fluid.register();
}

val whisper_name as int[string]$orderly = {
    // 更多低语
    "whisper_of_chinesesword" : 0xD83A20,   // #D83A20
    "whisper_of_x_zhangjun" : 0xF19E40,     // #F19E40
    "whisper_of_nerdyspider" : 0xA1817F,    // #4875dc
    "whisper_of_zy" : 0x6CBDFF,             // #6CBDFF
    "whisper_of_sainagh" : 0x4A0600         // #4A0600
    // 更多低语
};
for fluid,color in whisper_name {
    register_Colored_Fluid(
        fluid,
        "more_whisper_base",
        color,
        1000,
        1000,
        8,
        false,
        true,
        0,
        true
    );
}