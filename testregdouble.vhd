entity test is
end test;

architecture bench of test is

component registredouble is
    -- Déclaration des paramètres génériques
    generic(
        N : natural := 4;  -- Nombre de bits
        tco : time := 2 ns  -- Temps de propagation du registre
    );

    -- Déclaration des ports d'entrée et de sortie
    port(
        sel,H : bit;  -- sel : Sélection du multiplexeur, H : Horloge du registre
        A,B : in bit_vector(N-1 downto 0);  -- A et B : Entrées du multiplexeur
        R : out bit_vector(N-1 downto 0)  -- R : Sortie du registre
    );

end component;
for UUT : registredouble use entity work.registredouble(struct);
Signal sel,H : bit;
Signal A,B,R :  bit_vector(3 downto 0);
begin 
UUT: registredouble port map(sel,H,A,B,R);

H <= not H after 10 ns;
A <= "1001" after 20 ns, "1111" after 50 ns, "0110" after 80 ns, "1010" after 110 ns;
B <= "0001" after 10 ns, "1110" after 30 ns, "0101" after 60 ns, "1100" after 90 ns;
sel <= '1' after 35 ns, '0' after 70 ns, '1' after 100 ns;


end bench;

