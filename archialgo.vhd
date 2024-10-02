architecture beh of registredouble is
begin
    process(H)
    begin
        -- Vérifie si H est à '1' et s'il y a un événement sur H
        if H='1' and H'event then
            -- Sélectionne la source de la valeur de sortie R en fonction de sel
            case sel is 
                when '0'=> 
                    -- Si sel est '0', R prend la valeur de A
                    R<=A;
                when '1'=> 
                    -- Si sel est '1', R prend la valeur de B
                    R<=B;
            end case;
        end if;
    end process;
end beh;
