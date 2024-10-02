-- Déclaration de l'entité multiplexeur
entity mux is
    generic(N:natural:=2;  -- Nombre de bits
    tmux:time:=4ns);  -- Temps de propagation du multiplexeur

    port(A,B : bit_vector(N downto 1);  -- Entrées du multiplexeur
    sel: bit;  -- Sélection du multiplexeur
    V: out bit_vector(N downto 1));  -- Sortie du multiplexeur
end mux;

-- Déclaration de l'entité registre
entity register1 is
    generic(N:natural:=2;  -- Nombre de bits
    tco:time:=2ns);  -- Temps de propagation du registre

    port(V: in bit_vector(N downto 1);  -- Entrée du registre
    H: in bit;  -- Horloge du registre
    R: out bit_vector(N downto 1));  -- Sortie du registre
end register1;

-- Architecture comportementale du multiplexeur
architecture muxbeh of mux is
begin
    process(A,B,sel)
    variable X: bit_vector(N downto 1);  -- Variable interne pour stocker la sortie
    begin
        if sel='0' then
            X:=A;  -- Si sel est 0, la sortie prend la valeur de A
        else
            X:=B;  -- Si sel est 1, la sortie prend la valeur de B
        end if;
        V<=X after tmux;  -- La sortie V prend la valeur de X après un délai tmux
    end process;
end muxbeh;

-- Architecture comportementale du registre
architecture regbeh of register1 is
begin 
    process(H)
    begin
        if H='1' and H'event then
            R<=V after tco;  -- Si H est 1 et qu'il y a un événement sur H, la sortie R prend la valeur de V après un délai tco
        end if;
    end process;
end regbeh;