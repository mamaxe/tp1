-- Déclaration de l'entité registredouble
entity registredouble is
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

end entity;
