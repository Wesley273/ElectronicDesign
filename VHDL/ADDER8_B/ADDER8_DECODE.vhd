LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ADDER8_DECODE IS
    PORT (
        CIN : IN STD_LOGIC;
        AIN : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        BIN : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        SG_OUT : OUT STD_LOGIC_VECTOR(23 DOWNTO 0));
END ENTITY ADDER8_DECODE;

ARCHITECTURE BHV OF ADDER8_DECODE IS
    COMPONENT ADDER8_B IS
        PORT (
            CIN : IN STD_LOGIC;
            A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            SUM : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            COUT : OUT STD_LOGIC);
    END COMPONENT ADDER8_B;
    COMPONENT DECODER7 IS
        PORT (
            BIN_IN : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            SG_OUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
    END COMPONENT DECODER7;
    SIGNAL DATA : STD_LOGIC_VECTOR(11 DOWNTO 0) := "000000000000";
BEGIN
    ADDER : ADDER8_B PORT MAP(CIN => CIN, A => AIN, B => BIN, COUT => DATA(8), SUM => DATA(7 DOWNTO 0));
    DECODERLOW : DECODER7 PORT MAP(BIN_IN => DATA(3 DOWNTO 0), SG_OUT => SG_OUT(7 DOWNTO 0));
    DECODERHIGH : DECODER7 PORT MAP(BIN_IN => DATA(7 DOWNTO 4), SG_OUT => SG_OUT(15 DOWNTO 8));
    DECODERCOUT : DECODER7 PORT MAP(BIN_IN => DATA(11 DOWNTO 8), SG_OUT => SG_OUT(23 DOWNTO 16));
END ARCHITECTURE BHV;