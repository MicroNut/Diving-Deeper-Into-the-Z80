--  A testbench for alu_slice_Slice_Logic_tb
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity alu_slice_Slice_Logic_tb is
end alu_slice_Slice_Logic_tb;

architecture behav of alu_slice_Slice_Logic_tb is
  component main
    port (
      op1: in std_logic;
      op2: in std_logic;
      S: in std_logic;
      R: in std_logic;
      cy_in: in std_logic;
      V: in std_logic;
      cy_out: out std_logic;
      result: out std_logic);
  end component;

  signal op1 : std_logic;
  signal op2 : std_logic;
  signal S : std_logic;
  signal R : std_logic;
  signal cy_in : std_logic;
  signal V : std_logic;
  signal cy_out : std_logic;
  signal result : std_logic;
  function to_string ( a: std_logic_vector) return string is
      variable b : string (1 to a'length) := (others => NUL);
      variable stri : integer := 1; 
  begin
      for i in a'range loop
          b(stri) := std_logic'image(a((i)))(2);
      stri := stri+1;
      end loop;
      return b;
  end function;
begin
  main_0 : main port map (
    op1 => op1,
    op2 => op2,
    S => S,
    R => R,
    cy_in => cy_in,
    V => V,
    cy_out => cy_out,
    result => result );
  process
    type pattern_type is record
      S : std_logic;
      V : std_logic;
      R : std_logic;
      cy_in : std_logic;
      op2 : std_logic;
      op1 : std_logic;
      result : std_logic;
      cy_out : std_logic;
    end record;
    type pattern_array is array (natural range <>) of pattern_type;
    constant patterns : pattern_array := (
      ('0', '0', '0', '0', '0', '0', '0', '0'), -- i=0
      ('0', '0', '0', '0', '0', '1', '1', '0'), -- i=1
      ('0', '0', '0', '0', '1', '1', '0', '1'), -- i=2
      ('0', '0', '0', '1', '0', '0', '1', '0'), -- i=3
      ('0', '0', '0', '1', '0', '1', '0', '1'), -- i=4
      ('0', '0', '0', '1', '1', '1', '1', '1'), -- i=5
      ('0', '0', '1', '0', '0', '0', '0', '0'), -- i=6
      ('0', '0', '1', '0', '0', '1', '1', '0'), -- i=7
      ('0', '0', '1', '0', '1', '0', '1', '0'), -- i=8
      ('0', '0', '1', '0', '1', '1', '0', '0'), -- i=9
      ('1', '0', '0', '1', '0', '0', '0', '1'), -- i=10
      ('1', '0', '0', '1', '0', '1', '0', '1'), -- i=11
      ('1', '0', '0', '1', '1', '0', '0', '1'), -- i=12
      ('1', '0', '0', '1', '1', '1', '1', '1'), -- i=13
      ('1', '1', '1', '0', '0', '0', '0', '0'), -- i=14
      ('1', '1', '1', '0', '0', '1', '1', '0'), -- i=15
      ('1', '1', '1', '0', '1', '0', '1', '0'), -- i=16
      ('1', '1', '1', '0', '1', '1', '1', '0'));
  begin
    for i in patterns'range loop
      op1 <= patterns(i).op1;
      op2 <= patterns(i).op2;
      S <= patterns(i).S;
      R <= patterns(i).R;
      cy_in <= patterns(i).cy_in;
      V <= patterns(i).V;
      wait for 10 ns;
      assert std_match(cy_out, patterns(i).cy_out) OR (cy_out = 'Z' AND patterns(i).cy_out = 'Z')
        report "wrong value for cy_out, i=" & integer'image(i)
         & ", expected " & std_logic'image(patterns(i).cy_out) & ", found " & std_logic'image(cy_out) severity error;assert std_match(result, patterns(i).result) OR (result = 'Z' AND patterns(i).result = 'Z')
        report "wrong value for result, i=" & integer'image(i)
         & ", expected " & std_logic'image(patterns(i).result) & ", found " & std_logic'image(result) severity error;end loop;
    wait;
  end process;
end behav;
