// This file was auto-generated

const common = @import("isr.zig").vectorCommon;

pub export fn isr0() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x00   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr1() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x01   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr2() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x02   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr3() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x03   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr4() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x04   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr5() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x05   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr6() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x06   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr7() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x07   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr8() callconv(.naked) void {
    asm volatile (
        \\ push $0x08   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr9() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x09   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr10() callconv(.naked) void {
    asm volatile (
        \\ push $0x0A   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr11() callconv(.naked) void {
    asm volatile (
        \\ push $0x0B   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr12() callconv(.naked) void {
    asm volatile (
        \\ push $0x0C   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr13() callconv(.naked) void {
    asm volatile (
        \\ push $0x0D   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr14() callconv(.naked) void {
    asm volatile (
        \\ push $0x0E   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr15() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x0F   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr16() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x10   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr17() callconv(.naked) void {
    asm volatile (
        \\ push $0x11   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr18() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x12   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr19() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x13   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr20() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x14   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr21() callconv(.naked) void {
    asm volatile (
        \\ push $0x15   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr22() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x16   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr23() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x17   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr24() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x18   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr25() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x19   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr26() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x1A   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr27() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x1B   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr28() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x1C   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr29() callconv(.naked) void {
    asm volatile (
        \\ push $0x1D   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr30() callconv(.naked) void {
    asm volatile (
        \\ push $0x1E   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr31() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x1F   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr32() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x20   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr33() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x21   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr34() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x22   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr35() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x23   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr36() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x24   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr37() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x25   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr38() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x26   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr39() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x27   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr40() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x28   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr41() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x29   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr42() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x2A   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr43() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x2B   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr44() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x2C   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr45() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x2D   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr46() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x2E   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr47() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x2F   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr48() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x30   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr49() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x31   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr50() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x32   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr51() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x33   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr52() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x34   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr53() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x35   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr54() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x36   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr55() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x37   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr56() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x38   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr57() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x39   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr58() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x3A   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr59() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x3B   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr60() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x3C   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr61() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x3D   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr62() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x3E   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr63() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x3F   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr64() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x40   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr65() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x41   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr66() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x42   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr67() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x43   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr68() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x44   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr69() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x45   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr70() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x46   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr71() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x47   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr72() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x48   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr73() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x49   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr74() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x4A   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr75() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x4B   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr76() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x4C   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr77() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x4D   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr78() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x4E   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr79() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x4F   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr80() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x50   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr81() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x51   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr82() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x52   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr83() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x53   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr84() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x54   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr85() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x55   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr86() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x56   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr87() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x57   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr88() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x58   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr89() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x59   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr90() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x5A   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr91() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x5B   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr92() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x5C   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr93() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x5D   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr94() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x5E   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr95() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x5F   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr96() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x60   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr97() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x61   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr98() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x62   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr99() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x63   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr100() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x64   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr101() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x65   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr102() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x66   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr103() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x67   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr104() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x68   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr105() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x69   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr106() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x6A   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr107() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x6B   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr108() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x6C   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr109() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x6D   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr110() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x6E   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr111() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x6F   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr112() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x70   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr113() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x71   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr114() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x72   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr115() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x73   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr116() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x74   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr117() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x75   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr118() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x76   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr119() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x77   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr120() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x78   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr121() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x79   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr122() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x7A   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr123() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x7B   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr124() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x7C   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr125() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x7D   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr126() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x7E   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr127() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x7F   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr128() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x80   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr129() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x81   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr130() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x82   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr131() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x83   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr132() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x84   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr133() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x85   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr134() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x86   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr135() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x87   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr136() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x88   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr137() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x89   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr138() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x8A   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr139() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x8B   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr140() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x8C   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr141() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x8D   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr142() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x8E   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr143() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x8F   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr144() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x90   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr145() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x91   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr146() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x92   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr147() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x93   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr148() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x94   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr149() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x95   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr150() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x96   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr151() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x97   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr152() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x98   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr153() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x99   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr154() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x9A   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr155() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x9B   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr156() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x9C   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr157() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x9D   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr158() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x9E   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr159() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0x9F   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr160() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xA0   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr161() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xA1   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr162() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xA2   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr163() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xA3   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr164() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xA4   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr165() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xA5   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr166() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xA6   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr167() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xA7   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr168() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xA8   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr169() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xA9   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr170() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xAA   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr171() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xAB   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr172() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xAC   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr173() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xAD   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr174() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xAE   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr175() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xAF   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr176() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xB0   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr177() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xB1   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr178() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xB2   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr179() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xB3   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr180() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xB4   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr181() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xB5   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr182() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xB6   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr183() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xB7   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr184() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xB8   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr185() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xB9   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr186() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xBA   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr187() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xBB   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr188() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xBC   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr189() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xBD   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr190() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xBE   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr191() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xBF   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr192() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xC0   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr193() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xC1   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr194() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xC2   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr195() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xC3   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr196() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xC4   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr197() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xC5   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr198() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xC6   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr199() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xC7   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr200() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xC8   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr201() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xC9   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr202() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xCA   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr203() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xCB   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr204() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xCC   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr205() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xCD   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr206() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xCE   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr207() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xCF   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr208() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xD0   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr209() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xD1   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr210() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xD2   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr211() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xD3   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr212() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xD4   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr213() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xD5   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr214() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xD6   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr215() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xD7   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr216() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xD8   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr217() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xD9   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr218() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xDA   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr219() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xDB   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr220() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xDC   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr221() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xDD   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr222() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xDE   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr223() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xDF   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr224() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xE0   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr225() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xE1   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr226() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xE2   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr227() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xE3   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr228() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xE4   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr229() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xE5   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr230() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xE6   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr231() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xE7   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr232() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xE8   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr233() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xE9   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr234() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xEA   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr235() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xEB   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr236() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xEC   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr237() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xED   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr238() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xEE   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr239() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xEF   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr240() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xF0   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr241() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xF1   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr242() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xF2   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr243() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xF3   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr244() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xF4   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr245() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xF5   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr246() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xF6   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr247() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xF7   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr248() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xF8   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr249() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xF9   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr250() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xFA   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr251() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xFB   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr252() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xFC   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr253() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xFD   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr254() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xFE   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

pub export fn isr255() callconv(.naked) void {
    asm volatile (
        \\ push $0x00   # push dummy error code
        \\ push $0xFF   # push interrupt number
        \\ jmp %[common:P]
        :
        : [common] "X" (&common),
    );
}

