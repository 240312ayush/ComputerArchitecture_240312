library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity COMPARATOR_2BIT is
    port (
        A  : in  std_logic_vector(1 downto 0);
        B  : in  std_logic_vector(1 downto 0);
        EQ : out std_logic; -- A = B
        GT : out std_logic; -- A > B
        LT : out std_logic  -- A < B
    );
end entity COMPARATOR_2BIT;

architecture Behavioral of COMPARATOR_2BIT is
    signal x1, x0 : std_logic;  -- XNOR outputs (bit-wise equality)
begin
    -- XNOR gates for bit-level equality detection
    x1 <= A(1) XNOR B(1);
    x0 <= A(0) XNOR B(0);

    -- EQ: all bit pairs must be equal
    EQ <= x1 AND x0;

    -- GT: A > B
    GT <= (A(1) AND (NOT B(1)))
       OR (x1 AND A(0) AND (NOT B(0)));

    -- LT: A < B
    LT <= ((NOT A(1)) AND B(1))
       OR (x1 AND (NOT A(0)) AND B(0));

end architecture Behavioral;