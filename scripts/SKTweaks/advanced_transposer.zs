#loader crafttweaker reloadable
#priority 1
import mods.modularmachinery.RecipeBuilder;
import mods.modularmachinery.IMachineController;
import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.data.IData;
import native.net.minecraftforge.fluids.FluidRegistry;
import native.net.minecraftforge.fluids.Fluid;
import native.crafttweaker.api.minecraft.CraftTweakerMC;

val MACHINE = "advanced_transposer";
val fluidMap = FluidRegistry.getRegisteredFluids();
for fluidKey, fluid in fluidMap {
    val fluidName = fluid.getName();
    val nativeFS = FluidRegistry.getFluidStack(fluidName, 1000);
    if (isNull(nativeFS)) continue;
    val fluidStack1000 = CraftTweakerMC.getILiquidStack(nativeFS) as ILiquidStack;
    if (isNull(fluidStack1000)) continue;
    // ============ 1. 桶装（forge:bucketfilled, 1000 mB） ============
    val bucketStack = <forge:bucketfilled>.withTag({
        "FluidName": fluidName,
        "Amount": 1000
    } as IData);
    if (!isNull(bucketStack)) {
        RecipeBuilder.newBuilder("bucket_fill_" + fluidKey.replace(":", "_"), MACHINE, 20)
            .addItemInput(<minecraft:bucket>)
            .addFluidInput(fluidStack1000)
            .addItemOutput(bucketStack)
            .build();
    }

    // ============ 2. 蓄水槽（openblocks:tank, 16000 mB） ============
    val nativeFS16 = FluidRegistry.getFluidStack(fluidName, 16000);
    if (!isNull(nativeFS16)) {
        val fluidStack16000 = CraftTweakerMC.getILiquidStack(nativeFS16) as ILiquidStack;
        if (!isNull(fluidStack16000)) {
            val tankStack = <openblocks:tank>.withTag({
                "tank": {
                    "FluidName": fluidName,
                    "Amount": 16000
                }
            } as IData);
            if (!isNull(tankStack)) {
                RecipeBuilder.newBuilder("tank_fill_" + fluidKey.replace(":", "_"), MACHINE, 20)
                    .addItemInput(<openblocks:tank>)
                    .addFluidInput(fluidStack16000)
                    .addItemOutput(tankStack)
                    .build();
            }
        }
    }

    // ============ 3. 流体单元（techreborn:dynamiccell, 1000 mB） ============
    val cellStack = <techreborn:dynamiccell>.withTag({
        "Fluid": {
            "FluidName": fluidName,
            "Amount": 1000
        }
    } as IData);
    if (!isNull(cellStack)) {
        RecipeBuilder.newBuilder("cell_fill_" + fluidKey.replace(":", "_"), MACHINE, 20)
            .addItemInput(<techreborn:dynamiccell>)
            .addFluidInput(fluidStack1000)
            .addItemOutput(cellStack)
            .build();
    }
}

