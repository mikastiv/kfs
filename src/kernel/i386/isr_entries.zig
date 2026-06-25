const isr = @import("isr.zig").commonEntry;

pub export fn isr0() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x00
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr1() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x01
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr2() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x02
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr3() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x03
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr4() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x04
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr5() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x05
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr6() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x06
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr7() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x07
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr8() callconv(.naked) void {
    asm volatile (
        \\ push $0x08
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr9() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x09
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr10() callconv(.naked) void {
    asm volatile (
        \\ push $0x0A
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr11() callconv(.naked) void {
    asm volatile (
        \\ push $0x0B
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr12() callconv(.naked) void {
    asm volatile (
        \\ push $0x0C
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr13() callconv(.naked) void {
    asm volatile (
        \\ push $0x0D
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr14() callconv(.naked) void {
    asm volatile (
        \\ push $0x0E
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr15() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x0F
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr16() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x10
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr17() callconv(.naked) void {
    asm volatile (
        \\ push $0x11
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr18() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x12
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr19() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x13
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr20() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x14
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr21() callconv(.naked) void {
    asm volatile (
        \\ push $0x15
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr22() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x16
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr23() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x17
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr24() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x18
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr25() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x19
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr26() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x1A
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr27() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x1B
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr28() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x1C
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr29() callconv(.naked) void {
    asm volatile (
        \\ push $0x1D
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr30() callconv(.naked) void {
    asm volatile (
        \\ push $0x1E
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr31() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x1F
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr32() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x20
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr33() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x21
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr34() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x22
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr35() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x23
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr36() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x24
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr37() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x25
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr38() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x26
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr39() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x27
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr40() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x28
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr41() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x29
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr42() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x2A
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr43() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x2B
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr44() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x2C
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr45() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x2D
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr46() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x2E
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr47() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x2F
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr48() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x30
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr49() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x31
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr50() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x32
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr51() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x33
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr52() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x34
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr53() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x35
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr54() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x36
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr55() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x37
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr56() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x38
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr57() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x39
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr58() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x3A
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr59() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x3B
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr60() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x3C
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr61() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x3D
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr62() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x3E
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr63() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x3F
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr64() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x40
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr65() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x41
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr66() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x42
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr67() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x43
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr68() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x44
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr69() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x45
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr70() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x46
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr71() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x47
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr72() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x48
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr73() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x49
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr74() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x4A
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr75() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x4B
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr76() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x4C
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr77() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x4D
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr78() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x4E
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr79() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x4F
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr80() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x50
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr81() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x51
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr82() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x52
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr83() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x53
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr84() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x54
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr85() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x55
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr86() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x56
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr87() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x57
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr88() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x58
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr89() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x59
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr90() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x5A
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr91() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x5B
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr92() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x5C
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr93() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x5D
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr94() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x5E
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr95() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x5F
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr96() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x60
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr97() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x61
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr98() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x62
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr99() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x63
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr100() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x64
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr101() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x65
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr102() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x66
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr103() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x67
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr104() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x68
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr105() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x69
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr106() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x6A
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr107() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x6B
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr108() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x6C
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr109() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x6D
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr110() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x6E
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr111() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x6F
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr112() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x70
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr113() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x71
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr114() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x72
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr115() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x73
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr116() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x74
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr117() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x75
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr118() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x76
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr119() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x77
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr120() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x78
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr121() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x79
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr122() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x7A
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr123() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x7B
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr124() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x7C
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr125() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x7D
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr126() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x7E
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr127() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x7F
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr128() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x80
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr129() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x81
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr130() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x82
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr131() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x83
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr132() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x84
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr133() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x85
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr134() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x86
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr135() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x87
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr136() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x88
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr137() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x89
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr138() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x8A
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr139() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x8B
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr140() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x8C
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr141() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x8D
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr142() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x8E
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr143() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x8F
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr144() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x90
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr145() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x91
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr146() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x92
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr147() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x93
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr148() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x94
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr149() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x95
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr150() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x96
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr151() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x97
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr152() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x98
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr153() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x99
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr154() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x9A
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr155() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x9B
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr156() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x9C
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr157() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x9D
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr158() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x9E
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr159() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0x9F
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr160() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xA0
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr161() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xA1
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr162() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xA2
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr163() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xA3
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr164() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xA4
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr165() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xA5
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr166() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xA6
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr167() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xA7
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr168() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xA8
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr169() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xA9
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr170() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xAA
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr171() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xAB
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr172() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xAC
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr173() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xAD
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr174() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xAE
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr175() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xAF
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr176() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xB0
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr177() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xB1
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr178() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xB2
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr179() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xB3
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr180() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xB4
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr181() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xB5
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr182() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xB6
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr183() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xB7
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr184() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xB8
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr185() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xB9
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr186() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xBA
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr187() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xBB
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr188() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xBC
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr189() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xBD
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr190() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xBE
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr191() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xBF
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr192() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xC0
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr193() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xC1
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr194() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xC2
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr195() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xC3
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr196() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xC4
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr197() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xC5
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr198() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xC6
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr199() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xC7
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr200() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xC8
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr201() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xC9
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr202() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xCA
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr203() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xCB
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr204() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xCC
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr205() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xCD
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr206() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xCE
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr207() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xCF
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr208() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xD0
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr209() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xD1
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr210() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xD2
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr211() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xD3
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr212() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xD4
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr213() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xD5
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr214() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xD6
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr215() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xD7
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr216() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xD8
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr217() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xD9
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr218() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xDA
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr219() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xDB
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr220() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xDC
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr221() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xDD
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr222() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xDE
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr223() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xDF
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr224() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xE0
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr225() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xE1
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr226() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xE2
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr227() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xE3
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr228() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xE4
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr229() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xE5
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr230() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xE6
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr231() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xE7
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr232() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xE8
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr233() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xE9
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr234() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xEA
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr235() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xEB
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr236() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xEC
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr237() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xED
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr238() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xEE
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr239() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xEF
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr240() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xF0
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr241() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xF1
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr242() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xF2
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr243() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xF3
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr244() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xF4
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr245() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xF5
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr246() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xF6
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr247() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xF7
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr248() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xF8
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr249() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xF9
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr250() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xFA
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr251() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xFB
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr252() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xFC
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr253() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xFD
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr254() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xFE
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

pub export fn isr255() callconv(.naked) void {
    asm volatile (
        \\ push $0x00
        \\ push $0xFF
        \\ jmp %[isr:P]
        :
        : [isr] "X" (&isr),
    );
}

