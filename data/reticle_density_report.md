# wafer.space GF180MCU Run 2 — Standard Cell & SRAM Density Report

**GF180MCU Process (GlobalFoundries 180nm), Shuttle G802**

## Introduction

This report analyzes the standard cell and SRAM density achieved by the 40 unique public chip designs on the wafer.space GF180MCU Run 2 reticle. The reticle has 54 slots; the public layout contains 43 slot placements (some designs appear more than once, and private designs are not included).

All designs were fabricated on GlobalFoundries' GF180MCU process, a 180-nanometer (0.18um) technology node. This is a mature, relatively large-geometry process — for comparison, modern smartphone chips use 3nm or 5nm processes with features roughly 50x smaller.

> **Note on counting methodology:** All standard cell counts in this report count only **logic cells** — cells that perform actual computation (gates, flip-flops, buffers, multiplexers, etc.). Infrastructure cells are excluded: filler cells (fill, fillcap, endcap, filltie), well taps, antenna fix diodes, ESD diodes, and tie-high/tie-low cells. These infrastructure cells are inserted by automated tools to satisfy manufacturing rules but perform no logic function. On this reticle there are 6.8M infrastructure cell instances and 2.4M logic cell instances across the unique designs — 2.8 infrastructure cells for every logic cell.

## What Are Standard Cells?

A "standard cell" is a pre-designed, pre-verified building block used to construct digital circuits. Think of them like LEGO bricks for chip design: each cell performs one simple logic function (an AND gate, a flip-flop for storing one bit, a buffer for boosting signal strength), and a chip designer assembles thousands or millions of them to build complex circuits.

Standard cells in a library all share the same height (so they line up in rows) but vary in width depending on their function. Automated tools place these cells in rows and then route wires between them.

The "density" of standard cells — how many fit per square millimeter — is a key measure of how efficiently a design uses its silicon area. Higher density generally means more logic functionality packed into less chip area, which reduces cost.

## Standard Cell Libraries on This Reticle

