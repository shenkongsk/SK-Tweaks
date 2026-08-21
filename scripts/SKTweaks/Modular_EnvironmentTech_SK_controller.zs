import mods.modularmachinery.RecipeBuilder;

scripts.SKTweaks.lib.aaa_function.Recipe_Builder_SK(
    "deep_void_excavator_make",
    "me_mythic_assembler",
    // inputs
    [
        <environmentaltech:structure_frame_6>*128,
        <ore:oreMica>*640,
        <ore:blockLonsdaleite>*640,
        <environmentaltech:modifier_creative_flight>*1,
        <environmentaltech:laser_core>*32,
        <contenttweaker:stable_fusor>*128

    ],
    // fluid inputs
    [
        <liquid:oganesson>*14400,
        <liquid:einstenium>*20000
    ],
    // outputs
    [<modularmachinery:deep_void_excavator_factory_controller>],
    // fluid outputs
    [],
    // time, energy input, energy output
    1000, // 50 秒
    3200000,
    0
);
<modularmachinery:deep_void_excavator_factory_controller>.addTooltip(format.gold("可在科幻方块（ME控制器）上放置透镜"));
<modularmachinery:deep_void_excavator_factory_controller>.addTooltip(format.gold("特殊透镜请搜索：特殊深度虚空采掘透镜"));