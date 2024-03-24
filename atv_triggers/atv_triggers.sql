CREATE TRIGGER Update_idx
AFTER UPDATE
ON indice
FOR EACH ROW
WHEN (OLD.IDH_Geral IS DISTINCT FROM NEW.IDH_Geral OR OLD.IDH_Educacao IS DISTINCT FROM NEW.IDH_Educacao OR OLD.IDH_Longevidade IS DISTINCT FROM NEW.IDH_Longevidade)
EXECUTE PROCEDURE preencher_idx();

CREATE OR REPLACE FUNCTION public.preencher_idx()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN                                                                                                                                             	UPDATE indice SET idx = NEW.idh_educacao * NEW.idh_educacao * NEW.idh_longevidade / NEW.idh_geral;
END                          	 
$function$;