| Library | Row Height | Rows per mm | Relative Density | Logic instances | Share |
|---|---|---|---|---|---|
| [as_sc_mcu7t3v3 (AS 7-track, 3.3V)](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | 3.92 um | 255 rows | 100% | 1.3M | 53% |
| [mcu7t5v0 (7-track, 5V)](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | 3.92 um | 255 rows | 100% | 1.1M | 45% |
| [mcu9t5v0 (9-track, 5V)](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu9t5v0/index.html) | 5.04 um | 198 rows | 78% | 46k | 2% |
| [as_ex_mcu7t5v0 (AS extra 7-track, 5V)](https://github.com/AvalonSemiconductors/gf180mcu_as_ex_mcu7t5v0) | 3.92 um | 255 rows | 100% | 2k | <1% |

Row height is the height of the cells' placement boundary, which is what rows are stacked at. Taller rows hold fewer cells per mm² but leave more room for wiring inside the cell.

Most designs use one library exclusively. The designs that mix libraries are: [T0P3](https://wafer.space/ws-run2/projects/T0P3.html) (94k [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) + 25k [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3)); [T26B](https://wafer.space/ws-run2/projects/T26B.html) (154k [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) + 2k [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3)); [WSLG](https://wafer.space/ws-run2/projects/WSLG.html) (13k [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) + 2k [AS extra 7t-5V](https://github.com/AvalonSemiconductors/gf180mcu_as_ex_mcu7t5v0)).

## Theoretical Maximum Standard Cell Density

If you filled an entire square millimeter with nothing but one type of logic standard cell (no wiring, no gaps, no infrastructure cells), the theoretical maximum density would be:

| Cell Type | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | [9t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu9t5v0/index.html) | [AS extra 7t-5V](https://github.com/AvalonSemiconductors/gf180mcu_as_ex_mcu7t5v0) | What it does |
|---|---|---|---|---|---|
| Inverter | 114k/mm² ([`inv_2`](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3), 2.24um) | 114k/mm² ([`inv_1`](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/cells/inv/gf180mcu_fd_sc_mcu7t5v0__inv_1.html), 2.24um) | 89k/mm² ([`inv_1`](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu9t5v0/cells/inv/gf180mcu_fd_sc_mcu9t5v0__inv_1.html), 2.24um) | — | Flips a signal |
| NAND gate | 65k/mm² ([`nand2_2`](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3), 3.92um) | 91k/mm² ([`nand2_1`](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/cells/nand2/gf180mcu_fd_sc_mcu7t5v0__nand2_1.html), 2.80um) | 71k/mm² ([`nand2_1`](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu9t5v0/cells/nand2/gf180mcu_fd_sc_mcu9t5v0__nand2_1.html), 2.80um) | — | Basic logic gate |
| Buffer | 76k/mm² ([`buff_2`](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3), 3.36um) | 76k/mm² ([`buf_1`](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/cells/buf/gf180mcu_fd_sc_mcu7t5v0__buf_1.html), 3.36um) | 59k/mm² ([`buf_1`](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu9t5v0/cells/buf/gf180mcu_fd_sc_mcu9t5v0__buf_1.html), 3.36um) | — | Strengthens a signal |
| Flip-flop | 17k/mm² ([`dfxtp_2`](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3), 15.12um) | 16k/mm² ([`dffq_1`](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/cells/dffq/gf180mcu_fd_sc_mcu7t5v0__dffq_1.html), 16.24um) | 13k/mm² ([`dffq_1`](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu9t5v0/cells/dffq/gf180mcu_fd_sc_mcu9t5v0__dffq_1.html), 15.68um) | 14k/mm² ([`dfxtp_2`](https://github.com/AvalonSemiconductors/gf180mcu_as_ex_mcu7t5v0), 18.48um) | Stores one bit |

These are hard upper bounds — the density if you packed cells edge-to-edge with zero routing overhead. For each library the smallest cell of that kind is used; the 3.3V library has no drive strength 1 cells, so its smallest cells are the `_2` variants.

In practice, real designs achieve significantly less because:

- **(a) Routing overhead** — wires connecting cells need room, which limits how tightly cells can be placed
- **(b) Infrastructure cells** — fillers, taps, antenna diodes, and tie cells make up 74% of cell instances on this reticle
- **(c) Mixed cell types** — designs use a mix of small and large cells
- **(d) Power planning** — power/ground straps consume area
- **(e) Clock distribution** — clock tree buffers and wiring take space

## Achieved Standard Cell Density — Design Averages

The following tables show the average logic standard cell density for each design's "core area" — the interior of the chip excluding the I/O pad ring (a 442um border of large pads around the perimeter used for external connections).

"% of max" compares against the buffer theoretical maximum for the design's primary library. "Cell area" is the share of the core area actually covered by logic cells — the placement utilisation of the die as a whole, including any area left empty or given to SRAM.

### High Density (above 10k logic SC/mm² core average)

| Design | Library | Core SC/mm² | % of max | Cell area | Logic SC | SRAM | Project |
|---|---|---|---|---|---|---|---|
| [CLON](https://wafer.space/ws-run2/projects/CLON.html) | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | 25k | 33% | 58% | 324k | 0 | [Cloneless2](https://github.com/ThorbenMoos/Cloneless2) |
| [TQVA](https://wafer.space/ws-run2/projects/TQVA.html) | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | 21k | 27% | 47% | 36k | 1 | [TinyQV - Crowdsourced RISC-V SoC](https://github.com/MichaelBell/ws01-tinyQV) |
| [BTX1](https://wafer.space/ws-run2/projects/BTX1.html) | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | 20k | 26% | 47% | 253k | 19 | BTX |
| [DPK2](https://wafer.space/ws-run2/projects/DPK2.html) | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | 19k | 25% | 40% | 33k | 0 | [cordic-romless-x8](https://github.com/dpks2003/cordic-romless) |
| [SCUP](https://wafer.space/ws-run2/projects/SCUP.html) | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | 19k | 24% | 53% | 239k | 0 | [GF180MCU Peripherals](https://github.com/sifferman/gf180mcu-peripherals) |
| [MOLE](https://wafer.space/ws-run2/projects/MOLE.html) | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | 16k | 22% | 53% | 212k | 13 | [FABulous FPGA](https://github.com/mole99/wsrun2-fabulous-fpga) |
| [DPK1](https://wafer.space/ws-run2/projects/DPK1.html) | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | 15k | 20% | 33% | 66k | 8 | [bio180](https://github.com/dpks2003/bio-core) |
| [TQVE](https://wafer.space/ws-run2/projects/TQVE.html) | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | 14k | 18% | 40% | 24k | 10 | TinyQV - RISC-V SoC with experimental pad setup |
| [TQVD](https://wafer.space/ws-run2/projects/TQVD.html) | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | 14k | 18% | 37% | 24k | 5 | [TinyQV - RISC-V SoC with HDMI output](https://github.com/MichaelBell/ws02-tinyQV) |
| [EURO](https://wafer.space/ws-run2/projects/EURO.html) | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | 14k | 18% | 34% | 68k | 0 | [EuroSynth](https://github.com/anfroholic/eurosynth) |
| [T26B](https://wafer.space/ws-run2/projects/T26B.html) | mixed | 12k | 16% | 35% | 156k | custom | [Tiny Tapeout GF 26b](https://github.com/TinyTapeout/tinytapeout-gf-26b) |
| [T26A](https://wafer.space/ws-run2/projects/T26A.html) | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | 11k | 15% | 33% | 144k | 2 | [Tiny Tapeout GF 26a](https://github.com/TinyTapeout/tinytapeout-gf-26a) |
| [CAB1](https://wafer.space/ws-run2/projects/CAB1.html) | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | 10k | 14% | 29% | 52k | 6 | [Cabrera CoB](https://github.com/ZeduloTech/Cabrera) |

### Medium Density (3k–10k logic SC/mm² core average)

| Design | Library | Core SC/mm² | % of max | Cell area | Logic SC | SRAM | Project |
|---|---|---|---|---|---|---|---|
| [NAX1](https://wafer.space/ws-run2/projects/NAX1.html) | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | 10k | 13% | 27% | 50k | 12 | [Naxos CoB](https://github.com/ZeduloTech/Naxos) |
| [SCTP](https://wafer.space/ws-run2/projects/SCTP.html) | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | 10k | 13% | 26% | 125k | 17 | [SlugTPU](https://github.com/SlugTPU/gf180mcu-slugtpu) |
| [T0P3](https://wafer.space/ws-run2/projects/T0P3.html) | mixed | 9k | 12% | 27% | 119k | 1 | [Tiny Tapeout GF 0.3](https://github.com/TinyTapeout/tinytapeout-gf-0p3) |
| [SCML](https://wafer.space/ws-run2/projects/SCML.html) | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | 9k | 11% | 25% | 111k | 38 | [ML-Audio SC](https://github.com/kjconway5/ML-Audio) |
| [TQVC](https://wafer.space/ws-run2/projects/TQVC.html) | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | 7k | 9% | 16% | 36k | 1 | [TinyQV - Crowdsourced RISC-V SoC (1x0.5)](https://github.com/MichaelBell/ws01-tinyQV) |
| [GD04](https://wafer.space/ws-run2/projects/GD04.html) | [9t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu9t5v0/index.html) | 7k | 12% | 28% | 36k | 6 | [Racquet Wide 1x0.5](https://github.com/gregdavill/gf180mcu-racquet-1x0.5) |
| [AS04](https://wafer.space/ws-run2/projects/AS04.html) | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | 7k | 9% | 18% | 87k | 0 | [Multi-Project die using 3.3V SCL](https://github.com/AvalonSemiconductors/ws-submission-2026) |
| [AMM1](https://wafer.space/ws-run2/projects/AMM1.html) | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | 6k | 8% | 19% | 32k | 0 | [raybox-zero wafer.space run 2 half height](https://github.com/algofoogle/gf180ws2-raybox-zero) |
| [KIAN](https://wafer.space/ws-run2/projects/KIAN.html) | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | 6k | 8% | 16% | 77k | 21 | [KianV: A 32-bit RISC-V Linux SoC taped out on GF180MCU Run 2](https://github.com/splinedrive/gf180mcu-kianv-rv32ima-sv32-ws02) |
| [CAFE](https://wafer.space/ws-run2/projects/CAFE.html) | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | 5k | 7% | 15% | 9k | 0 | [Expresso Ethernet Chip: 100Mbps Ethernet switch + Heat death of the U…](https://github.com/Essenceia/Expresso_ASIC_Chip) |
| [SCMT](https://wafer.space/ws-run2/projects/SCMT.html) | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | 4k | 5% | 7% | 48k | 41 | [microTheia](https://github.com/dhgaddy/microTheia) |
| [PSOC](https://wafer.space/ws-run2/projects/PSOC.html) | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | 4k | 5% | 11% | 18k | 8 | [Simplest possible PicoSoC implementation using wafer.space flow](https://github.com/d-burnett/picosoc-on-waferspace) |

### Low Density (below 3k logic SC/mm² core average)

| Design | Library | Core SC/mm² | % of max | Cell area | Logic SC | SRAM | Project |
|---|---|---|---|---|---|---|---|
| [QZ80](https://wafer.space/ws-run2/projects/QZ80.html) | [9t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu9t5v0/index.html) | 3k | 5% | 10% | 5k | 0 | [FOSSi open-source replacement for Z80 classic 8-bit CPU (0.5 x 0.5 sl…](https://github.com/rejunity/ws0-z80-open-silicon-gf180mcu) |
| [DCO0](https://wafer.space/ws-run2/projects/DCO0.html) | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | 1k | 2% | 6% | 7k | 0 | [Standard Cell DCO+TDC](https://github.com/asinghani/ws-dco-tdc) |
| [HZ80](https://wafer.space/ws-run2/projects/HZ80.html) | [9t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu9t5v0/index.html) | 1k | 2% | 4% | 5k | 0 | [FOSSi open-source replacement for Z80 classic 8-bit CPU (0.5 x 1 slot)](https://github.com/rejunity/ws0-z80-open-silicon-gf180mcu) |
| [WSLG](https://wafer.space/ws-run2/projects/WSLG.html) | mixed | 1k | 1% | 4% | 14k | 0 | [wafer.space Logo](https://github.com/89Mods/ws-logo-die) |
| [AS16](https://wafer.space/ws-run2/projects/AS16.html) | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | 1k | 1% | 4% | 6k | 2 | [16-bit RISC CPU](https://github.com/SUD0NET/as16) |
| [SALU](https://wafer.space/ws-run2/projects/SALU.html) | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | 1k | 1% | 3% | 2k | 0 | [Simple ALU](https://github.com/StackDoubleFlow/alu_silicon) |
| [FS03](https://wafer.space/ws-run2/projects/FS03.html) | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | 1k | 1% | 2% | 4k | 0 | [Test chip with 5V SRAM blocks](https://gitlab.com/Chips4Makers/arrakeen-sram-testchip) |
| [FS01](https://wafer.space/ws-run2/projects/FS01.html) | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | 1k | 1% | 2% | 4k | 0 | [Test chip with 3.3V SRAM blocks using regular design rules](https://gitlab.com/Chips4Makers/arrakeen-sram-testchip) |
| [FS02](https://wafer.space/ws-run2/projects/FS02.html) | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | 1k | 1% | 2% | 3k | custom | [Test chip with 3.3V SRAM blocks using SRAM design rules](https://gitlab.com/Chips4Makers/arrakeen-sram-testchip) |

### Minimal (analog, custom or test structures)

These designs contain fewer than 1,000 logic standard cells:

| Design | Logic SC | Transistors | SRAM | Pads | Project |
|---|---|---|---|---|---|
| [0000](https://wafer.space/ws-run2/projects/0000.html) | 40 | 21k | 0 | 72 | [ICELab Test Chip](https://github.com/GTIceLab/ASHES-GF180nm) |
| [FC01](https://wafer.space/ws-run2/projects/FC01.html) | 0 | 0 | 0 | 12 | Flip Chip pad test version 1 |
| [ISHI](https://wafer.space/ws-run2/projects/ISHI.html) | 0 | 44k | 0 | 72 + 63 probe | [ISHI-KAI multi-project die 2](https://github.com/ishi-kai/ISHI-KAI_Multiple_Projects_WaferSapce-GF180-2) |
| [MEME](https://wafer.space/ws-run2/projects/MEME.html) | 226 | 171k | 0 | 72 | [Artwork Meme Chip](https://github.com/anfroholic/meme_chip) |
| [OCD3](https://wafer.space/ws-run2/projects/OCD3.html) | 123 | 158k | 4 | 72 | [3.3V SRAM test 2](https://github.com/RTimothyEdwards/gf180mcu_ocd_sram_test) |
| [RLCM](https://wafer.space/ws-run2/projects/RLCM.html) | 0 | 0 | 0 | 246 | [RLCM: Test Passives For GF180MCUD](https://github.com/EngGhaith/RLCM-Test-Passives-For-GF180MCUD) |

## Achieved Density — Peak 1mm x 1mm Regions

While the averages above include sparse regions, the densest 1mm x 1mm square found anywhere on a design shows the highest density it achieved. The square slides over the die in 100um steps and may not touch an SRAM macro.

| Design | Peak Logic SC/mm² | % of buffer max | Library |
|---|---|---|---|
| [SCUP](https://wafer.space/ws-run2/projects/SCUP.html) | 34k | 45% of 76k | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) |
| [CLON](https://wafer.space/ws-run2/projects/CLON.html) | 30k | 39% of 76k | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) |
| [EURO](https://wafer.space/ws-run2/projects/EURO.html) | 27k | 36% of 76k | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) |
| [DPK1](https://wafer.space/ws-run2/projects/DPK1.html) | 27k | 35% of 76k | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) |
| [BTX1](https://wafer.space/ws-run2/projects/BTX1.html) | 25k | 33% of 76k | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) |
| [T0P3](https://wafer.space/ws-run2/projects/T0P3.html) | 25k | 32% of 76k | mixed |
| [T26B](https://wafer.space/ws-run2/projects/T26B.html) | 25k | 32% of 76k | mixed |
| [MOLE](https://wafer.space/ws-run2/projects/MOLE.html) | 24k | 32% of 76k | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) |
| [T26A](https://wafer.space/ws-run2/projects/T26A.html) | 23k | 30% of 76k | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) |
| [TQVA](https://wafer.space/ws-run2/projects/TQVA.html) | 23k | 30% of 76k | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) |
| [DPK2](https://wafer.space/ws-run2/projects/DPK2.html) | 21k | 28% of 76k | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) |
| [AS04](https://wafer.space/ws-run2/projects/AS04.html) | 19k | 25% of 76k | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) |
| [CAB1](https://wafer.space/ws-run2/projects/CAB1.html) | 19k | 25% of 76k | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) |
| [AMM1](https://wafer.space/ws-run2/projects/AMM1.html) | 19k | 24% of 76k | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) |
| [GD04](https://wafer.space/ws-run2/projects/GD04.html) | 18k | 31% of 59k | [9t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu9t5v0/index.html) |

The highest achieved density on this reticle is 45% of the buffer theoretical maximum, observed in the densest 1mm² region of [SCUP](https://wafer.space/ws-run2/projects/SCUP.html). The rest of that area is consumed by larger cells, infrastructure cells and the gaps left for routing.

## Library Comparison

Comparing designs that use one library exclusively:

| Metric | [as_sc_mcu7t3v3 (AS 7-track, 3.3V)](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | [mcu7t5v0 (7-track, 5V)](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | [mcu9t5v0 (9-track, 5V)](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu9t5v0/index.html) |
|---|---|---|---|
| Designs using this library | 12 | 19 | 3 |
| Best core density | 20k SC/mm² · 26% of max ([BTX1](https://wafer.space/ws-run2/projects/BTX1.html)) | 25k SC/mm² · 33% of max ([CLON](https://wafer.space/ws-run2/projects/CLON.html)) | 7k SC/mm² · 12% of max ([GD04](https://wafer.space/ws-run2/projects/GD04.html)) |
| Best peak grid cell | 34k SC/mm² · 45% of max ([SCUP](https://wafer.space/ws-run2/projects/SCUP.html)) | 30k SC/mm² · 39% of max ([CLON](https://wafer.space/ws-run2/projects/CLON.html)) | 18k SC/mm² · 31% of max ([GD04](https://wafer.space/ws-run2/projects/GD04.html)) |
| Median core density | 10k SC/mm² · 13% of max | 5k SC/mm² · 7% of max | 3k SC/mm² · 5% of max |

Differences between libraries here reflect which designs chose which library as much as the libraries themselves; the theoretical difference from row height alone is in the table above.

## Most Common Logic Cell Types

The 15 most-used logic cell types across all unique designs on the reticle:

| Cell Type | Library | Instances | What it does |
|---|---|---|---|
| [`buff_2`](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | 216k | Buffer (2x drive) |
| [`nand2_1`](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/cells/nand2/gf180mcu_fd_sc_mcu7t5v0__nand2_1.html) | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | 162k | 2-input NAND gate |
| [`mux2_2`](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | 111k | 2-input multiplexer (2x drive) |
| [`dlybuff_2`](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | 99k | Delay buffer (2x drive) |
| [`dfxtp_2`](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | 99k | D flip-flop (1 bit storage, 2x drive) |
| [`oai21_1`](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/cells/oai21/gf180mcu_fd_sc_mcu7t5v0__oai21_1.html) | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | 71k | OR-AND-Invert compound gate |
| [`dffq_1`](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/cells/dffq/gf180mcu_fd_sc_mcu7t5v0__dffq_1.html) | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | 67k | D flip-flop (1 bit storage) |
| [`nor2_1`](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/cells/nor2/gf180mcu_fd_sc_mcu7t5v0__nor2_1.html) | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | 66k | 2-input NOR gate |
| [`xor2_1`](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/cells/xor2/gf180mcu_fd_sc_mcu7t5v0__xor2_1.html) | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | 65k | 2-input XOR gate |
| [`dlyb_1`](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/cells/dlyb/gf180mcu_fd_sc_mcu7t5v0__dlyb_1.html) | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | 62k | Delay buffer |
| [`xnor2_2`](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | 61k | 2-input XNOR gate (2x drive) |
| [`and2_2`](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | 61k | 2-input AND gate (2x drive) |
| [`clkinv_1`](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/cells/clkinv/gf180mcu_fd_sc_mcu7t5v0__clkinv_1.html) | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | 59k | Clock inverter |
| [`aoi21_1`](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/cells/aoi21/gf180mcu_fd_sc_mcu7t5v0__aoi21_1.html) | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) | 55k | AND-OR-Invert compound gate |
| [`dlxtp_2`](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | 54k | Latch (level-sensitive, 2x drive) |

Across the reticle there are 227k 2-input NAND gates and 208k flip-flops — 1.1 NAND2 gates per flip-flop.

## SRAM Block Usage

SRAM (Static Random-Access Memory) blocks are pre-designed memory macros. Unlike standard cells, which are composed by automated tools, SRAM blocks are hand-optimized fixed-size units designed to store data as densely as possible.

21 of the 40 designs include SRAM, holding 152 KiB of memory between them:

| Design | SRAM macros | SRAM bits | SRAM area | Logic SC | Project |
|---|---|---|---|---|---|
| [SCMT](https://wafer.space/ws-run2/projects/SCMT.html) | 41 | 280,576 | 5.58 mm² (43% of core) | 48k | [microTheia](https://github.com/dhgaddy/microTheia) |
| [SCML](https://wafer.space/ws-run2/projects/SCML.html) | 38 | 223,232 | 4.65 mm² (36% of core) | 111k | [ML-Audio SC](https://github.com/kjconway5/ML-Audio) |
| [KIAN](https://wafer.space/ws-run2/projects/KIAN.html) | 21 | 86,016 | 2.04 mm² (16% of core) | 77k | [KianV: A 32-bit RISC-V Linux SoC taped out on GF180MCU Run 2](https://github.com/splinedrive/gf180mcu-kianv-rv32ima-sv32-ws02) |
| [BTX1](https://wafer.space/ws-run2/projects/BTX1.html) | 19 | 71,680 | 1.76 mm² (14% of core) | 253k | BTX |
| [SCTP](https://wafer.space/ws-run2/projects/SCTP.html) | 17 | 139,264 | 2.64 mm² (20% of core) | 125k | [SlugTPU](https://github.com/SlugTPU/gf180mcu-slugtpu) |
| [MOLE](https://wafer.space/ws-run2/projects/MOLE.html) | 13 | 106,496 | 2.02 mm² (16% of core) | 212k | [FABulous FPGA](https://github.com/mole99/wsrun2-fabulous-fpga) |
| [NAX1](https://wafer.space/ws-run2/projects/NAX1.html) | 12 | 81,920 | 1.63 mm² (32% of core) | 50k | [Naxos CoB](https://github.com/ZeduloTech/Naxos) |
| [TQVE](https://wafer.space/ws-run2/projects/TQVE.html) | 10 | 77,824 | 1.50 mm² (86% of core) | 24k | TinyQV - RISC-V SoC with experimental pad setup |
| [DPK1](https://wafer.space/ws-run2/projects/DPK1.html) | 8 | 32,768 | 1.68 mm² (38% of core) | 66k | [bio180](https://github.com/dpks2003/bio-core) |
| [PSOC](https://wafer.space/ws-run2/projects/PSOC.html) | 8 | 32,768 | 1.68 mm² (33% of core) | 18k | [Simplest possible PicoSoC implementation using wafer.space flow](https://github.com/d-burnett/picosoc-on-waferspace) |
| [CAB1](https://wafer.space/ws-run2/projects/CAB1.html) | 6 | 20,480 | 1.13 mm² (23% of core) | 52k | [Cabrera CoB](https://github.com/ZeduloTech/Cabrera) |
| [GD04](https://wafer.space/ws-run2/projects/GD04.html) | 6 | 24,576 | 1.26 mm² (25% of core) | 36k | [Racquet Wide 1x0.5](https://github.com/gregdavill/gf180mcu-racquet-1x0.5) |
| [TQVD](https://wafer.space/ws-run2/projects/TQVD.html) | 5 | 32,768 | 0.66 mm² (38% of core) | 24k | [TinyQV - RISC-V SoC with HDMI output](https://github.com/MichaelBell/ws02-tinyQV) |
| [OCD3](https://wafer.space/ws-run2/projects/OCD3.html) | 4 | 14,848 | 0.37 mm² (7% of core) | 123 | [3.3V SRAM test 2](https://github.com/RTimothyEdwards/gf180mcu_ocd_sram_test) |
| [AS16](https://wafer.space/ws-run2/projects/AS16.html) | 2 | 8,192 | 0.42 mm² (8% of core) | 6k | [16-bit RISC CPU](https://github.com/SUD0NET/as16) |
| [T26A](https://wafer.space/ws-run2/projects/T26A.html) | 2 | 2,048 | 0.23 mm² (2% of core) | 144k | [Tiny Tapeout GF 26a](https://github.com/TinyTapeout/tinytapeout-gf-26a) |
| [T0P3](https://wafer.space/ws-run2/projects/T0P3.html) | 1 | 2,048 | 0.07 mm² (1% of core) | 119k | [Tiny Tapeout GF 0.3](https://github.com/TinyTapeout/tinytapeout-gf-0p3) |
| [TQVA](https://wafer.space/ws-run2/projects/TQVA.html) | 1 | 4,096 | 0.21 mm² (12% of core) | 36k | [TinyQV - Crowdsourced RISC-V SoC](https://github.com/MichaelBell/ws01-tinyQV) |
| [TQVC](https://wafer.space/ws-run2/projects/TQVC.html) | 1 | 4,096 | 0.21 mm² (4% of core) | 36k | [TinyQV - Crowdsourced RISC-V SoC (1x0.5)](https://github.com/MichaelBell/ws01-tinyQV) |
| [FS02](https://wafer.space/ws-run2/projects/FS02.html) | custom | — | 0.35 mm² (8% of core) | 3k | [Test chip with 3.3V SRAM blocks using SRAM design rules](https://gitlab.com/Chips4Makers/arrakeen-sram-testchip) |
| [T26B](https://wafer.space/ws-run2/projects/T26B.html) | custom | — | 0.01 mm² (<1% of core) | 156k | [Tiny Tapeout GF 26b](https://github.com/TinyTapeout/tinytapeout-gf-26b) |

SRAM macros are identified by cell name, and their area is the macro footprint. "custom" marks a design with SRAM marker shapes ([GDS 108/5](https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_04_1.html#drawn-layer-definition-and-abbreviation)) but no recognised macro, where the count and size are not known and the area is that of the marked bitcell arrays.

## SRAM vs Standard Cell Transistor Density

"Transistor density" here counts the number of distinct regions where a gate electrode (polysilicon, [GDS 30/0](https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_04_1.html#drawn-layer-definition-and-abbreviation)) crosses an active area (diffusion, [GDS 22/0](https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_04_1.html#drawn-layer-definition-and-abbreviation)) — each such crossing forms one transistor.

### Theoretical Maximum Transistor Density for Standard Cells

| Cell ([AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3)) | Width | Cells/mm² | Trans/cell | Trans/mm² theoretical max |
|---|---|---|---|---|
| [`inv_2`](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | 2.24 um | 114k | 4 | 456k/mm² |
| [`nand2_2`](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | 3.92 um | 65k | 8 | 521k/mm² |
| [`buff_2`](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | 3.36 um | 76k | 6 | 456k/mm² |
| [`dfxtp_2`](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) | 15.12 um | 17k | 26 | 439k/mm² |

| Cell ([7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html)) | Width | Cells/mm² | Trans/cell | Trans/mm² theoretical max |
|---|---|---|---|---|
| [`inv_1`](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/cells/inv/gf180mcu_fd_sc_mcu7t5v0__inv_1.html) | 2.24 um | 114k | 2 | 228k/mm² |
| [`nand2_1`](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/cells/nand2/gf180mcu_fd_sc_mcu7t5v0__nand2_1.html) | 2.80 um | 91k | 4 | 364k/mm² |
| [`buf_1`](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/cells/buf/gf180mcu_fd_sc_mcu7t5v0__buf_1.html) | 3.36 um | 76k | 4 | 304k/mm² |
| [`dffq_1`](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/cells/dffq/gf180mcu_fd_sc_mcu7t5v0__dffq_1.html) | 16.24 um | 16k | 24 | 377k/mm² |

| Cell ([9t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu9t5v0/index.html)) | Width | Cells/mm² | Trans/cell | Trans/mm² theoretical max |
|---|---|---|---|---|
| [`inv_1`](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu9t5v0/cells/inv/gf180mcu_fd_sc_mcu9t5v0__inv_1.html) | 2.24 um | 89k | 2 | 177k/mm² |
| [`nand2_1`](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu9t5v0/cells/nand2/gf180mcu_fd_sc_mcu9t5v0__nand2_1.html) | 2.80 um | 71k | 4 | 283k/mm² |
| [`buf_1`](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu9t5v0/cells/buf/gf180mcu_fd_sc_mcu9t5v0__buf_1.html) | 3.36 um | 59k | 4 | 236k/mm² |
| [`dffq_1`](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu9t5v0/cells/dffq/gf180mcu_fd_sc_mcu9t5v0__dffq_1.html) | 15.68 um | 13k | 24 | 304k/mm² |

| Cell ([AS extra 7t-5V](https://github.com/AvalonSemiconductors/gf180mcu_as_ex_mcu7t5v0)) | Width | Cells/mm² | Trans/cell | Trans/mm² theoretical max |
|---|---|---|---|---|
| [`dfxtp_2`](https://github.com/AvalonSemiconductors/gf180mcu_as_ex_mcu7t5v0) | 18.48 um | 14k | 26 | 359k/mm² |

### SRAM Macros

| Macro | Size | Trans/mm² | % of flip-flop max | Placements |
|---|---|---|---|---|
| [`gf180mcu_ocd_ip_sram__sram1024x8m8wm1`](https://github.com/RTimothyEdwards/gf180mcu_ocd_ip_sram/blob/main/cells/gf180mcu_ocd_ip_sram__sram1024x8m8wm1/gf180mcu_ocd_ip_sram__sram1024x8m8wm1.rst) | 301 x 516 um | 385k/mm² | 88% | 106 |
| [`gf180mcu_ocd_ip_sram__sram512x8m8wm1`](https://github.com/RTimothyEdwards/gf180mcu_ocd_ip_sram/blob/main/cells/gf180mcu_ocd_ip_sram__sram512x8m8wm1/gf180mcu_ocd_ip_sram__sram512x8m8wm1.rst) | 301 x 322 um | 332k/mm² | 76% | 47 |
| [`gf180mcu_ocd_ip_sram__sram256x8m8wm1`](https://github.com/RTimothyEdwards/gf180mcu_ocd_ip_sram/blob/main/cells/gf180mcu_ocd_ip_sram__sram256x8m8wm1/gf180mcu_ocd_ip_sram__sram256x8m8wm1.rst) | 301 x 225 um | 270k/mm² | 62% | 27 |
| [`gf180mcu_ocd_ip_sram__sram64x8m8wm1`](https://github.com/RTimothyEdwards/gf180mcu_ocd_ip_sram/blob/main/cells/gf180mcu_ocd_ip_sram__sram64x8m8wm1/gf180mcu_ocd_ip_sram__sram64x8m8wm1.rst) | 301 x 152 um | 173k/mm² | 39% | 1 |
| [`gf180mcu_fd_ip_sram__sram512x8m8wm1`](https://gf180mcu-pdk.readthedocs.io/en/latest/IPs/SRAM/gf180mcu_fd_ip_sram/cells/gf180mcu_fd_ip_sram__sram512x8m8wm1/gf180mcu_fd_ip_sram__sram512x8m8wm1.html) | 432 x 485 um | 154k/mm² | 35% | 36 |
| [`gf180mcu_fd_ip_sram__sram256x8m8wm1`](https://gf180mcu-pdk.readthedocs.io/en/latest/IPs/SRAM/gf180mcu_fd_ip_sram/cells/gf180mcu_fd_ip_sram__sram256x8m8wm1/gf180mcu_fd_ip_sram__sram256x8m8wm1.html) | 432 x 341 um | 124k/mm² | 28% | 2 |
| [`gf180mcu_fd_ip_sram__sram128x8m8wm1`](https://gf180mcu-pdk.readthedocs.io/en/latest/IPs/SRAM/gf180mcu_fd_ip_sram/cells/gf180mcu_fd_ip_sram__sram128x8m8wm1/gf180mcu_fd_ip_sram__sram128x8m8wm1.html) | 432 x 269 um | 98k/mm² | 22% | 2 |

The macro density includes the peripheral circuits (address decoders, sense amplifiers, I/O drivers) around the bitcell array, which is why larger macros of a family are denser than smaller ones.

### Best Standard Cell Regions

| Design | Peak 1mm² Trans/mm² | % of flip-flop max | Library |
|---|---|---|---|
| [SCUP](https://wafer.space/ws-run2/projects/SCUP.html) | 351k/mm² | 80% | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) |
| [MOLE](https://wafer.space/ws-run2/projects/MOLE.html) | 350k/mm² | 80% | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) |
| [T0P3](https://wafer.space/ws-run2/projects/T0P3.html) | 328k/mm² | 75% | mixed |
| [BTX1](https://wafer.space/ws-run2/projects/BTX1.html) | 322k/mm² | 73% | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3) |
| [EURO](https://wafer.space/ws-run2/projects/EURO.html) | 310k/mm² | 71% | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) |
| [T26B](https://wafer.space/ws-run2/projects/T26B.html) | 306k/mm² | 70% | mixed |
| [T26A](https://wafer.space/ws-run2/projects/T26A.html) | 297k/mm² | 68% | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) |
| [CLON](https://wafer.space/ws-run2/projects/CLON.html) | 290k/mm² | 66% | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html) |

Infrastructure cells are excluded from logic cell counts but their transistors (decoupling capacitors in particular) are included in transistor counts.

## Process Features and Voltages

Which transistor voltages and optional devices of the GF180MCU process the 40 designs use. Voltages count both the libraries a design chose (standard cells and SRAM) and transistors the designer drew. Devices count only what the designer drew: standard cells, SRAM macros, I/O pads and fill are left out, because every die has them. A single test structure counts the same as a large block.

| Transistor voltage | Designs | Which |
|---|---|---|
| [3.3 V](https://gf180mcu-pdk.readthedocs.io/en/latest/analog/spice/elec_specs/elec_specs_1.html) | 20 of 40 | [0000](https://wafer.space/ws-run2/projects/0000.html), [AS04](https://wafer.space/ws-run2/projects/AS04.html), [BTX1](https://wafer.space/ws-run2/projects/BTX1.html), [CAB1](https://wafer.space/ws-run2/projects/CAB1.html), [FS01](https://wafer.space/ws-run2/projects/FS01.html), [FS02](https://wafer.space/ws-run2/projects/FS02.html), [ISHI](https://wafer.space/ws-run2/projects/ISHI.html), [KIAN](https://wafer.space/ws-run2/projects/KIAN.html), [MOLE](https://wafer.space/ws-run2/projects/MOLE.html), [NAX1](https://wafer.space/ws-run2/projects/NAX1.html), [OCD3](https://wafer.space/ws-run2/projects/OCD3.html), [SCML](https://wafer.space/ws-run2/projects/SCML.html), [SCMT](https://wafer.space/ws-run2/projects/SCMT.html), [SCTP](https://wafer.space/ws-run2/projects/SCTP.html), [SCUP](https://wafer.space/ws-run2/projects/SCUP.html), [T0P3](https://wafer.space/ws-run2/projects/T0P3.html), [T26A](https://wafer.space/ws-run2/projects/T26A.html), [T26B](https://wafer.space/ws-run2/projects/T26B.html), [TQVD](https://wafer.space/ws-run2/projects/TQVD.html), [TQVE](https://wafer.space/ws-run2/projects/TQVE.html) |
| [5 V](https://gf180mcu-pdk.readthedocs.io/en/latest/analog/spice/elec_specs/elec_specs_3.html) | 27 of 40 | [0000](https://wafer.space/ws-run2/projects/0000.html), [AMM1](https://wafer.space/ws-run2/projects/AMM1.html), [AS16](https://wafer.space/ws-run2/projects/AS16.html), [CAB1](https://wafer.space/ws-run2/projects/CAB1.html), [CAFE](https://wafer.space/ws-run2/projects/CAFE.html), [CLON](https://wafer.space/ws-run2/projects/CLON.html), [DCO0](https://wafer.space/ws-run2/projects/DCO0.html), [DPK1](https://wafer.space/ws-run2/projects/DPK1.html), [DPK2](https://wafer.space/ws-run2/projects/DPK2.html), [EURO](https://wafer.space/ws-run2/projects/EURO.html), [FS01](https://wafer.space/ws-run2/projects/FS01.html), [FS02](https://wafer.space/ws-run2/projects/FS02.html), [FS03](https://wafer.space/ws-run2/projects/FS03.html), [GD04](https://wafer.space/ws-run2/projects/GD04.html), [HZ80](https://wafer.space/ws-run2/projects/HZ80.html), [ISHI](https://wafer.space/ws-run2/projects/ISHI.html), [MEME](https://wafer.space/ws-run2/projects/MEME.html), [NAX1](https://wafer.space/ws-run2/projects/NAX1.html), [PSOC](https://wafer.space/ws-run2/projects/PSOC.html), [QZ80](https://wafer.space/ws-run2/projects/QZ80.html), [SALU](https://wafer.space/ws-run2/projects/SALU.html), [T0P3](https://wafer.space/ws-run2/projects/T0P3.html), [T26A](https://wafer.space/ws-run2/projects/T26A.html), [T26B](https://wafer.space/ws-run2/projects/T26B.html), [TQVA](https://wafer.space/ws-run2/projects/TQVA.html), [TQVC](https://wafer.space/ws-run2/projects/TQVC.html), [WSLG](https://wafer.space/ws-run2/projects/WSLG.html) |
| [6 V](https://gf180mcu-pdk.readthedocs.io/en/latest/analog/spice/elec_specs/elec_specs_2.html) | 5 of 40 | [0000](https://wafer.space/ws-run2/projects/0000.html), [CAB1](https://wafer.space/ws-run2/projects/CAB1.html), [ISHI](https://wafer.space/ws-run2/projects/ISHI.html), [NAX1](https://wafer.space/ws-run2/projects/NAX1.html), [T0P3](https://wafer.space/ws-run2/projects/T0P3.html) |

| Device | Designs drawing it | Which |
|---|---|---|
| [High-resistance poly resistors](https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_10_03.html) | 8 of 40 | [AS04](https://wafer.space/ws-run2/projects/AS04.html), [CAB1](https://wafer.space/ws-run2/projects/CAB1.html), [ISHI](https://wafer.space/ws-run2/projects/ISHI.html), [NAX1](https://wafer.space/ws-run2/projects/NAX1.html), [OCD3](https://wafer.space/ws-run2/projects/OCD3.html), [T0P3](https://wafer.space/ws-run2/projects/T0P3.html), [T26A](https://wafer.space/ws-run2/projects/T26A.html), [TQVD](https://wafer.space/ws-run2/projects/TQVD.html) |
| [MIM capacitors](https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_10_4_2.html) | 7 of 40 | [0000](https://wafer.space/ws-run2/projects/0000.html), [AS04](https://wafer.space/ws-run2/projects/AS04.html), [CAB1](https://wafer.space/ws-run2/projects/CAB1.html), [ISHI](https://wafer.space/ws-run2/projects/ISHI.html), [NAX1](https://wafer.space/ws-run2/projects/NAX1.html), [OCD3](https://wafer.space/ws-run2/projects/OCD3.html), [RLCM](https://wafer.space/ws-run2/projects/RLCM.html) |
| [Unsalicided poly resistors](https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_10_01.html) | 6 of 40 | [AS04](https://wafer.space/ws-run2/projects/AS04.html), [CAB1](https://wafer.space/ws-run2/projects/CAB1.html), [ISHI](https://wafer.space/ws-run2/projects/ISHI.html), [MEME](https://wafer.space/ws-run2/projects/MEME.html), [NAX1](https://wafer.space/ws-run2/projects/NAX1.html), [T0P3](https://wafer.space/ws-run2/projects/T0P3.html) |
| [MOS capacitors](https://gf180mcu-pdk.readthedocs.io/en/latest/analog/model_parameters/LV/LV_6.html) | 3 of 40 | [AS04](https://wafer.space/ws-run2/projects/AS04.html), [ISHI](https://wafer.space/ws-run2/projects/ISHI.html), [T0P3](https://wafer.space/ws-run2/projects/T0P3.html) |
| [Diodes](https://gf180mcu-pdk.readthedocs.io/en/latest/analog/model_parameters/LV/LV_3.html) | 3 of 40 | [AS04](https://wafer.space/ws-run2/projects/AS04.html), [ISHI](https://wafer.space/ws-run2/projects/ISHI.html), [OCD3](https://wafer.space/ws-run2/projects/OCD3.html) |
| [Deep N-well](https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_07_03.html) | 3 of 40 | [0000](https://wafer.space/ws-run2/projects/0000.html), [ISHI](https://wafer.space/ws-run2/projects/ISHI.html), [T0P3](https://wafer.space/ws-run2/projects/T0P3.html) |
| [Salicided poly resistors](https://gf180mcu-pdk.readthedocs.io/en/latest/analog/model_parameters/LV/LV_4.html) | 1 of 40 | [AS04](https://wafer.space/ws-run2/projects/AS04.html) |
| [Diffusion resistors](https://gf180mcu-pdk.readthedocs.io/en/latest/analog/model_parameters/LV/LV_4.html) | 1 of 40 | [AS04](https://wafer.space/ws-run2/projects/AS04.html) |
| [Bipolar transistors](https://gf180mcu-pdk.readthedocs.io/en/latest/analog/model_parameters/LV/LV_5.html) | 1 of 40 | [T0P3](https://wafer.space/ws-run2/projects/T0P3.html) |
| [Schottky diodes](https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_10_14.html) | 1 of 40 | [0000](https://wafer.space/ws-run2/projects/0000.html) |
| [Native transistors](https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_10_05.html) | 0 of 40 | — |
| [10 V LDMOS](https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_10_12_1.html) | 0 of 40 | — |
| [N-well resistors](https://gf180mcu-pdk.readthedocs.io/en/latest/analog/model_parameters/LV/LV_4.html) | 0 of 40 | — |
| [Metal resistors](https://gf180mcu-pdk.readthedocs.io/en/latest/analog/model_parameters/LV/LV_4.html) | 0 of 40 | — |
| [Well diodes](https://gf180mcu-pdk.readthedocs.io/en/latest/analog/model_parameters/LV/LV_3.html) | 0 of 40 | — |
| [Zener diodes](https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_04_1.html) | 0 of 40 | — |
| [eFuses](https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_10_11.html) | 0 of 40 | — |
| [One-time programmable memory](https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_10_10.html) | 0 of 40 | — |
| [Inductors](https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_04_1.html) | 0 of 40 | — |

| Design | Voltages | Custom transistors 3.3 / 5 / 6 V | Devices drawn | I/O library |
|---|---|---|---|---|
| [0000](https://wafer.space/ws-run2/projects/0000.html) | 3.3 V, 5 V, 6 V | 24 / 16 / 96 | MIM capacitors (Metal4-Metal5), Deep N-well, Schottky diodes | fd_io |
| [AMM1](https://wafer.space/ws-run2/projects/AMM1.html) | 5 V | 0 / 0 / 0 | — | fd_io |
| [AS04](https://wafer.space/ws-run2/projects/AS04.html) | 3.3 V | 192 / 0 / 0 | MIM capacitors (Metal4-Metal5), MOS capacitors (only in apad), High-resistance poly resistors, Unsalicided poly resistors, Salicided poly resistors, Diffusion resistors, Diodes (only in apad) | ocd_io |
| [AS16](https://wafer.space/ws-run2/projects/AS16.html) | 5 V | 0 / 0 / 0 | — | fd_io |
| [BTX1](https://wafer.space/ws-run2/projects/BTX1.html) | 3.3 V | 0 / 0 / 0 | — | fd_io |
| [CAB1](https://wafer.space/ws-run2/projects/CAB1.html) | 3.3 V, 5 V, 6 V | 40 / 104 / 44 | MIM capacitors (Metal4-Metal5; only in simple_por), High-resistance poly resistors (only in simple_por), Unsalicided poly resistors | fd_io |
| [CAFE](https://wafer.space/ws-run2/projects/CAFE.html) | 5 V | 0 / 0 / 0 | — | fd_io |
| [CLON](https://wafer.space/ws-run2/projects/CLON.html) | 5 V | 0 / 0 / 0 | — | fd_io |
| [DCO0](https://wafer.space/ws-run2/projects/DCO0.html) | 5 V | 0 / 0 / 0 | — | fd_io |
| [DPK1](https://wafer.space/ws-run2/projects/DPK1.html) | 5 V | 0 / 0 / 0 | — | fd_io |
| [DPK2](https://wafer.space/ws-run2/projects/DPK2.html) | 5 V | 0 / 0 / 0 | — | fd_io |
| [EURO](https://wafer.space/ws-run2/projects/EURO.html) | 5 V | 0 / 0 / 0 | — | fd_io |
| [FC01](https://wafer.space/ws-run2/projects/FC01.html) | — | 0 / 0 / 0 | — | — |
| [FS01](https://wafer.space/ws-run2/projects/FS01.html) | 3.3 V, 5 V | 323,352 / 0 / 0 | — | fd_io |
| [FS02](https://wafer.space/ws-run2/projects/FS02.html) | 3.3 V, 5 V | 323,352 / 0 / 0 | — | fd_io |
| [FS03](https://wafer.space/ws-run2/projects/FS03.html) | 5 V | 0 / 323,352 / 0 | — | fd_io |
| [GD04](https://wafer.space/ws-run2/projects/GD04.html) | 5 V | 0 / 0 / 0 | — | fd_io, ws_io |
| [HZ80](https://wafer.space/ws-run2/projects/HZ80.html) | 5 V | 0 / 0 / 0 | — | fd_io, ws_io |
| [ISHI](https://wafer.space/ws-run2/projects/ISHI.html) | 3.3 V, 5 V, 6 V | 9,268 / 4,589 / 90 | MIM capacitors (Metal4-Metal5), MOS capacitors (only in fill10_supplyVDD), High-resistance poly resistors, Unsalicided poly resistors, Diodes, Deep N-well | fd_io |
| [KIAN](https://wafer.space/ws-run2/projects/KIAN.html) | 3.3 V | 0 / 0 / 0 | — | ocd_io |
| [MEME](https://wafer.space/ws-run2/projects/MEME.html) | 5 V | 0 / 0 / 0 | Unsalicided poly resistors | fd_io |
| [MOLE](https://wafer.space/ws-run2/projects/MOLE.html) | 3.3 V | 0 / 0 / 0 | — | ocd_io |
| [NAX1](https://wafer.space/ws-run2/projects/NAX1.html) | 3.3 V, 5 V, 6 V | 2 / 0 / 44 | MIM capacitors (Metal4-Metal5; only in simple_por), High-resistance poly resistors (only in simple_por), Unsalicided poly resistors | fd_io |
| [OCD3](https://wafer.space/ws-run2/projects/OCD3.html) | 3.3 V | 177 / 0 / 0 | MIM capacitors (Metal4-Metal5), High-resistance poly resistors, Diodes | ocd_io |
| [PSOC](https://wafer.space/ws-run2/projects/PSOC.html) | 5 V | 0 / 0 / 0 | — | fd_io |
| [QZ80](https://wafer.space/ws-run2/projects/QZ80.html) | 5 V | 0 / 0 / 0 | — | fd_io, ws_io |
| [RLCM](https://wafer.space/ws-run2/projects/RLCM.html) | — | 0 / 0 / 0 | MIM capacitors (Metal4-Metal5) | — |
| [SALU](https://wafer.space/ws-run2/projects/SALU.html) | 5 V | 0 / 0 / 0 | — | fd_io |
| [SCML](https://wafer.space/ws-run2/projects/SCML.html) | 3.3 V | 0 / 0 / 0 | — | fd_io |
| [SCMT](https://wafer.space/ws-run2/projects/SCMT.html) | 3.3 V | 0 / 0 / 0 | — | fd_io |
| [SCTP](https://wafer.space/ws-run2/projects/SCTP.html) | 3.3 V | 0 / 0 / 0 | — | fd_io |
| [SCUP](https://wafer.space/ws-run2/projects/SCUP.html) | 3.3 V | 0 / 0 / 0 | — | ocd_io |
| [T0P3](https://wafer.space/ws-run2/projects/T0P3.html) | 3.3 V, 5 V, 6 V | 14,805 / 4,426 / 80 | MOS capacitors, High-resistance poly resistors, Unsalicided poly resistors, Deep N-well, Bipolar transistors | ocd_io |
| [T26A](https://wafer.space/ws-run2/projects/T26A.html) | 3.3 V, 5 V | 24,850 / 0 / 0 | High-resistance poly resistors | ocd_io |
| [T26B](https://wafer.space/ws-run2/projects/T26B.html) | 3.3 V, 5 V | 38,977 / 7,382 / 0 | — | ocd_io |
| [TQVA](https://wafer.space/ws-run2/projects/TQVA.html) | 5 V | 0 / 0 / 0 | — | fd_io, ws_io |
| [TQVC](https://wafer.space/ws-run2/projects/TQVC.html) | 5 V | 0 / 0 / 0 | — | fd_io, ws_io |
| [TQVD](https://wafer.space/ws-run2/projects/TQVD.html) | 3.3 V | 0 / 0 / 0 | High-resistance poly resistors (only in r2r) | ocd_io |
| [TQVE](https://wafer.space/ws-run2/projects/TQVE.html) | 3.3 V | 0 / 0 / 0 | — | fd_io |
| [WSLG](https://wafer.space/ws-run2/projects/WSLG.html) | 5 V | 0 / 0 / 0 | — | fd_io, ws_io |

Detection uses the open GF180MCU layers: a transistor is gate polysilicon ([30/0](https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_04_1.html#drawn-layer-definition-and-abbreviation)) over diffusion ([22/0](https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_04_1.html#drawn-layer-definition-and-abbreviation)), thick oxide inside Dualgate ([55/0](https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_04_1.html#drawn-layer-definition-and-abbreviation)), 5 V where V5_XTOR ([112/1](https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_04_1.html#drawn-layer-definition-and-abbreviation)) also covers it and 6 V where it does not; MIM capacitors are FuseTop ([75/0](https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_04_1.html#drawn-layer-definition-and-abbreviation)) shapes; poly resistors are Poly2 under RES_MK ([110/5](https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_04_1.html#drawn-layer-definition-and-abbreviation)), high resistance under the Resistor layer ([62/0](https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_04_1.html#drawn-layer-definition-and-abbreviation)) and otherwise unsalicided under SAB ([49/0](https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_04_1.html#drawn-layer-definition-and-abbreviation)) or salicided. Other devices are found by their marker layers.

## Key Findings

1. The densest logic standard cell design, [CLON](https://wafer.space/ws-run2/projects/CLON.html) (Cloneless2), achieves **25k logic SC/mm²** averaged over its core (33% of buffer max), with a peak of **30k logic SC/mm²** in its densest 1mm² region.

2. Standard cell libraries in use: **[AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3)** (53% of logic cells), **[7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html)** (45% of logic cells), **[9t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu9t5v0/index.html)** (2% of logic cells), **[AS extra 7t-5V](https://github.com/AvalonSemiconductors/gf180mcu_as_ex_mcu7t5v0)** (<1% of logic cells).

3. The median digital design achieves **8k logic SC/mm²** over its core. 13 of 34 designs exceed 10k logic SC/mm².

4. The best standard cell region reaches **351k transistors/mm²** ([SCUP](https://wafer.space/ws-run2/projects/SCUP.html)); the most used SRAM macro, [`gf180mcu_ocd_ip_sram__sram1024x8m8wm1`](https://github.com/RTimothyEdwards/gf180mcu_ocd_ip_sram/blob/main/cells/gf180mcu_ocd_ip_sram__sram1024x8m8wm1/gf180mcu_ocd_ip_sram__sram1024x8m8wm1.rst), is 385k transistors/mm².

5. Infrastructure cells (fillers, taps, antenna diodes, ties) outnumber logic cells **2.8 to 1** across the reticle (6.8M vs 2.4M). Any density analysis must exclude these to avoid dramatically overstating actual logic content.

6. The most common logic cell is **[`buff_2`](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3)** (216k instances in [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3)).

## Per-Design Details

| Design | Cell | Die (mm) | Core mm² | Placements | Pads | Logic SC | Infra SC | Transistors | SRAM | Libraries |
|---|---|---|---|---|---|---|---|---|---|---|
| [0000](https://wafer.space/ws-run2/projects/0000.html) | `0000_chip_top_6_7` | 3.93 x 2.53 | 5.0 | 1 | 72 | 40 | 10 | 20,808 | 0 | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html): 40 |
| [AMM1](https://wafer.space/ws-run2/projects/AMM1.html) | `AMM1_chip_top_2_6` | 3.93 x 2.53 | 5.0 | 2 | 72 | 31,608 | 122,990 | 1,248,073 | 0 | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html): 31,608 |
| [AS04](https://wafer.space/ws-run2/projects/AS04.html) | `AS04_chip_top_10_0` | 3.93 x 5.12 | 12.9 | 1 | 74 | 87,322 | 494,369 | 1,761,176 | 0 | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3): 87,322 |
| [AS16](https://wafer.space/ws-run2/projects/AS16.html) | `AS16_chip_top_0_7` | 3.93 x 2.53 | 5.0 | 1 | 72 | 5,508 | 92,536 | 1,123,551 | 2 | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html): 5,508 |
| [BTX1](https://wafer.space/ws-run2/projects/BTX1.html) | `BTX1_chip_top_0_0` | 3.93 x 5.12 | 12.9 | 1 | 74 | 252,619 | 505,451 | 4,046,673 | 19 | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3): 252,619 |
| [CAB1](https://wafer.space/ws-run2/projects/CAB1.html) | `CAB1_chip_top_4_8` | 3.93 x 2.53 | 5.0 | 1 | 72 + 16 probe | 52,199 | 100,188 | 1,025,108 | 6 | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html): 52,199 |
| [CAFE](https://wafer.space/ws-run2/projects/CAFE.html) | `CAFE_chip_top_12_7` | 1.94 x 2.53 | 1.7 | 1 | 56 | 8,747 | 48,803 | 436,088 | 0 | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html): 8,747 |
| [CLON](https://wafer.space/ws-run2/projects/CLON.html) | `CLON_chip_top_2_0` | 3.93 x 5.12 | 12.9 | 1 | 32 | 323,612 | 486,920 | 3,653,694 | 0 | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html): 323,612 |
| [DCO0](https://wafer.space/ws-run2/projects/DCO0.html) | `DCO0_chip_top_0_6` | 3.93 x 2.53 | 5.0 | 1 | 72 | 7,139 | 100,281 | 1,172,973 | 0 | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html): 7,139 |
| [DPK1](https://wafer.space/ws-run2/projects/DPK1.html) | `DPK1_chip_top_12_4` | 1.94 x 5.12 | 4.5 | 1 | 72 | 66,232 | 120,983 | 1,052,339 | 8 | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html): 66,232 |
| [DPK2](https://wafer.space/ws-run2/projects/DPK2.html) | `DPK2_chip_top_13_7` | 1.94 x 2.53 | 1.7 | 1 | 56 | 33,464 | 73,753 | 476,941 | 0 | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html): 33,464 |
| [EURO](https://wafer.space/ws-run2/projects/EURO.html) | `EURO_chip_top_2_7` | 3.93 x 2.53 | 5.0 | 1 | 72 | 68,077 | 129,324 | 1,057,096 | 0 | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html): 68,077 |
| [FC01](https://wafer.space/ws-run2/projects/FC01.html) | `FC01_TOP_12_6` | 1.94 x 2.53 | 1.7 | 1 | 12 | 0 | 0 | 0 | 0 | — |
| [FS01](https://wafer.space/ws-run2/projects/FS01.html) | `FS01_chip_top_14_0` | 1.94 x 5.12 | 4.5 | 1 | 72 | 3,540 | 87,332 | 1,211,472 | 0 | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html): 3,540 |
| [FS02](https://wafer.space/ws-run2/projects/FS02.html) | `FS02_chip_top_13_0` | 1.94 x 5.12 | 4.5 | 1 | 72 | 3,492 | 88,252 | 1,222,914 | custom | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html): 3,492 |
| [FS03](https://wafer.space/ws-run2/projects/FS03.html) | `FS03_chip_top_12_0` | 1.94 x 5.12 | 4.5 | 1 | 72 | 3,788 | 78,222 | 1,094,448 | 0 | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html): 3,788 |
| [GD04](https://wafer.space/ws-run2/projects/GD04.html) | `GD04_chip_top_8_7` | 3.93 x 2.53 | 5.0 | 2 | 72 | 35,525 | 104,165 | 992,924 | 6 | [9t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu9t5v0/index.html): 35,525 |
| [HZ80](https://wafer.space/ws-run2/projects/HZ80.html) | `HZ80_chip_top_12_2` | 1.94 x 5.12 | 4.5 | 1 | 72 | 5,143 | 80,093 | 823,230 | 0 | [9t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu9t5v0/index.html): 5,143 |
| [ISHI](https://wafer.space/ws-run2/projects/ISHI.html) | `ISHI_ISHI-KAI_WS_RUN2_13_4` | 1.94 x 5.12 | 4.5 | 1 | 72 + 63 probe | 0 | 63 | 44,494 | 0 | — |
| [KIAN](https://wafer.space/ws-run2/projects/KIAN.html) | `KIAN_chip_top_4_0` | 3.93 x 5.12 | 12.9 | 1 | 74 | 76,850 | 445,794 | 2,350,409 | 21 | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3): 76,850 |
| [MEME](https://wafer.space/ws-run2/projects/MEME.html) | `MEME_chip_top_8_6` | 3.93 x 2.53 | 5.0 | 2 | 72 | 226 | 15,682 | 170,882 | 0 | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html): 226 |
| [MOLE](https://wafer.space/ws-run2/projects/MOLE.html) | `MOLE_chip_top_8_0` | 3.93 x 5.12 | 12.9 | 1 | 74 | 211,813 | 341,915 | 4,093,215 | 13 | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3): 211,813 |
| [NAX1](https://wafer.space/ws-run2/projects/NAX1.html) | `NAX1_chip_top_2_8` | 3.93 x 2.53 | 5.0 | 1 | 72 | 49,919 | 110,470 | 1,396,877 | 12 | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3): 49,717, [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html): 202 |
| [OCD3](https://wafer.space/ws-run2/projects/OCD3.html) | `OCD3_gf180mcu_ocd_sram2_top_4_7` | 3.93 x 2.53 | 5.0 | 1 | 72 | 123 | 442 | 158,397 | 4 | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3): 123 |
| [PSOC](https://wafer.space/ws-run2/projects/PSOC.html) | `PSOC_chip_top_6_6` | 3.93 x 2.53 | 5.0 | 1 | 72 | 18,372 | 86,401 | 1,052,766 | 8 | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html): 18,372 |
| [QZ80](https://wafer.space/ws-run2/projects/QZ80.html) | `QZ80_chip_top_14_6` | 1.94 x 2.53 | 1.7 | 1 | 56 | 5,096 | 36,102 | 339,056 | 0 | [9t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu9t5v0/index.html): 5,096 |
| [RLCM](https://wafer.space/ws-run2/projects/RLCM.html) | `RLCM_RLCMV4_filled_14_2` | 1.94 x 5.12 | 4.5 | 1 | 246 | 0 | 0 | 0 | 0 | — |
| [SALU](https://wafer.space/ws-run2/projects/SALU.html) | `SALU_chip_top_13_6` | 1.94 x 2.53 | 1.7 | 1 | 56 | 1,608 | 36,011 | 409,601 | 0 | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html): 1,608 |
| [SCML](https://wafer.space/ws-run2/projects/SCML.html) | `SCML_chip_top_6_2` | 3.93 x 5.12 | 12.9 | 1 | 74 | 111,492 | 303,499 | 3,591,810 | 38 | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3): 111,492 |
| [SCMT](https://wafer.space/ws-run2/projects/SCMT.html) | `SCMT_chip_top_2_2` | 3.93 x 5.12 | 12.9 | 1 | 74 | 47,523 | 269,002 | 2,949,999 | 41 | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3): 47,523 |
| [SCTP](https://wafer.space/ws-run2/projects/SCTP.html) | `SCTP_chip_top_0_2` | 3.93 x 5.12 | 12.9 | 1 | 74 | 124,628 | 443,248 | 3,217,831 | 17 | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3): 124,628 |
| [SCUP](https://wafer.space/ws-run2/projects/SCUP.html) | `SCUP_chip_top_4_2` | 3.93 x 5.12 | 12.9 | 1 | 74 | 239,123 | 684,932 | 3,785,178 | 0 | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3): 239,123 |
| [T0P3](https://wafer.space/ws-run2/projects/T0P3.html) | `T0P3_tt_gf_wrapper_6_0` | 3.93 x 5.12 | 12.9 | 1 | 74 | 118,911 | 216,633 | 1,981,726 | 1 | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html): 93,727, [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3): 25,184 |
| [T26A](https://wafer.space/ws-run2/projects/T26A.html) | `T26A_tt_gf_wrapper_0_4` | 3.93 x 5.12 | 12.9 | 1 | 74 | 144,419 | 318,284 | 2,866,098 | 2 | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html): 144,371, [9t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu9t5v0/index.html): 48 |
| [T26B](https://wafer.space/ws-run2/projects/T26B.html) | `T26B_tt_gf_wrapper_2_4` | 3.93 x 5.12 | 12.9 | 1 | 74 | 155,961 | 329,068 | 2,927,843 | custom | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html): 153,556, [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3): 2,405 |
| [TQVA](https://wafer.space/ws-run2/projects/TQVA.html) | `TQVA_chip_top_13_8` | 1.94 x 2.53 | 1.7 | 1 | 56 | 35,711 | 62,585 | 475,963 | 1 | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html): 35,711 |
| [TQVC](https://wafer.space/ws-run2/projects/TQVC.html) | `TQVC_chip_top_0_8` | 3.93 x 2.53 | 5.0 | 1 | 72 | 36,116 | 137,094 | 1,209,812 | 1 | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html): 36,116 |
| [TQVD](https://wafer.space/ws-run2/projects/TQVD.html) | `TQVD_chip_top_14_8` | 1.94 x 2.53 | 1.7 | 1 | 56 | 23,689 | 40,036 | 612,804 | 5 | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3): 23,689 |
| [TQVE](https://wafer.space/ws-run2/projects/TQVE.html) | `TQVE_chip_top_14_7` | 1.94 x 2.53 | 1.7 | 1 | 17 | 24,213 | 70,319 | 986,961 | 10 | [AS 7t-3.3V](https://github.com/AvalonSemiconductors/gf180mcu_as_sc_mcu7t3v3): 24,213 |
| [WSLG](https://wafer.space/ws-run2/projects/WSLG.html) | `WSLG_chip_top_10_2` | 3.93 x 5.12 | 12.9 | 1 | 74 | 14,290 | 145,520 | 1,506,245 | 0 | [7t-5V](https://gf180mcu-pdk.readthedocs.io/en/latest/digital/standard_cells/gf180mcu_fd_sc_mcu7t5v0/index.html): 12,598, [AS extra 7t-5V](https://github.com/AvalonSemiconductors/gf180mcu_as_ex_mcu7t5v0): 1,692 |

## Methodology

- **Logic cell counts** come from walking the layout hierarchy and counting instances of every cell whose name contains a standard cell library prefix, excluding types starting with `fill`, `endcap`, `filltie`, `fillcap`, `decap`, `tap`, `antenna`, `diode`, `tiel`, `tieh`.
- **Transistor counts** are the number of merged polygons in the boolean AND of the diffusion ([22/0](https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_04_1.html#drawn-layer-definition-and-abbreviation)) and gate polysilicon ([30/0](https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_04_1.html#drawn-layer-definition-and-abbreviation)) layers, leaving out dummy fill cells, whose diffusion and polysilicon squares overlap without forming transistors.
- **Core area** is each design's `CORE_AREA`, read from its own LibreLane config at the commit that was checked; where that could not be read, (die width − 0.884mm) x (die height − 0.884mm), the project template's core 442um in from each edge.
- **Cell dimensions** are the width and height of each standard cell's placement boundary ([GDS 0/0](https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_04_1.html#drawn-layer-definition-and-abbreviation)), measured from the cells present in this layout.
- **Theoretical maximum** = (1000um / cell width) x (1000um / row height).
- **Pads** are openings on the pad layer ([37/0](https://gf180mcu-pdk.readthedocs.io/en/latest/physical_verification/design_manual/drm_04_1.html#drawn-layer-definition-and-abbreviation)) at least 20um across. Those in the pad ring (within 400um of the die edge) or in a second ring of pads inside it are bond pads; the others are probe pads, shown as "+ N probe". Letters and logos on the pad layer are not pads.
- **Peak figures** are the densest 1mm x 1mm square anywhere inside each die, found by sliding the square in 100um steps over the die and skipping positions that touch an SRAM macro. Logic cells are placed by their origin and transistors by the centre of their gate.
- **SRAM macros** are counted by cell name. The `sram_block_count` column of the summary CSV is kept for comparison with earlier results; it counts SramCore marker shapes, of which each GF180MCU macro has two.
- Designs placed more than once on the reticle are counted once.

---

*Generated by [ws-run-reports](https://github.com/wafer-space/ws-run-reports) from `G802.oas` (md5 `57fa57f52eac82835a051f2a353e5a30`) in [wafer-space/ws-run2](https://github.com/wafer-space/ws-run2). Analysis method: [KLayout](https://www.klayout.de/) boolean geometry operations on GDS layers. Grid resolution: 1mm x 1mm. Density figures are rounded to the nearest 1k.*
