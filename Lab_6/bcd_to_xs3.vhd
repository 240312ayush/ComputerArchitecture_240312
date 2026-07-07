library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BCD_TO_XS3 is
    port (
        BCD : in  std_logic_vector(3 downto 0); -- BCD input (0-9)
        XS3 : out std_logic_vector(3 downto 0)  -- Excess-3 output
    );
end entity BCD_TO_XS3;

architecture Behavioral of BCD_TO_XS3 is
begin
    process (BCD)
    begin
        XS3 <= std_logic_vector(unsigned(BCD) + 3);
    end process;
end architecture Behavioral;
