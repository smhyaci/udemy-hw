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
          - 8-bit `bit[7:0]`
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

  - initializing arrays
    - for unique values
      - `arr[] = '{1,2,3,4};`
    - repetitve values
      - `arr[] = '{6{1}}`

    - default value
      - for 2-state => default = 0
      - for 4-staet => default = x
        - `arr[] = `{default:0};`

  - traversal of arrays
    - for loop
    - repeat
    - foreach

## [Section 4] Verification Plan

- starts with a specification sheet
- generate testcases, descriptions of test case, and map specific features to a test case
- two general methodologies

  - constrained random testing (CRT)

    - better for large test space
    - can better cover edges cases outside the valid space
    - develop a cover group for each test case
      How do you evaluate when you've done enough testing
      - metrics is functional coverage -> 100% (the more confident you can be)
      -

  - directed testing (DT)

    - applying test cases to DUT
    - good for limited test space
    - focuses purely on valid values
      - can create hidden bugs

  - Layer Testbench Architecture
    -signal layer (1)

    - DUT and I/O is module interface
    - receive signal
    - sending DUT response

    - command layer (2)

      - drive signsals
      - receives command -> converts to DUT signal
      - applies stimulus and recieves DUT response
      - receives response -> command

    - functional layer (3)

      - schedules indivdual commands to send to above command layer
      - receive an entire set of stimuli to pass on

    - scenario layer (4)

      - generate sequences to verify to specific feature
      - check response

    - test layer (5)
      - control simulation until all stimulus for a feature is applied to DUT, recieve response, check against golden data

    ![Layer Visualization](/section-04/tb_arch.PNG)

      - transaction: contains variable for all i/o ports present in DUT & sharing them between classes
      - generator: generates random stimulus, sent it to driver
      -  recieved stimulus and triggers respectiev signal in DUT with help of Interface
    - monitor: receive response from DUT ad sent it to scoreboard
    - scoreboard: compare DUT response with Golden data
    -Enviroment: wrapper for DRIVER, GENERATOR, MONITOR, SCOREBOARD


  ## [Section 5] Verilog OOP


