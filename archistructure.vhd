architecture struct of registredouble is
    -- Déclaration du composant multiplexeur
    component mux
        generic(N:natural:=2;
                tmux : time := 4 ns);
        port(
            sel :bit;
            A,B : in bit_vector(N downto 1);
            V : out bit_vector(N downto 1));
    end component;

    -- Déclaration du composant registre
    component register1
        generic(N:natural:=2;
                tco : time := 2 ns);
        port(H:bit;
             V:in bit_vector(N downto 1);
             R: out bit_vector(N downto 1));
    end component;

    -- Signal interne pour connecter la sortie du multiplexeur à l'entrée du registre
    signal mux_out: bit_vector(N downto 1); -- Utilisez N au lieu de 1

begin
    -- Instanciation du multiplexeur
    b1: mux
    generic map(N=>N, tmux=>4 ns)
    port map(sel=>sel, A=>A, B=>B, V=>mux_out);

    -- Instanciation du registre
    b2: register1
    generic map(N=>N, tco=>2 ns)
    port map(H=>H, V=>mux_out, R=>R);

end struct;
