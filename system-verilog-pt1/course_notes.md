# System Verilog Fundamentals Pt. 1

## [Section 1] IDE Setup
Not Applicable

## [Section 2] Procedural Constructs

### Signal Types
- Global (clk, rst)
  - Typically used with initial block
    - initialize variables
    - generate reset signal
    - executing system task (dumping waveform data)
- Data (rdata, wdata)
- Control (wr, raddr, waddr)

### Always Blocks Types
- Sensitivity list is usually ignored in verification
- Usually used to generate a clk signal
- `always_comb @(*)` – dependent on input
  - If an input changes -> we evaluate signal
- `always_ff @(posedge clk)` – sequential and dependent on clock signal
  - Evaluation occurs based on the clk edge
- `always_latch`


### Timescale Directives
- `timescale 1ns / 1 ps`
    - `1 ns` is the time unit
    - `1 ps` is the time precision unit
- ` 1 ns / 1 ps = 10^3`
    - 3 represents the number of valid decimals places
        - i.e. #10.3, #10.25, #10.599 but NOT #10.7787 (too much precision)
        - if a higher precision than allowed is used then the # is rounded

## [Section 3] Datatypes

- divided into two categories
  - 2-state(val 0, 1)
  - 4-state(val 0, 1, X, Z)

- used in three fashions
  - hardware (procedural and continuous assign)
    - `reg, wire` => can be wrapped into `logic` type
  - variable
    [comment]: <> (TODO: make this a table & add min and max values)
    - fixed
      - 2-state
        - signed
          - 8-bit `byte`
          - 16-bit `shortint`
          - 32-bit `int`
          - 64-bit `longint`
        - unsigned
          - 8-bit  `bit[7:0]`
          - 16-bit `bit[15:0]`
          - 32-bit `bit[31:0]`
      - 4-state
        - 32-bit signed `integer`
    - floating
      - `real`
  - simulation
    - fixed point
      - `time`

    - floating point
      - `realtime`

